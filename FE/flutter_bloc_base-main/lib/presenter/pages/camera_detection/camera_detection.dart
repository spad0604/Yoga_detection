import 'dart:async';
import 'dart:typed_data';
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/presenter/navigation/navigation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_starter/data/states/camera_detection/camera_detection_event.dart';
import 'package:flutter_starter/data/states/camera_detection/camera_detection_state.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/data/states/camera_detection/camera_detection_bloc.dart';
import 'package:flutter_starter/gen/app_images.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_starter/data/entities/request/post_yoga_pose_model.dart';
import 'package:flutter_starter/data/usecases/post_yoga_pose_uc.dart';
import 'package:flutter_starter/data/entities/response/yoga_pose_details.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_starter/presenter/languages/translation_keys.g.dart';
import 'package:flutter_starter/core/utils/image_crop_helper.dart';

// ignore: depend_on_referenced_packages
import 'package:google_mlkit_commons/google_mlkit_commons.dart'
    show
        InputImage,
        InputImageMetadata,
        InputImageFormat,
        InputImageFormatValue,
        InputImageRotation;

part 'camera_icon_button.dart';
part 'pose_painter.dart';

// TODO: Add the page to the router
@RoutePage()
class CameraDetectionPage extends StatefulWidget implements AutoRouteWrapper {
  final String? poseId;
  final YogaPoseDetails? item;

  const CameraDetectionPage({super.key, this.poseId, this.item});

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

  // Distance detection and TTS
  FlutterTts? _flutterTts;
  String _distanceStatus = ''; // 'too_close', 'too_far', 'perfect'
  DateTime? _lastSpeechTime;
  bool _autoCountdownEnabled = true;
  DateTime? _perfectPositionStartTime;
  static const _perfectPositionDuration =
      Duration(seconds: 2); // Hold perfect position for 2s before countdown

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // Lock orientation to portrait for better tracking accuracy
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    _initializeTts();
    _initializeCameraAndDetector();
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

