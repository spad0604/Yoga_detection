import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/entities/response/practice_session.dart';
import 'package:flutter_starter/data/states/practice_session/practice_session_bloc.dart';
import 'package:flutter_starter/data/states/practice_session/practice_session_event.dart';
import 'package:flutter_starter/data/states/practice_session/practice_session_state.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/presenter/pages/practice_session_summary/practice_session_summary_page.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_starter/presenter/languages/translation_keys.g.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_starter/presenter/pages/pose_guide/pose_capture_guide_dialog.dart';
import 'package:flutter_starter/services/tts/viettel_tts_service.dart';

// ignore: depend_on_referenced_packages
import 'package:google_mlkit_commons/google_mlkit_commons.dart'
    show
        InputImage,
        InputImageMetadata,
        InputImageFormat,
        InputImageFormatValue,
        InputImageRotation;

part 'pose_painter.dart';

@RoutePage()
class RoutinePracticeSessionPage extends StatefulWidget implements AutoRouteWrapper {
  final String routineId;

  const RoutinePracticeSessionPage({
    super.key,
    required this.routineId,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<PracticeSessionBloc>(
      create: (_) =>
          provider.get<PracticeSessionBloc>()..add(PracticeSessionEvent.startSession(routineId)),
      child: this,
    );
  }

  @override
  State<RoutinePracticeSessionPage> createState() => _RoutinePracticeSessionPageState();
}

class _RoutinePracticeSessionPageState extends State<RoutinePracticeSessionPage> {
  CameraController? _cameraController;
  PoseDetector? _poseDetector;
  bool _isCameraInitialized = false;
  Timer? _timer;
  int _elapsedSeconds = 0;
  CameraLensDirection _currentLensDirection = CameraLensDirection.front;
  FlutterTts? _flutterTts;
  final _feedbackTtsService = ViettelTtsService();
  String? _lastSpokenFeedbackKey;
  PracticeSession? _currentSession; // Cache current session for async operations

  // Capture and detection state
  bool _isAnalyzing = false;
  bool _showCapturedImage = false;
  XFile? _capturedImage;
  List<Pose> _detectedPoses = [];
  Size? _capturedImageSize;

  // Real-time pose detection
  bool _isProcessing = false;
  List<Pose> _livePoses = [];
  Size? _previewSize;

  // Auto-countdown state
  bool _isCountingDown = false;
  int _countdown = 3;
  DateTime? _perfectPositionStartTime;
  final Duration _perfectPositionDuration = const Duration(seconds: 2);
  String _distanceStatus = '';
  DateTime? _lastSpeechTime;

  @override
  void initState() {
    super.initState();
    // Support all orientations for better flexibility
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    _initializeCamera();
    _initializePoseDetector();
    _initializeTts();
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
  Future<void> _checkDistanceAndGuide(List<Pose> poses, PracticeSession? session) async {
    if (poses.isEmpty || _isCountingDown || _showCapturedImage || session == null) {
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
        if (holdDuration >= _perfectPositionDuration && !_isCountingDown) {
          // Auto-trigger countdown
          _speak(LocaleKeys.PreparingToCapture.tr());
          await Future.delayed(const Duration(milliseconds: 500));
          _startCountdownAndCapture(session);
          return;
        }
      }
    }

    // Update status and speak guidance if changed
    if (newStatus != _distanceStatus) {
      _distanceStatus = newStatus;
      if (guidanceMessage != null) {
        _speak(guidanceMessage);
      }
    }
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) return;

      final selectedCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == _currentLensDirection,
        orElse: () => cameras.first,
      );

      _cameraController = CameraController(
        selectedCamera,
        ResolutionPreset.high,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.nv21, // Changed to nv21 for ML Kit compatibility
      );

      await _cameraController!.initialize();

      _previewSize = _cameraController!.value.previewSize;

      // Disable flash
      try {
        await _cameraController!.setFlashMode(FlashMode.off);
      } catch (_) {}

      // Set focus mode to auto for continuous autofocus
      try {
        await _cameraController!.setFocusMode(FocusMode.auto);
      } catch (_) {}

      // Set exposure mode to auto
      try {
        await _cameraController!.setExposureMode(ExposureMode.auto);
      } catch (_) {}

