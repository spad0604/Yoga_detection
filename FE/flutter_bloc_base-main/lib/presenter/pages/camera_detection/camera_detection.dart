import 'dart:async';
import 'dart:typed_data';
import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_starter/data/states/camera_detection/camera_detection_event.dart';
import 'package:flutter_starter/data/states/camera_detection/camera_detection_state.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/data/states/camera_detection/camera_detection_bloc.dart';
import 'package:flutter_starter/gen/app_images.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_starter/core/socket_isolate.dart';

// ignore: depend_on_referenced_packages
import 'package:google_mlkit_commons/google_mlkit_commons.dart'
    show
        InputImage,
        InputImageMetadata,
        InputImageFormat,
        InputImageFormatValue,
        InputImageRotation,
        InputImageRotationValue;

part 'camera_icon_button.dart';
part 'pose_painter.dart';

// TODO: Add the page to the router
@RoutePage()
class CameraDetectionPage extends StatefulWidget implements AutoRouteWrapper {
  const CameraDetectionPage();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CameraDetectionBloc>(
      create: (ctx) => provider.get<CameraDetectionBloc>(),
      child: this,
    );
  }

  @override
  State<CameraDetectionPage> createState() => _CameraDetectionPageState();
}

class _CameraDetectionPageState extends State<CameraDetectionPage> with WidgetsBindingObserver {
  CameraDetectionBloc get _bloc => context.read<CameraDetectionBloc>();

  CameraController? _cameraController;
  PoseDetector? _poseDetector;
  bool _isProcessing = false;
  Size? _previewSize;
  CameraLensDirection _currentLensDirection = CameraLensDirection.back;

  // Countdown and capture state
  int _countdown = 0;
  bool _isCountingDown = false;
  XFile? _capturedImage;
  List<Pose> _detectedPoses = [];
  bool _showResult = false;
  Size? _capturedImageSize; // Store actual captured image size

  // Socket isolate fields
  final WebSocketIsolate _ws = WebSocketIsolate();
  StreamSubscription<Map<String, dynamic>>? _wsSub;
  bool _wsConnected = false;
  String? _jwtToken;
  String? _wsBase; // e.g., ws://host:9080
  bool _usingAuthHeader = false;
  int? _poseIdFromArgs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeCameraAndDetector();

    // Extract route args (token, poseId, optional base) and connect socket once ready
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _extractRouteArgsAndConnect();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (_cameraController == null || !_cameraController!.value.isInitialized) return;