  void _showError(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  // Initialize Text-to-Speech
  Future<void> _initializeTts() async {
    _flutterTts = FlutterTts();
    await _flutterTts?.setLanguage("vi-VN"); // Force Vietnamese
    await _flutterTts?.setSpeechRate(0.5);
    await _flutterTts?.setVolume(1.0);
    await _flutterTts?.setPitch(1.0);
  }

  // Speak guidance message (with debounce to avoid spam)
  Future<void> _speak(String message) async {
    if (_flutterTts == null) return;

    final now = DateTime.now();
    if (_lastSpeechTime != null && now.difference(_lastSpeechTime!) < const Duration(seconds: 3)) {
      return; // Debounce: don't speak if last speech was less than 3 seconds ago
    }

    _lastSpeechTime = now;
    await _flutterTts?.speak(message);
  }

  // Calculate distance based on shoulder width (approximate)
  double _calculateDistance(Pose pose) {
    final leftShoulder = pose.landmarks[PoseLandmarkType.leftShoulder];
    final rightShoulder = pose.landmarks[PoseLandmarkType.rightShoulder];

    if (leftShoulder == null || rightShoulder == null) return 0;

    // Calculate shoulder width in pixels
    final dx = leftShoulder.x - rightShoulder.x;
    final dy = leftShoulder.y - rightShoulder.y;
    final shoulderWidth = (dx * dx + dy * dy).toDouble().abs();

    return shoulderWidth;
  }

  // Check distance and provide guidance
  Future<void> _checkDistanceAndGuide(List<Pose> poses) async {
    if (poses.isEmpty || _isCountingDown || _showResult) {
      _perfectPositionStartTime = null;
      return;
    }

    final distance = _calculateDistance(poses.first);
    String newStatus = '';
    String? guidanceMessage;

    // Thresholds (adjust based on testing)
    const double tooCloseThreshold = 50000.0; // If shoulder width > this, too close
    const double tooFarThreshold = 10000.0; // If shoulder width < this, too far

    if (distance > tooCloseThreshold) {
      newStatus = 'too_close';
      guidanceMessage = LocaleKeys.MoveFurtherAway.tr();
      _perfectPositionStartTime = null;
    } else if (distance < tooFarThreshold && distance > 0) {
      newStatus = 'too_far';
      guidanceMessage = LocaleKeys.MoveCloser.tr();
      _perfectPositionStartTime = null;
    } else if (distance > 0) {
      newStatus = 'perfect';
      guidanceMessage = LocaleKeys.HoldStill.tr();

      // Start timing perfect position
      if (_perfectPositionStartTime == null) {
        _perfectPositionStartTime = DateTime.now();
      } else {
        // Check if user has held perfect position long enough
        final holdDuration = DateTime.now().difference(_perfectPositionStartTime!);
        if (holdDuration >= _perfectPositionDuration && _autoCountdownEnabled && !_isCountingDown) {
          // Auto-trigger countdown
          _speak(LocaleKeys.PreparingToCapture.tr());
          await Future.delayed(const Duration(milliseconds: 500));
          _startCountdownAndCapture();
          return;
        }
      }
    }

    // Update status and speak if changed
    if (newStatus != _distanceStatus) {
      setState(() => _distanceStatus = newStatus);
      if (guidanceMessage != null) {
        _speak(guidanceMessage);
      }
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

    // Ensure flash is OFF before countdown
    try {
      await _cameraController!.setFlashMode(FlashMode.off);
    } catch (_) {}

    // Countdown from 5 to 1
    for (int i = 5; i > 0; i--) {
      if (!mounted || !_isCountingDown) return;
      setState(() => _countdown = i);
      await Future.delayed(const Duration(seconds: 1));
    }

    // Capture image ONCE
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

      // Ensure flash is OFF
      try {
        await _cameraController!.setFlashMode(FlashMode.off);
      } catch (_) {}

      // Take picture ONCE
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

      // Get device orientation for proper image processing
      final orientation = MediaQuery.of(context).orientation;
      debugPrint('📱 Device orientation: ${orientation.name}');

      // Process image with ML Kit with proper rotation
      final inputImage = InputImage.fromFilePath(imageFile.path);
      final poses = await _poseDetector!.processImage(inputImage);

      debugPrint('🎯 Detected ${poses.length} pose(s)');

      setState(() {
        _capturedImage = imageFile;
        _capturedImageSize = actualImageSize;
        _detectedPoses = poses;
        _showResult = true;
      });

      // Print pose data
      await _printPoseData(poses);

      // Upload pose via HTTP (direct upload after countdown capture)
      await _uploadPoseViaHTTP(poses, imageBytes);
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

  Future<void> _uploadPoseViaHTTP(List<Pose> poses, Uint8List imageBytes) async {
    if (poses.isEmpty) return;

    // Build landmark data
    final poseId = widget.poseId ?? _readPoseIdFromRoute();
    final landmarksJson = _posesToJson(poses, poseId: poseId);

    // Save image to temp file
    try {
      final dir = await getApplicationDocumentsDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final imagePath = '${dir.path}${Platform.pathSeparator}pose_image_$timestamp.jpg';
      await File(imagePath).writeAsBytes(imageBytes);

      // Crop image to focus on person
      debugPrint('🔲 Cropping image to focus on person...');
      final croppedImagePath = await ImageCropHelper.cropImageToPerson(
        originalImagePath: imagePath,
        poses: poses,
        paddingFactor: 0.15, // 15% padding
      );

      // Create model with landmarks
      final landmarks = landmarksJson.isNotEmpty
          ? (landmarksJson.first['landmarks'] as List)
              .map((lm) => PoseLandmarkData(
                    type: lm['type'],
                    x: lm['x'].toDouble(),
                    y: lm['y'].toDouble(),
                    z: lm['z'].toDouble(),
                  ))
              .toList()
          : <PoseLandmarkData>[];

      final model = PostYogaPoseModel(
        poseId: poseId,
        landmarks: landmarks,
        timestamp: DateTime.now().toIso8601String(),
      );

      // Upload via HTTP (wait for API response and then show result)
      debugPrint('\n${'=' * 60}');
      debugPrint('📤 UPLOADING POSE VIA HTTP');
      debugPrint('${'=' * 60}');
      debugPrint('Pose ID: $poseId');
      debugPrint('Original image path: $imagePath');
      debugPrint('Cropped image path: $croppedImagePath');
      debugPrint('Landmarks count: ${landmarks.length}');
      debugPrint('Waiting for API response...');
      debugPrint('${'=' * 60}\n');

      final useCase = provider<PostYogaPoseUC>();
      // Show waiting page while calling API
      if (mounted) {
        context.router.push(const WaitingResultRoute());
      }

      final result = await useCase(PostYogaPoseParams(
        imagePath: croppedImagePath, // Use cropped image
        model: model,
      ));

      debugPrint('✅ Pose uploaded successfully. Got immediate result from API');

      // Navigate to pretty result screen
      if (mounted) {
        // Try to pass poseName from args if available
        String? poseName;
        try {
          final route = ModalRoute.of(context);
          if (route != null && route.settings.arguments is Map) {
            final args = route.settings.arguments as Map;
            if (args['item'] != null && args['item'].name != null) {
              poseName = args['item'].name as String?;
            } else if (args['poseName'] is String) {
              poseName = args['poseName'] as String;
            }
          }
        } catch (_) {}

        context.router.replace(PoseResultRoute(result: result, poseName: poseName));
      }

      // Clean up temp file
      try {
        await File(imagePath).delete();
      } catch (e) {
        debugPrint('Failed to delete temp image: $e');
      }
    } catch (e) {
      debugPrint('❌ Failed to upload pose via HTTP: $e');
      _showError('Failed to upload pose: $e');
    }
  }

  String _readPoseIdFromRoute() {
    // First try to get from widget parameters
    if (widget.poseId != null) return widget.poseId ?? '';

    String poseId = '';
    try {
      final route = ModalRoute.of(context);
      if (route != null && route.settings.arguments is Map) {
        final args = route.settings.arguments as Map;
        if (args['item'] != null && args['item'].id != null) {
          poseId = args['item'].id;
        } else if (args['poseId'] != null) {
          poseId = args['poseId'];
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
    String poseId = '';
    try {
      final route = ModalRoute.of(context);
      if (route != null && route.settings.arguments is Map) {
        final args = route.settings.arguments as Map;
        if (args['item'] != null && args['item'].id != null) {
          poseId = args['item'].id;
        } else if (args['poseId'] != null) {
          poseId = args['poseId'];
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
          imageFormatGroup:
              ImageFormatGroup.nv21, // Changed from yuv420 to nv21 for ML Kit compatibility
        );

        await controller.initialize();

        // Disable flash completely
        try {
          await controller.setFlashMode(FlashMode.off);
        } catch (_) {}

        // Set focus mode to auto for continuous autofocus
        try {
          await controller.setFocusMode(FocusMode.auto);
        } catch (_) {}

        // Set exposure mode to auto
        try {
          await controller.setExposureMode(ExposureMode.auto);
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

      // Use accurate pose detection with static mode for better accuracy
      // Use stream mode for live preview, but switch to single image mode for capture
      _poseDetector = PoseDetector(
        options: PoseDetectorOptions(
          mode: PoseDetectionMode.stream, // Stream mode for live tracking
          model: PoseDetectionModel.accurate, // Accurate model for better results
        ),
      );

      debugPrint('Camera initialized: ${_previewSize?.width}x${_previewSize?.height}');
      debugPrint('Pose detector mode: stream, model: accurate');

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

      // Get proper rotation based on device orientation and camera sensor
      final sensorOrientation = _cameraController!.description.sensorOrientation;
      final rotationCompensation = _getRotationCompensation(sensorOrientation);

      final rotationEnum = rotationCompensation;

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

      // Log detection results with more detail
      if (poses.isNotEmpty) {
        final highConfidenceLandmarks =
            poses.first.landmarks.values.where((lm) => lm.likelihood >= 0.5).length;
        debugPrint(
            '✅ Detected ${poses.length} pose(s) - ${highConfidenceLandmarks}/${poses.first.landmarks.length} landmarks (confidence ≥ 0.5)');

        // Check distance and provide guidance
        await _checkDistanceAndGuide(poses);
      } else {
        // Only log occasionally to avoid spam
        if (DateTime.now().millisecondsSinceEpoch % 30 == 0) {
          debugPrint('⚠️ No poses detected - ensure person is fully visible in frame');
        }
        _perfectPositionStartTime = null;
      }

      _bloc.add(CameraDetectionEvent.posesUpdated(poses));
    } catch (e) {
      debugPrint('❌ Error processing image: $e');
      _bloc.add(const CameraDetectionEvent.errorOccurred());
    } finally {
      _isProcessing = false;
    }
  }

  // Get proper rotation compensation for accurate pose tracking
  InputImageRotation _getRotationCompensation(int sensorOrientation) {
    // For Android, we need to calculate the rotation based on:
    // 1. Camera sensor orientation
    // 2. Device natural orientation
    // 3. Current device rotation

    // Most Android phones have sensor orientation of 90° (landscape-primary when held portrait)
    // Some have 270° (landscape-secondary when held portrait)

    // For portrait mode (phone held upright):
    // - Back camera with sensor 90°: use rotation90deg
    // - Back camera with sensor 270°: use rotation270deg
    // - Front camera with sensor 270°: use rotation270deg

    // For landscape mode (phone rotated):
    // - Adjust by 90° accordingly

    final orientation = MediaQuery.of(context).orientation;
    int rotationDegrees;

    if (orientation == Orientation.portrait) {
      // Portrait mode - use sensor orientation directly for back camera
      if (_currentLensDirection == CameraLensDirection.back) {
        rotationDegrees = sensorOrientation;
      } else {
        // Front camera - typically needs adjustment
        rotationDegrees = sensorOrientation;
      }
    } else {
      // Landscape mode - add 90° rotation
      if (_currentLensDirection == CameraLensDirection.back) {
        rotationDegrees = (sensorOrientation + 90) % 360;
      } else {
        rotationDegrees = (sensorOrientation + 270) % 360;
      }
    }

    debugPrint(
        '🔄 Rotation - Sensor: $sensorOrientation°, Device: ${orientation.name}, Camera: ${_currentLensDirection.name}, Final: $rotationDegrees°');

    // Convert degrees to InputImageRotation enum
    switch (rotationDegrees) {
      case 0:
        return InputImageRotation.rotation0deg;
      case 90:
        return InputImageRotation.rotation90deg;
      case 180:
        return InputImageRotation.rotation180deg;
      case 270:
        return InputImageRotation.rotation270deg;
      default:
        return InputImageRotation.rotation0deg;
    }
  }

  List<Map<String, dynamic>> _posesToJson(List<Pose> poses, {required String poseId}) {
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
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _stopStream(); // Stop stream first
    _cameraController?.dispose();
    _poseDetector?.close();
    _flutterTts?.stop();
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
                        _showResult ? LocaleKeys.PoseDetected.tr() : LocaleKeys.LiveCamera.tr(),
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
                              Transform(
                                alignment: Alignment.center,
                                transform: _controller.description.lensDirection ==
                                        CameraLensDirection.front
                                    ? (Matrix4.identity()..scale(-1.0, 1.0, 1.0))
                                    : Matrix4.identity(),
                                child: Image.file(
                                  File(_capturedImage!.path),
                                  fit: BoxFit.contain, // Use contain to maintain aspect ratio
                                ),
                              )
                            else
                              CameraPreview(_controller),

                            // Show pose skeleton when available
                            if (_showResult &&
                                _detectedPoses.isNotEmpty &&
                                _capturedImageSize != null)
                              CustomPaint(
                                painter: PosePainter(
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
                                    painter: PosePainter(
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
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.error_outline,
                                          color: Colors.white, size: 48),
                                      const SizedBox(height: 10),
                                      Text(
                                        LocaleKeys.NoPoseDetectedMessage.tr(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        LocaleKeys.TryAgainBetterPositioning.tr(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            // Distance status overlay (only in live mode, not during countdown)
                            if (!_showResult && !_isCountingDown && _distanceStatus.isNotEmpty)
                              Positioned(
                                top: 20,
                                left: 20,
                                right: 20,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                  decoration: BoxDecoration(
                                    color: _distanceStatus == 'perfect'
                                        ? Colors.green.withOpacity(0.9)
                                        : Colors.orange.withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        _distanceStatus == 'perfect'
                                            ? Icons.check_circle
                                            : _distanceStatus == 'too_close'
                                                ? Icons.arrow_back
                                                : Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          _distanceStatus == 'perfect'
                                              ? LocaleKeys.HoldStill.tr()
                                              : _distanceStatus == 'too_close'
                                                  ? LocaleKeys.MoveFurtherAway.tr()
                                                  : LocaleKeys.MoveCloser.tr(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
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
