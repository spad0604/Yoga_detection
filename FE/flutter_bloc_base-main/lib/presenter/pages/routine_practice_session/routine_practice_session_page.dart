import 'dart:async';
import 'dart:convert';
import 'dart:io';
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

part 'pose_painter.dart';

@RoutePage()
class RoutinePracticeSessionPage extends StatefulWidget {
  final String routineId;

  const RoutinePracticeSessionPage({
    super.key,
    required this.routineId,
  });

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

  // Capture and detection state
  bool _isAnalyzing = false;
  bool _showCapturedImage = false;
  XFile? _capturedImage;
  List<Pose> _detectedPoses = [];
  Size? _capturedImageSize;

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
        imageFormatGroup: ImageFormatGroup.yuv420,
      );

      await _cameraController!.initialize();

      // Disable flash
      try {
        await _cameraController!.setFlashMode(FlashMode.off);
      } catch (_) {}

      if (mounted) {
        setState(() {
          _isCameraInitialized = true;
        });
      }
    } catch (e) {
      debugPrint('Error initializing camera: $e');
    }
  }

  Future<void> _switchCamera() async {
    if (_cameraController == null) return;

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
    });

    await _initializeCamera();
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

  Future<void> _captureAndSubmitPose(PracticeSession session, BuildContext blocContext) async {
    if (_cameraController == null || !_isCameraInitialized) return;
    if (session.currentPoseCode == null) return;
    if (_poseDetector == null) return;
    if (_isAnalyzing) return; // Prevent multiple captures

    try {
      // Stop timer
      _stopTimer();

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

      // Submit to backend with landmark data
      blocContext.read<PracticeSessionBloc>().add(
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
  }

  void _showResultDialog(PoseSubmissionResult result) {
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
                    child: const Text(
                      'Tiếp tục',
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
        title: const Text('Hoàn thành bài tập?'),
        content: const Text('Bạn có chắc chắn muốn hoàn thành bài tập này?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Hoàn thành'),
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
    _cameraController?.dispose();
    _poseDetector?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PracticeSessionBloc>(
      create: (_) => provider.get<PracticeSessionBloc>()
        ..add(PracticeSessionEvent.startSession(widget.routineId)),
      child: BlocConsumer<PracticeSessionBloc, PracticeSessionState>(
        listener: (context, state) {
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
              appBar: AppBar(title: const Text('Lỗi')),
              body: const Center(
                child: Text('Không thể bắt đầu buổi tập'),
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
      ),
    );
  }

  Widget _buildHeader(PracticeSession session) {
    return Container(
      height: 50,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
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
              // Captured image with pose overlay
              Image.file(
                File(_capturedImage!.path),
                fit: BoxFit.cover,
              )
            else if (_isCameraInitialized && _cameraController != null)
              // Live camera preview
              CameraPreview(_cameraController!)
            else
              const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            
            // Pose overlay on captured image
            if (_showCapturedImage && _detectedPoses.isNotEmpty && _capturedImageSize != null)
              Positioned.fill(
                child: CustomPaint(
                  painter: PosePainter(
                    poses: _detectedPoses,
                    imageSize: _capturedImageSize!,
                  ),
                ),
              ),
            
            // Loading overlay when analyzing
            if (_isAnalyzing)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                  child: const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 4,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Đang phân tích tư thế...',
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
                        session.currentPoseName ?? 'Đang tải...',
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
  }  Widget _buildControls(PracticeSession session, BuildContext blocContext) {
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
              onPressed: () => _captureAndSubmitPose(session, blocContext),
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