      if (mounted) {
        setState(() {
          _isCameraInitialized = true;
        });
        // Start image stream for real-time pose detection
        _startImageStream();
      }
    } catch (e) {
      debugPrint('Error initializing camera: $e');
    }
  }

  Future<void> _switchCamera() async {
    if (_cameraController == null) return;

    // Stop image stream first
    await _stopImageStream();

    // Dispose controller
    await _cameraController!.dispose();
    _cameraController = null;

    // Switch lens direction
    _currentLensDirection = _currentLensDirection == CameraLensDirection.back
        ? CameraLensDirection.front
        : CameraLensDirection.back;

    // Reinitialize with new camera
    setState(() {
      _isCameraInitialized = false;
      _livePoses = [];
    });

    await _initializeCamera();
  }

  // Start real-time image stream for pose detection
  Future<void> _startImageStream() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) return;
    if (_cameraController!.value.isStreamingImages) return;

    await _cameraController!.startImageStream(_processCameraImage);
  }

  // Stop image stream
  Future<void> _stopImageStream() async {
    if (_cameraController == null) return;
    if (_cameraController!.value.isStreamingImages) {
      await _cameraController!.stopImageStream();
    }
  }

  // Process camera images for real-time pose detection
  Future<void> _processCameraImage(CameraImage image) async {
    if (_isProcessing || _poseDetector == null || _showCapturedImage) return;
    _isProcessing = true;

    try {
      // Get correct rotation
      final camera = _cameraController!.description;
      final sensorOrientation = camera.sensorOrientation;
      final rotationCompensation = _getRotationCompensation(sensorOrientation);

      // Convert CameraImage to InputImage
      final bytes = _concatenatePlanes(image.planes);
      final inputImageFormat =
          InputImageFormatValue.fromRawValue(image.format.raw) ?? InputImageFormat.nv21;

      final inputImageMetadata = InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotationCompensation,
        format: inputImageFormat,
        bytesPerRow: image.planes.isNotEmpty ? image.planes[0].bytesPerRow : image.width,
      );

      final inputImage = InputImage.fromBytes(
        bytes: bytes,
        metadata: inputImageMetadata,
      );

      final poses = await _poseDetector!.processImage(inputImage);

      if (mounted) {
        setState(() {
          _livePoses = poses;
        });

        // Check distance and provide guidance
        await _checkDistanceAndGuide(poses, _currentSession);
      }
    } catch (e) {
      debugPrint('Error processing live image: $e');
    } finally {
      _isProcessing = false;
    }
  }

  Uint8List _concatenatePlanes(List<Plane> planes) {
    final WriteBuffer allBytes = WriteBuffer();
    for (final plane in planes) {
      allBytes.putUint8List(plane.bytes);
    }
    return allBytes.done().buffer.asUint8List();
  }

  InputImageRotation _getRotationCompensation(int sensorOrientation) {
    // For Android, we need to calculate the rotation based on:
    // 1. Camera sensor orientation
    // 2. Device natural orientation
    // 3. Current device rotation

    final orientation = MediaQuery.of(context).orientation;
    int rotationDegrees;

    if (orientation == Orientation.portrait) {
      // Portrait mode - use sensor orientation directly
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

  void _initializePoseDetector() {
    final options = PoseDetectorOptions(
      mode: PoseDetectionMode.stream,
      model: PoseDetectionModel.accurate,
    );
    _poseDetector = PoseDetector(options: options);
  }

  void _startTimer() {
    _timer?.cancel();
    _elapsedSeconds = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _elapsedSeconds++;
        });
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  // Start countdown and auto-capture
  Future<void> _startCountdownAndCapture(PracticeSession session) async {
    if (_isCountingDown) return;

    setState(() {
      _isCountingDown = true;
      _countdown = 3;
    });

    // Countdown from 3 to 1
    for (int i = 3; i > 0; i--) {
      if (!mounted || !_isCountingDown) break;

      setState(() {
        _countdown = i;
      });

      await Future.delayed(const Duration(seconds: 1));
    }

    // Capture the pose
    if (mounted && _isCountingDown) {
      await _captureAndSubmitPose(session);
    }

    if (mounted) {
      setState(() {
        _isCountingDown = false;
      });
    }
  }

  Future<void> _captureAndSubmitPose(PracticeSession session) async {
    if (_cameraController == null || !_isCameraInitialized) return;
    if (session.currentPoseCode == null) return;
    if (_poseDetector == null) return;
    if (_isAnalyzing) return; // Prevent multiple captures

    // Get bloc instance BEFORE any async operations
    final bloc = context.read<PracticeSessionBloc>();

    try {
      // Stop timer and image stream
      _stopTimer();
      await _stopImageStream();

      // Take picture
      final XFile imageFile = await _cameraController!.takePicture();
      debugPrint('📸 Image captured: ${imageFile.path}');

      // Get image size
      final bytes = await imageFile.readAsBytes();
      final image = await decodeImageFromList(bytes);
      final imageSize = Size(image.width.toDouble(), image.height.toDouble());

      // Freeze camera on captured image
      setState(() {
        _capturedImage = imageFile;
        _capturedImageSize = imageSize;
        _showCapturedImage = true;
        _isAnalyzing = true;
      });

      // Detect pose from captured image
      final inputImage = InputImage.fromFilePath(imageFile.path);
      final poses = await _poseDetector!.processImage(inputImage);

      setState(() {
        _detectedPoses = poses;
      });

      // Extract landmarks from detected pose
      String? landmarkData;
      if (poses.isNotEmpty) {
        debugPrint(
            '✅ Detected ${poses.length} pose(s) with ${poses.first.landmarks.length} landmarks');

        // Convert landmarks to JSON string
        final landmarks = poses.first.landmarks.entries.map((entry) {
          final landmark = entry.value;
          return {
            'type': entry.key.name,
            'x': landmark.x,
            'y': landmark.y,
            'z': landmark.z,
          };
        }).toList();

        landmarkData = jsonEncode({
          'landmarks': landmarks,
        });

        debugPrint(
            '📊 Landmark data preview: ${landmarkData.substring(0, landmarkData.length > 200 ? 200 : landmarkData.length)}...');
      } else {
        debugPrint('⚠️ No poses detected in captured image');
      }

      // Submit to backend with cropped image and landmark data using saved bloc instance
      debugPrint('📤 Submitting with original: ${imageFile.path}');

      bloc.add(
        PracticeSessionEvent.submitPose(
          poseCode: session.currentPoseCode!,
          imagePath: imageFile.path,
          timeSpentSeconds: _elapsedSeconds,
          landmarkData: landmarkData,
        ),
      );
    } catch (e) {
      debugPrint('❌ Error capturing/detecting: $e');
      if (mounted) {
        _showErrorDialog('Không thể chụp ảnh: $e');
        // Reset state on error
        setState(() {
          _showCapturedImage = false;
          _isAnalyzing = false;
          _capturedImage = null;
          _detectedPoses = [];
          _capturedImageSize = null;
        });
      }
    }
  }

  void _resetToLiveMode() {
    setState(() {
      _showCapturedImage = false;
      _isAnalyzing = false;
      _capturedImage = null;
      _detectedPoses = [];
      _capturedImageSize = null;
    });
    // Restart image stream
    _startImageStream();
  }

  void _showResultDialog(PoseSubmissionResult result) {
    final feedback = result.feedback?.trim();
    final feedbackKey = '${result.poseCode}|${result.submittedAt?.toIso8601String() ?? ''}|$feedback';
    if (feedback != null && feedback.isNotEmpty && feedbackKey != _lastSpokenFeedbackKey) {
      _lastSpokenFeedbackKey = feedbackKey;
      _flutterTts?.stop();
      _feedbackTtsService.speak(feedback);
    }

    // Auto-close and continue after 3 seconds
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted && Navigator.canPop(context)) {
        Navigator.of(context).pop();
        _resetToLiveMode();
        _startTimer();
      }
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.95),
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                const Text(
                  'Kết quả đánh giá',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),

                // Score with circular background
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _getScoreColor(result.score).withOpacity(0.2),
                    border: Border.all(
                      color: _getScoreColor(result.score),
                      width: 4,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${result.score.toStringAsFixed(1)}',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: _getScoreColor(result.score),
                        ),
                      ),
                      Text(
                        _getScoreLabel(result.score),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: _getScoreColor(result.score),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Feedback
                if (result.feedback != null && result.feedback!.isNotEmpty) ...[
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.psychology, color: Colors.white70, size: 20),
                            SizedBox(width: 8),
                            Text(
                              'Nhận xét từ AI',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          result.feedback!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 24),

                // Auto-advance message
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue.withOpacity(0.5)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.info_outline, color: Colors.blue, size: 18),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Tự động chuyển sang bước tiếp theo sau 3 giây...',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.blue.shade200,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Continue button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Reset to live camera mode
                      _resetToLiveMode();
                      _startTimer();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Tiếp tục ngay',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getScoreColor(double score) {
    if (score >= 80) return Colors.green;
    if (score >= 60) return Colors.orange;
    return Colors.red;
  }

  String _getScoreLabel(double score) {
    if (score >= 90) return 'Xuất sắc!';
    if (score >= 80) return 'Tốt!';
    if (score >= 70) return 'Khá!';
    if (score >= 60) return 'Trung bình';
    return 'Cần cải thiện';
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.95),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 64,
              ),
              const SizedBox(height: 16),
              const Text(
                'Lỗi',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                message,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Đóng',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _skipCurrentPose() {
    context.read<PracticeSessionBloc>().add(
          const PracticeSessionEvent.skipPose(),
        );
    _stopTimer();
    _startTimer();
  }

  Future<void> _completeSession() async {
    final shouldComplete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(LocaleKeys.CompleteSessionConfirmTitle.tr()),
        content: Text(LocaleKeys.CompleteSessionConfirmContent.tr()),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(LocaleKeys.Cancel.tr()),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(LocaleKeys.Complete.tr()),
          ),
        ],
      ),
    );

    if (shouldComplete == true && mounted) {
      context.read<PracticeSessionBloc>().add(
            const PracticeSessionEvent.completeSession(),
          );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _stopImageStream();
    _cameraController?.dispose();
    _poseDetector?.close();
    _flutterTts?.stop();
    _feedbackTtsService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PracticeSessionBloc, PracticeSessionState>(
      listener: (context, state) {
        // Update current session cache
        if (state.session != null) {
          _currentSession = state.session;
        }

        // Show result dialog when pose is submitted
        if (state.lastSubmission != null && !state.isSubmitting) {
          _showResultDialog(state.lastSubmission!);
        }

        // Navigate to summary when session is completed
        if (state.session?.status == SessionStatus.completed) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => PracticeSessionSummaryPage(
                session: state.session!,
              ),
            ),
          );
        }

        // Show error
        if (state.error != null) {
          _showErrorDialog(state.error!);
        }
      },
      builder: (context, state) {
        if (state.isLoading && state.session == null) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final session = state.session;
        if (session == null) {
          return Scaffold(
            appBar: AppBar(title: Text(LocaleKeys.Error.tr())),
            body: Center(
              child: Text(LocaleKeys.CannotStartSession.tr()),
            ),
          );
        }

        // Start timer when session starts
        if (_timer == null || !_timer!.isActive) {
          _startTimer();
        }

        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              children: [
                // Header
                _buildHeader(session),

                // Camera preview
                Expanded(
                  child: _buildCameraPreview(session),
                ),

                // Controls
                _buildControls(session, context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(PracticeSession session) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          // Back button
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          const Spacer(),
          // 🆕 Guide button
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.white),
            onPressed: () => PoseCaptureGuideDialog.show(context),
            tooltip: LocaleKeys.CaptureGuide.tr(),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  session.routineName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  'Bài ${session.currentPoseIndex + 1}/${session.totalPoses}',
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildCameraPreview(PracticeSession session) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Show captured image if analyzing, otherwise show live camera
            if (_showCapturedImage && _capturedImage != null)
              // Captured image with pose overlay (transform to prevent mirroring on front camera)
              Transform(
                alignment: Alignment.center,
                transform: _currentLensDirection == CameraLensDirection.front
                    ? (Matrix4.identity()
                      ..scale(-1.0, 1.0, 1.0)) // Flip horizontally for front camera
                    : Matrix4.identity(),
                child: Image.file(
                  File(_capturedImage!.path),
                  fit: BoxFit.cover,
                ),
              )
            else if (_isCameraInitialized && _cameraController != null)
              // Live camera preview
              CameraPreview(_cameraController!)
            else
              const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),

            // Real-time pose overlay on live camera (only when not showing captured image)
            if (!_showCapturedImage && _livePoses.isNotEmpty && _previewSize != null)
              Positioned.fill(
                child: CustomPaint(
                  painter: PosePainter(
                    poses: _livePoses,
                    imageSize: _previewSize!,
                    isFrontCamera: _currentLensDirection == CameraLensDirection.front,
                  ),
                ),
              ),

            // Pose overlay on captured image
            if (_showCapturedImage && _detectedPoses.isNotEmpty && _capturedImageSize != null)
              Positioned.fill(
                child: CustomPaint(
                  painter: PosePainter(
                    poses: _detectedPoses,
                    imageSize: _capturedImageSize!,
                    isFrontCamera: _currentLensDirection == CameraLensDirection.front,
                  ),
                ),
              ),

            // Loading overlay when analyzing
            if (_isAnalyzing)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 4,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'AnalyzingPose'.tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 10,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            // Countdown overlay (center)
            if (_isCountingDown && _countdown > 0)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                  child: Center(
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '$_countdown',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 20,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // Distance status indicator (top center)
            if (!_showCapturedImage && !_isAnalyzing && _distanceStatus.isNotEmpty)
              Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: _distanceStatus == 'perfect'
                          ? Colors.green.withOpacity(0.8)
                          : Colors.orange.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _distanceStatus == 'perfect'
                              ? Icons.check_circle
                              : _distanceStatus == 'too_close'
                                  ? Icons.arrow_back
                                  : Icons.arrow_forward,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
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
                      ],
                    ),
                  ),
                ),
              ),

            // Current pose info overlay (top)
            if (!_isAnalyzing)
              Positioned(
                top: 20,
                left: 20,
                right: 20,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        session.currentPoseName ?? 'Hello'.tr(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (session.currentPoseDescription != null) ...[
                        const SizedBox(height: 6),
                        Text(
                          session.currentPoseDescription!,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
              ),

            // Timer (bottom left)
            if (!_isAnalyzing)
              Positioned(
                bottom: 20,
                left: 20,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.timer, color: Colors.white, size: 18),
                      const SizedBox(width: 8),
                      Text(
                        _formatTime(_elapsedSeconds),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // Camera flip button (top right)
            if (!_isAnalyzing && !_showCapturedImage)
              Positioned(
                top: 20,
                right: 20,
                child: Material(
                  color: Colors.black.withOpacity(0.6),
                  shape: const CircleBorder(),
                  child: InkWell(
                    onTap: _switchCamera,
                    customBorder: const CircleBorder(),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: const Icon(
                        Icons.flip_camera_ios,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildControls(PracticeSession session, BuildContext blocContext) {
    final isLastPose = session.currentPoseIndex >= session.totalPoses - 1;

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Skip button
            _buildControlButton(
              icon: Icons.skip_next,
              label: 'Bỏ qua',
              backgroundColor: Colors.orange,
              onPressed: _skipCurrentPose,
            ),

            // Capture button (larger)
            _buildControlButton(
              icon: Icons.camera_alt,
              label: 'Chụp',
              backgroundColor: Colors.green,
              onPressed: () => _captureAndSubmitPose(session),
              size: 70,
              iconSize: 32,
            ),

            // Complete or Next button
            if (isLastPose)
              _buildControlButton(
                icon: Icons.check_circle,
                label: 'Hoàn thành',
                backgroundColor: Colors.blue,
                onPressed: _completeSession,
              )
            else
              _buildControlButton(
                icon: Icons.close,
                label: 'Thoát',
                backgroundColor: Colors.red,
                onPressed: () => Navigator.of(context).pop(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required String label,
    required Color backgroundColor,
    required VoidCallback onPressed,
    double size = 60,
    double iconSize = 24,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: backgroundColor,
          shape: const CircleBorder(),
          child: InkWell(
            onTap: onPressed,
            customBorder: const CircleBorder(),
            child: Container(
              width: size,
              height: size,
              alignment: Alignment.center,
              child: Icon(
                icon,
                color: Colors.white,
                size: iconSize,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }
}