    if (state == AppLifecycleState.inactive) {
      _stopStream();
    } else if (state == AppLifecycleState.resumed) {
      if (!_showResult) _startStream();
    }
  }

  Future<void> _extractRouteArgsAndConnect() async {
    try {
      final route = ModalRoute.of(context);
      if (route != null && route.settings.arguments is Map) {
        final args = route.settings.arguments as Map;
        // Common keys: token, poseId or item.id, optional wsBase
        _jwtToken = args['token'] as String? ?? _jwtToken;
        _wsBase = args['wsBase'] as String? ?? _wsBase; // e.g. ws://13.211.229.143:9080
        if (args['poseId'] is int) _poseIdFromArgs = args['poseId'] as int;
        if (args['item'] != null && args['item'].id != null) {
          _poseIdFromArgs = args['item'].id as int;
        }
      }
    } catch (_) {}

    // Default base if not provided
    _wsBase ??= 'http://13.211.229.143:9080';

    // Subscribe to events once
    _wsSub ??= _ws.events.listen((event) {
      final type = event['type'];
      if (type == 'connected') {
        _wsConnected = true;
        debugPrint('WS connected: ${event['url']}');
        // Configure heartbeat and send a quick ping
        try {
          _ws.setPingInterval(const Duration(seconds: 15));
          _ws.sendPing('ping');
        } catch (_) {}
      } else if (type == 'closed' || type == 'disconnected') {
        _wsConnected = false;
        debugPrint('WS ${event['type']}');
      } else if (type == 'error') {
        _wsConnected = false;
        debugPrint('WS error: ${event['message']}');
      } else if (type == 'message') {
        debugPrint('  WS message: ${event['data']}');
      } else if (type == 'sent') {
        debugPrint('WS sent ${event['what']} ${event['bytes']} bytes');
      }
    });

    // Start isolate and connect (only once) — prefer Authorization header
    if (_jwtToken != null && _jwtToken!.isNotEmpty) {
      final headers = {'Authorization': 'Bearer ${_jwtToken!}'};
      try {
        // Use full ws url including /ws/pose when using headers
        final wsUrl = '${_prepareWsUrlFromBase(_wsBase!)}/ws/pose';
        await _ws.start(wsUrl, headers: headers);
        _usingAuthHeader = true;
      } catch (e) {
        debugPrint('Failed to start WS with /ws/pose using headers: $e');
        // Try fallbacks: base, /ws, /socket
        _usingAuthHeader = false;
        final base = _prepareWsUrlFromBase(_wsBase!);
        final fallbacks = [
          base, // root e.g. ws://host:port
          '$base/ws',
          '$base/socket',
        ];
        var connected = false;
        for (final candidate in fallbacks) {
          try {
            debugPrint('Trying fallback WS url: $candidate');
            await _ws.start(candidate, headers: headers);
            connected = true;
            _usingAuthHeader = true;
            break;
          } catch (e2) {
            debugPrint('Fallback $candidate failed: $e2');
          }
        }
        if (!connected) {
          debugPrint('All header-based WS attempts failed, falling back to token-in-url');
          _connectSocketIfNeeded(_buildPoseWsUrl());
        }
      }
    } else {
      _connectSocketIfNeeded(_buildPoseWsUrl());
    }
  }

  String _buildPoseWsUrl() {
    final base = _prepareWsUrlFromBase(_wsBase ?? 'http://13.211.229.143:9080');
    final tokenPart = (!_usingAuthHeader && _jwtToken != null && _jwtToken!.isNotEmpty)
        ? '?token=${Uri.encodeQueryComponent(_jwtToken!)}'
        : '';
    return '$base/ws/pose$tokenPart';
  }

  String _prepareWsUrlFromBase(String base) {
    // Convert http(s) to ws(s) and strip trailing slashes
    final trimmed = base.trim();
    if (trimmed.startsWith('http://')) {
      return trimmed.replaceFirst('http://', 'ws://').replaceAll(RegExp(r'/*$'), '');
    }
    if (trimmed.startsWith('https://')) {
      return trimmed.replaceFirst('https://', 'wss://').replaceAll(RegExp(r'/*$'), '');
    }
    // assume already ws:// or wss://
    return trimmed.replaceAll(RegExp(r'/*$'), '');
  }

  Future<void> _connectSocketIfNeeded(String url) async {
    if (_wsConnected) return;
    try {
      await _ws.start(url);
    } catch (e) {
      debugPrint('Failed to start/connect WS: $e');
    }
  }

  Future<void> _disconnectSocket() async {
    try {
      await _ws.stop();
    } catch (_) {}
    _wsConnected = false;
  }

  void _showError(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  Future<void> _switchCamera() async {
    if (_cameraController == null || _isCountingDown) return;

    await _stopStream();
    await _cameraController!.dispose();
    _cameraController = null;

    // Switch lens direction
    _currentLensDirection = _currentLensDirection == CameraLensDirection.back
        ? CameraLensDirection.front
        : CameraLensDirection.back;

    // Reinitialize with new camera
    await _initializeCameraAndDetector();

    // Clear previous results
    setState(() {
      _showResult = false;
      _capturedImage = null;
      _capturedImageSize = null;
      _detectedPoses = [];
    });

    // Restart stream
    await _startStream();
  }

  // Start countdown and capture after 5 seconds
  Future<void> _startCountdownAndCapture() async {
    if (_cameraController == null || _isCountingDown) return;

    setState(() {
      _isCountingDown = true;
      _countdown = 5;
      _showResult = false;
    });

    // Countdown from 5 to 1
    for (int i = 5; i > 0; i--) {
      if (!mounted || !_isCountingDown) return;
      setState(() => _countdown = i);
      await Future.delayed(const Duration(seconds: 1));
    }

    // Capture image
    await _captureAndDetect();

    setState(() {
      _isCountingDown = false;
      _countdown = 0;
    });
  }

  // Capture image and detect pose
  Future<void> _captureAndDetect() async {
    if (_cameraController == null || _poseDetector == null) return;

    try {
      // Stop stream before capturing
      await _stopStream();

      // Take picture
      final XFile imageFile = await _cameraController!.takePicture();
      debugPrint('📸 Image captured: ${imageFile.path}');

      // Get actual image dimensions
      final imageBytes = await imageFile.readAsBytes();
      final decodedImage = await decodeImageFromList(imageBytes);
      final actualImageSize = Size(
        decodedImage.width.toDouble(),
        decodedImage.height.toDouble(),
      );

      debugPrint('📐 Image size: ${actualImageSize.width}x${actualImageSize.height}');
      debugPrint('📐 Preview size: ${_previewSize?.width}x${_previewSize?.height}');

      // Process image with ML Kit
      final inputImage = InputImage.fromFilePath(imageFile.path);
      final poses = await _poseDetector!.processImage(inputImage);

      setState(() {
        _capturedImage = imageFile;
        _capturedImageSize = actualImageSize;
        _detectedPoses = poses;
        _showResult = true;
      });

      // Print pose data
      await _printPoseData(poses);

      // Send pose over WebSocket isolate (after countdown capture)
      await _sendPoseOverSocket(poses, imageBytes);
    } catch (e) {
      debugPrint('❌ Error capturing/detecting: $e');
      _showError('Failed to capture or detect pose: $e');
      setState(() {
        _isCountingDown = false;
        _countdown = 0;
        _showResult = false;
        _capturedImageSize = null;
      });
      // Restart stream on error
      await _startStream();
    }
  }

  Future<void> _sendPoseOverSocket(List<Pose> poses, Uint8List imageBytes) async {
    if (poses.isEmpty) return;
    // Build payload array with poseId, landmarks, imageBase64
    final poseId = _poseIdFromArgs ?? _readPoseIdFromRoute();
    final baseList = _posesToJson(poses, poseId: poseId);
    final b64 = base64Encode(imageBytes);
    final ts = DateTime.now().toIso8601String();
    final payload = baseList
        .map((e) => {
              ...e,
              'imageBase64': b64,
              'timestamp': ts,
            })
        .toList();

    // Print FULL JSON payload for backend team (including complete base64)
    try {
      final fullJson = jsonEncode(payload);
      debugPrint('\n${'=' * 60}');
      debugPrint('📤 FULL SOCKET PAYLOAD (send_data event)');
      debugPrint('${'=' * 60}');
      debugPrint('Event name: send_data');
      debugPrint(
          'Payload size: ${fullJson.length} chars (~${(fullJson.length / 1024).toStringAsFixed(1)} KB)');
      
      // Write to file for full payload (console may truncate large base64)
      try {
        final dir = await getApplicationDocumentsDirectory();
        final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-');
        final file = File('${dir.path}${Platform.pathSeparator}socket_payload_$timestamp.json');
        await file.writeAsString(fullJson);
        debugPrint('✅ Full JSON payload written to: ${file.path}');
        debugPrint('   Copy this file to share with backend team');
      } catch (e) {
        debugPrint('Failed to write payload to file: $e');
        // Fallback: print first 2000 chars
        debugPrint('JSON payload (first 2000 chars):');
        debugPrint(fullJson.substring(0, fullJson.length > 2000 ? 2000 : fullJson.length));
      }
      debugPrint('${'=' * 60}\n');
    } catch (e) {
      debugPrint('Failed to encode full JSON for logging: $e');
    }

    final url = _buildPoseWsUrl();
    await _connectSocketIfNeeded(url);
    try {
      _ws.sendPoseRequests(payload);
    } catch (e) {
      debugPrint('Failed to send pose over WS: $e');
    }
  }

  int _readPoseIdFromRoute() {
    int poseId = -1;
    try {
      final route = ModalRoute.of(context);
      if (route != null && route.settings.arguments is Map) {
        final args = route.settings.arguments as Map;
        if (args['item'] != null && args['item'].id != null) {
          poseId = args['item'].id as int;
        } else if (args['poseId'] != null) {
          poseId = args['poseId'] as int;
        }
      }
    } catch (_) {}
    return poseId;
  }

  // Print detailed pose data
  Future<void> _printPoseData(List<Pose> poses) async {
    if (poses.isEmpty) {
      debugPrint('\n⚠️ NO POSES DETECTED');
      debugPrint('=' * 60);
      return;
    }

    // Try to get poseId from ModalRoute (if available)
    int poseId = -1;
    try {
      final route = ModalRoute.of(context);
      if (route != null && route.settings.arguments is Map) {
        final args = route.settings.arguments as Map;
        if (args['item'] != null && args['item'].id != null) {
          poseId = args['item'].id as int;
        } else if (args['poseId'] != null) {
          poseId = args['poseId'] as int;
        }
      }
    } catch (_) {}

    debugPrint('\n' + '=' * 60);
    debugPrint('🎯 POSE DETECTION RESULTS');
    debugPrint('=' * 60);
    debugPrint('Total poses detected: ${poses.length}');

    for (int i = 0; i < poses.length; i++) {
      final pose = poses[i];
      debugPrint('\n--- Pose #${i + 1} ---');
      debugPrint('Total landmarks: ${pose.landmarks.length}');
      debugPrint('\nLandmark coordinates:');

      // Sort landmarks by type name for better readability
      final sortedEntries = pose.landmarks.entries.toList()
        ..sort((a, b) => a.key.toString().compareTo(b.key.toString()));

      for (final entry in sortedEntries) {
        final typeName = entry.key.toString().split('.').last;
        final lm = entry.value;
        debugPrint('  $typeName: '
            'x=${lm.x.toStringAsFixed(2)}, '
            'y=${lm.y.toStringAsFixed(2)}, '
            'z=${lm.z.toStringAsFixed(2)}, '
            'likelihood=${lm.likelihood.toStringAsFixed(3)}');
      }

      // Print JSON format
      debugPrint('\nJSON format:');
      final jsonData = _posesToJson([pose], poseId: poseId);
      debugPrint(jsonEncode(jsonData));

      // Write to file for full data in the app documents directory (safe on Android/iOS)
      try {
        final dir = await getApplicationDocumentsDirectory();
        final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-');
        final file = File('${dir.path}${Platform.pathSeparator}pose_data_$timestamp.json');
        await file.writeAsString(jsonEncode(jsonData));
        debugPrint('Full JSON written to ${file.path}');
      } catch (e) {
        // If filesystem isn't writable (e.g., restricted environment), fall back to printing
        debugPrint('Failed to write pose JSON to file: $e');
        debugPrint('Pose JSON:\n${jsonEncode(jsonData)}');
      }
    }

    debugPrint('=' * 60 + '\n');
  }

  // Reset to live preview mode
  Future<void> _resetToLiveMode() async {
    setState(() {
      _showResult = false;
      _capturedImage = null;
      _capturedImageSize = null;
      _detectedPoses = [];
    });
    await _startStream();
  }

  Future<void> _initializeCameraAndDetector() async {
    try {
      final status = await Permission.camera.request();

      if (!status.isGranted) {
        _showError('Camera permission denied. Please grant camera permission in settings.');
        return;
      }

      final cameras = await availableCameras();

      if (cameras.isEmpty) {
        _showError('No cameras found on this device.');
        return;
      }

      // Find the camera with the desired lens direction
      final selectedCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == _currentLensDirection,
        orElse: () => cameras.first, // Fallback to first available camera
      );

      // Try to initialize the selected camera
      try {
        final controller = CameraController(
          selectedCamera,
          ResolutionPreset.high, // Use high resolution for better pose detection
          enableAudio: false,
          imageFormatGroup: ImageFormatGroup.yuv420,
        );

        await controller.initialize();

        // Try to enable autofocus/exposure for a sharper preview
        try {
          await controller.setFocusMode(FocusMode.auto);
        } catch (_) {}
        try {
          // Center focus/exposure point (normalized 0..1)
          await controller.setFocusPoint(const Offset(0.5, 0.5));
        } catch (_) {}
        try {
          await controller.setExposureMode(ExposureMode.auto);
        } catch (_) {}
        try {
          await controller.setExposurePoint(const Offset(0.5, 0.5));
        } catch (_) {}

        if (controller.value.isInitialized) {
          _cameraController = controller;
        } else {
          await controller.dispose();
          _showError(
              'Unable to initialize camera. Please try restarting the app or check camera hardware.');
          return;
        }
      } catch (e) {
        _showError('Failed to initialize camera: ${e.toString()}');
        return;
      }

      _previewSize = _cameraController!.value.previewSize;

      // Use accurate pose detection for better results
      _poseDetector = PoseDetector(
        options: PoseDetectorOptions(
          mode: PoseDetectionMode.stream,
          model: PoseDetectionModel.accurate,
        ),
      );

      debugPrint('Camera initialized: ${_previewSize?.width}x${_previewSize?.height}');

      // Auto-start stream for live preview
      if (mounted) {
        await _startStream();
      }
    } catch (e) {
      _showError('Failed to initialize camera: ${e.toString()}');
    }
  }

  Uint8List _concatenatePlanes(List<Plane> planes) {
    final WriteBuffer allBytes = WriteBuffer();
    for (final plane in planes) {
      allBytes.putUint8List(plane.bytes);
    }
    return allBytes.done().buffer.asUint8List();
  }

  Future<void> _processCameraImage(CameraImage image) async {
    if (_isProcessing || _poseDetector == null || _cameraController == null) return;
    _isProcessing = true;
    try {
      final bytes = _concatenatePlanes(image.planes);

      final rotationEnum = InputImageRotationValue.fromRawValue(
            _cameraController!.description.sensorOrientation,
          ) ??
          InputImageRotation.rotation0deg;

      final formatEnum =
          InputImageFormatValue.fromRawValue(image.format.raw) ?? InputImageFormat.nv21;

      final metadata = InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotationEnum,
        format: formatEnum,
        bytesPerRow: image.planes.isNotEmpty ? image.planes[0].bytesPerRow : image.width,
      );

      final inputImage = InputImage.fromBytes(bytes: bytes, metadata: metadata);

      final poses = await _poseDetector!.processImage(inputImage);

      // Log detection results
      if (poses.isNotEmpty) {
        debugPrint(
            '✅ Detected ${poses.length} pose(s) with ${poses.first.landmarks.length} landmarks');

        // Optionally log JSON data for debugging (currently disabled for performance)
        // Uncomment to see full pose data:
        // try {
        //   final jsonData = _posesToJson(poses);
        //   debugPrint(jsonEncode(jsonData));
        // } catch (_) {
        //   // ignore serialization errors
        // }
      } else {
        // Only log occasionally to avoid spam
        if (DateTime.now().millisecondsSinceEpoch % 30 == 0) {
          debugPrint('⚠️ No poses detected - ensure person is fully visible in frame');
        }
      }

      _bloc.add(CameraDetectionEvent.posesUpdated(poses));
    } catch (e) {
      _bloc.add(const CameraDetectionEvent.errorOccurred());
    } finally {
      _isProcessing = false;
    }
  }

  // Convert the detected poses into a JSON-friendly structure.
  // Example output:
  // [
  //   {
  //     "landmarks": [
  //       {"type": "leftShoulder", "x": 123.4, "y": 567.8, "z": 0.0},
  //       ...
  //     ]
  //   }
  // ]
  List<Map<String, dynamic>> _posesToJson(List<Pose> poses, {required int poseId}) {
    final allTypes = PoseLandmarkType.values;
    return poses.map((pose) {
      final landmarksMap = pose.landmarks;
      final landmarksJson = allTypes.map((type) {
        final typeName = type.toString().split('.').last;
        final lm = landmarksMap[type];
        return {
          'type': typeName,
          'x': lm?.x ?? -1,
          'y': lm?.y ?? -1,
          'z': lm?.z ?? -1,
        };
      }).toList();
      return {
        'poseId': poseId,
        'landmarks': landmarksJson,
      };
    }).toList();
  }

  Future<void> _startStream() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) return;
    if (_cameraController!.value.isStreamingImages) return;
    await _cameraController!.startImageStream(_processCameraImage);
    _bloc.add(const CameraDetectionEvent.start());
    setState(() {});
  }

  Future<void> _stopStream() async {
    if (_cameraController == null) return;
    if (_cameraController!.value.isStreamingImages) {
      await _cameraController!.stopImageStream();
    }
    _bloc.add(const CameraDetectionEvent.stop());
    setState(() {});
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _stopStream(); // Stop stream first
    _cameraController?.dispose();
    _poseDetector?.close();
    _wsSub?.cancel();
    _disconnectSocket();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _controller = _cameraController;

    return Scaffold(
      backgroundColor: Colors.black,
      body: _controller == null || !_controller.value.isInitialized
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        _showResult ? 'Pose Detected' : 'Live Camera',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            // Show captured image or live camera preview
                            if (_showResult && _capturedImage != null)
                              Image.file(
                                File(_capturedImage!.path),
                                fit: BoxFit.contain, // Use contain to maintain aspect ratio
                              )
                            else
                              CameraPreview(_controller),

                            // Show pose skeleton when available
                            if (_showResult &&
                                _detectedPoses.isNotEmpty &&
                                _capturedImageSize != null)
                              CustomPaint(
                                painter: _PosePainter(
                                  poses: _detectedPoses,
                                  imageSize: _capturedImageSize!, // Use actual captured image size
                                  isFrontCamera: _controller.description.lensDirection ==
                                      CameraLensDirection.front,
                                  showLabels: true, // Show labels on captured image
                                ),
                              )
                            else if (!_showResult)
                              BlocBuilder<CameraDetectionBloc, CameraDetectionState>(
                                builder: (context, state) {
                                  final poses = state.poseList;
                                  if (_previewSize == null || poses.isEmpty) {
                                    return const SizedBox.shrink();
                                  }

                                  return CustomPaint(
                                    painter: _PosePainter(
                                      poses: poses,
                                      imageSize: _previewSize!,
                                      isFrontCamera: _controller.description.lensDirection ==
                                          CameraLensDirection.front,
                                      showLabels: false,
                                    ),
                                  );
                                },
                              ),

                            // Countdown overlay (mờ ở giữa màn hình)
                            if (_isCountingDown && _countdown > 0)
                              Container(
                                color: Colors.black.withOpacity(0.3),
                                child: Center(
                                  child: Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.6),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '$_countdown',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 72,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            // No pose detected message (only on result view)
                            if (_showResult && _detectedPoses.isEmpty)
                              Center(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.error_outline, color: Colors.white, size: 48),
                                      SizedBox(height: 10),
                                      Text(
                                        'No Pose Detected',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Please try again with better positioning',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            // Camera flip button (only in live mode)
                            if (!_showResult && !_isCountingDown)
                              Positioned(
                                bottom: 20,
                                right: 20,
                                child: FloatingActionButton(
                                  onPressed: _switchCamera,
                                  backgroundColor: Colors.black.withOpacity(0.7),
                                  child: const Icon(
                                    Icons.flip_camera_ios,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SafeArea(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: _showResult
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Back to live view
                                cameraDetectionButton(
                                  AppImages.ic_video,
                                  Colors.blue,
                                  Colors.white,
                                  _resetToLiveMode,
                                ),
                                // Capture again
                                cameraDetectionButton(
                                  AppImages.ic_present,
                                  Colors.green,
                                  Colors.white,
                                  () async {
                                    await _resetToLiveMode();
                                    await _startCountdownAndCapture();
                                  },
                                ),
                                // Close
                                cameraDetectionButton(
                                  AppImages.ic_close,
                                  Colors.red,
                                  Colors.white,
                                  () => context.router.maybePop(),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Start stream
                                cameraDetectionButton(
                                  AppImages.ic_video,
                                  Colors.white,
                                  Colors.black,
                                  () async => await _startStream(),
                                ),
                                // Capture with countdown
                                cameraDetectionButton(
                                  AppImages.ic_present,
                                  _isCountingDown ? Colors.grey : Colors.green,
                                  Colors.white,
                                  _isCountingDown ? () {} : _startCountdownAndCapture,
                                ),
                                // Close
                                cameraDetectionButton(
                                  AppImages.ic_close,
                                  Colors.red,
                                  Colors.white,
                                  () async {
                                    await _stopStream();
                                    context.router.maybePop();
                                  },
                                )
                              ],
                            ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
