import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/states/camera_detection/camera_detection_event.dart';
import 'package:flutter_starter/data/states/camera_detection/camera_detection_state.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/data/states/camera_detection/camera_detection_bloc.dart';
import 'package:flutter_starter/gen/app_images.dart';
import 'package:flutter_starter/presenter/pages/camera_detection/camera_detection.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:permission_handler/permission_handler.dart';

// ignore: depend_on_referenced_packages
import 'package:google_mlkit_commons/google_mlkit_commons.dart'
    show
        InputImage,
        InputImageMetadata,
        InputImageFormat,
        InputImageFormatValue,
        InputImageRotation,
        InputImageRotationValue;

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
  Size? _capturedImageSize;
  CameraLensDirection _currentLensDirection = CameraLensDirection.back;

  String? _poseIdFromArgs;
  String? _jwtToken;
  String? _wsBase;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeCameraAndDetector();

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
      final blocState = _bloc.state;
      if (!blocState.showResult) _startStream();
    }
  }

  Future<void> _extractRouteArgsAndConnect() async {
    try {
      final route = ModalRoute.of(context);
      if (route != null && route.settings.arguments is Map) {
        final args = route.settings.arguments as Map;
        _jwtToken = args['token'] as String? ?? _jwtToken;
        _wsBase = args['wsBase'] as String? ?? _wsBase;
        if (args['poseId'] is String) _poseIdFromArgs = args['poseId'] as String;
        if (args['item'] != null && args['item'].id != null) {
          _poseIdFromArgs = args['item'].id as String;
        }
      }
    } catch (_) {}

    _wsBase ??= 'http://13.211.219.53:9080';

    // Connect socket via BLoC
    if (_jwtToken != null && _jwtToken!.isNotEmpty) {
      final wsUrl = '${_prepareWsUrlFromBase(_wsBase!)}/ws/pose';
      final headers = {'Authorization': 'Bearer ${_jwtToken!}'};
      _bloc.add(CameraDetectionEvent.connectSocket(
        wsUrl: wsUrl,
        headers: headers,
      ));
    }
  }

  String _prepareWsUrlFromBase(String base) {
    final trimmed = base.trim();
    if (trimmed.startsWith('http://')) {
      return trimmed.replaceFirst('http://', 'ws://').replaceAll(RegExp(r'/*$'), '');
    }
    if (trimmed.startsWith('https://')) {
      return trimmed.replaceFirst('https://', 'wss://').replaceAll(RegExp(r'/*$'), '');
    }
    return trimmed.replaceAll(RegExp(r'/*$'), '');
  }

  void _showError(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  Future<void> _switchCamera() async {
    if (_cameraController == null) return;
    final blocState = _bloc.state;
    if (blocState.isCountingDown) return;

    await _stopStream();
    await _cameraController!.dispose();
    _cameraController = null;

    _currentLensDirection = _currentLensDirection == CameraLensDirection.back
        ? CameraLensDirection.front
        : CameraLensDirection.back;

    await _initializeCameraAndDetector();
    _bloc.add(const CameraDetectionEvent.resetToLive());
    await _startStream();
  }

  Future<void> _startCountdownAndCapture() async {
    if (_cameraController == null) return;

    // Start countdown via BLoC
    _bloc.add(const CameraDetectionEvent.startCountdown());

    // Wait for countdown
    await Future.delayed(const Duration(seconds: 5));

    // Capture image
    await _captureAndDetect();
  }

  Future<void> _captureAndDetect() async {
    if (_cameraController == null || _poseDetector == null) return;

    try {
      await _stopStream();

      final XFile imageFile = await _cameraController!.takePicture();
      final imageBytes = await imageFile.readAsBytes();
      final decodedImage = await decodeImageFromList(imageBytes);
      final actualImageSize = Size(
        decodedImage.width.toDouble(),
        decodedImage.height.toDouble(),
      );

      setState(() {
        _capturedImageSize = actualImageSize;
      });

      final inputImage = InputImage.fromFilePath(imageFile.path);
      final poses = await _poseDetector!.processImage(inputImage);

      // Notify BLoC
      _bloc.add(CameraDetectionEvent.captureImage(
        imagePath: imageFile.path,
        imageBytes: imageBytes,
        poses: poses,
      ));

      // Upload via BLoC
      final poseId = _poseIdFromArgs ?? '-1';
      _bloc.add(CameraDetectionEvent.uploadPose(
        poseId: poseId,
        imagePath: imageFile.path,
        imageBytes: imageBytes,
        poses: poses,
      ));
    } catch (e) {
      debugPrint('❌ Error capturing/detecting: $e');
      _showError('Failed to capture or detect pose: $e');
      _bloc.add(const CameraDetectionEvent.resetToLive());
      await _startStream();
    }
  }

  Future<void> _resetToLiveMode() async {
    _bloc.add(const CameraDetectionEvent.resetToLive());
    setState(() {
      _capturedImageSize = null;
    });
    await _startStream();
  }

  Future<void> _initializeCameraAndDetector() async {
    try {
      final status = await Permission.camera.request();

      if (!status.isGranted) {
        _showError('Camera permission denied');
        return;
      }

      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        _showError('No cameras found');
        return;
      }

      final selectedCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == _currentLensDirection,
        orElse: () => cameras.first,
      );

      final controller = CameraController(
        selectedCamera,
        ResolutionPreset.high,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.yuv420,
      );

      await controller.initialize();

      if (controller.value.isInitialized) {
        _cameraController = controller;
      } else {
        await controller.dispose();
        _showError('Unable to initialize camera');
        return;
      }

      _previewSize = _cameraController!.value.previewSize;

      _poseDetector = PoseDetector(
        options: PoseDetectorOptions(
          mode: PoseDetectionMode.stream,
          model: PoseDetectionModel.accurate,
        ),
      );

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

      _bloc.add(CameraDetectionEvent.posesUpdated(poses));
    } catch (e) {
      _bloc.add(const CameraDetectionEvent.errorOccurred());
    } finally {
      _isProcessing = false;
    }
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
    _stopStream();
    _cameraController?.dispose();
    _poseDetector?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _controller = _cameraController;

    return Scaffold(
      backgroundColor: Colors.black,
      body: _controller == null || !_controller.value.isInitialized
          ? const Center(child: CircularProgressIndicator())
          : BlocConsumer<CameraDetectionBloc, CameraDetectionState>(
              listener: (context, state) {
                // Show errors
                if (state.status == CameraDetectionStatus.failure && state.error != null) {
                  _showError(state.error!.message);
                }

                // Show pose result
                if (state.poseResult != null) {
                  final data = state.poseResult!;
                  final score = data['score'];
                  final poseName = data['poseName'];
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Pose Result: $poseName - Score: $score'),
                      duration: const Duration(seconds: 5),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
              builder: (context, state) {
                return SafeArea(
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        child: Center(
                          child: Text(
                            state.showResult ? 'Pose Detected' : 'Live Camera',
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
                                // Camera preview or captured image
                                if (state.showResult && state.capturedImagePath != null)
                                  Image.file(
                                    File(state.capturedImagePath!),
                                    fit: BoxFit.contain,
                                  )
                                else
                                  CameraPreview(_controller),

                                // Pose skeleton
                                if (state.showResult &&
                                    state.capturedPoses.isNotEmpty &&
                                    _capturedImageSize != null)
                                  CustomPaint(
                                    painter: PosePainter(
                                      poses: state.capturedPoses,
                                      imageSize: _capturedImageSize!,
                                      isFrontCamera: _controller.description.lensDirection ==
                                          CameraLensDirection.front,
                                      showLabels: true,
                                    ),
                                  )
                                else if (!state.showResult && _previewSize != null)
                                  CustomPaint(
                                    painter: PosePainter(
                                      poses: state.poseList,
                                      imageSize: _previewSize!,
                                      isFrontCamera: _controller.description.lensDirection ==
                                          CameraLensDirection.front,
                                      showLabels: false,
                                    ),
                                  ),

                                if (state.isCountingDown && state.countdown > 0)
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
                                            '${state.countdown}',
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

                                // No pose detected
                                if (state.showResult && state.capturedPoses.isEmpty)
                                  Center(
                                    child: Container(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                                        ],
                                      ),
                                    ),
                                  ),

                                // Uploading indicator
                                if (state.status == CameraDetectionStatus.uploading)
                                  Container(
                                    color: Colors.black.withOpacity(0.5),
                                    child: const Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CircularProgressIndicator(color: Colors.white),
                                          SizedBox(height: 16),
                                          Text(
                                            'Uploading pose...',
                                            style: TextStyle(color: Colors.white, fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                // Camera flip button
                                if (!state.showResult && !state.isCountingDown)
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
                          child: state.showResult
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    cameraDetectionButton(
                                      AppImages.ic_video,
                                      Colors.blue,
                                      Colors.white,
                                      _resetToLiveMode,
                                    ),
                                    cameraDetectionButton(
                                      AppImages.ic_present,
                                      Colors.green,
                                      Colors.white,
                                      () async {
                                        await _resetToLiveMode();
                                        await _startCountdownAndCapture();
                                      },
                                    ),
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
                                    cameraDetectionButton(
                                      AppImages.ic_video,
                                      Colors.white,
                                      Colors.black,
                                      () async => await _startStream(),
                                    ),
                                    cameraDetectionButton(
                                      AppImages.ic_present,
                                      state.isCountingDown ? Colors.grey : Colors.green,
                                      Colors.white,
                                      state.isCountingDown ? () {} : _startCountdownAndCapture,
                                    ),
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
                );
              },
            ),
    );
  }
}
