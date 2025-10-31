import 'dart:async';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/entities/response/practice_session.dart';
import 'package:flutter_starter/data/states/practice_session/practice_session_bloc.dart';
import 'package:flutter_starter/data/states/practice_session/practice_session_event.dart';
import 'package:flutter_starter/data/states/practice_session/practice_session_state.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/presenter/pages/practice_session_summary/practice_session_summary_page.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

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
      create: (ctx) => provider.get<PracticeSessionBloc>()
        ..add(PracticeSessionEvent.startSession(routineId)),
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

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _initializePoseDetector();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) return;

      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );

      _cameraController = CameraController(
        frontCamera,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await _cameraController!.initialize();
      
      if (mounted) {
        setState(() {
          _isCameraInitialized = true;
        });
      }
    } catch (e) {
      debugPrint('Error initializing camera: $e');
    }
  }

  void _initializePoseDetector() {
    final options = PoseDetectorOptions(
      mode: PoseDetectionMode.single,
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

  Future<void> _captureAndSubmitPose(PracticeSession session) async {
    if (_cameraController == null || !_isCameraInitialized) return;
    if (session.currentPoseCode == null) return;

    try {
      // Stop timer
      _stopTimer();

      // Take picture
      final XFile imageFile = await _cameraController!.takePicture();
      
      // Show AI evaluation loading
      _showEvaluatingDialog();

      // Submit to backend
      context.read<PracticeSessionBloc>().add(
        PracticeSessionEvent.submitPose(
          poseCode: session.currentPoseCode!,
          imagePath: imageFile.path,
          timeSpentSeconds: _elapsedSeconds,
        ),
      );

    } catch (e) {
      Navigator.of(context).pop(); // Close loading dialog
      _showErrorDialog('Không thể chụp ảnh: $e');
    }
  }

  void _showEvaluatingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text(
                  'AI đang đánh giá tư thế của bạn...',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showResultDialog(PoseSubmissionResult result) {
    Navigator.of(context).pop(); // Close evaluating dialog

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Kết quả đánh giá'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Score with animation
              Center(
                child: Column(
                  children: [
                    Text(
                      '${result.score.toStringAsFixed(1)}',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: _getScoreColor(result.score),
                      ),
                    ),
                    Text(
                      _getScoreLabel(result.score),
                      style: TextStyle(
                        fontSize: 18,
                        color: _getScoreColor(result.score),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              
              // Feedback
              if (result.feedback != null && result.feedback!.isNotEmpty) ...[
                const Text(
                  'Nhận xét từ AI:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  result.feedback!,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Reset timer for next pose
              _startTimer();
            },
            child: const Text('Tiếp tục'),
          ),
        ],
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
      builder: (context) => AlertDialog(
        title: const Text('Lỗi'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
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
    return BlocConsumer<PracticeSessionBloc, PracticeSessionState>(
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
                _buildControls(session),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(PracticeSession session) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.black87,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              Expanded(
                child: Text(
                  session.routineName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: 48),
            ],
          ),
          const SizedBox(height: 8),
          
          // Progress indicator
          Row(
            children: [
              Text(
                'Bài ${session.currentPoseIndex + 1}/${session.totalPoses}',
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: LinearProgressIndicator(
                  value: (session.currentPoseIndex) / session.totalPoses,
                  backgroundColor: Colors.white24,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCameraPreview(PracticeSession session) {
    return Stack(
      children: [
        // Camera
        if (_isCameraInitialized && _cameraController != null)
          Center(
            child: CameraPreview(_cameraController!),
          )
        else
          const Center(
            child: CircularProgressIndicator(),
          ),
        
        // Current pose info overlay
        Positioned(
          top: 16,
          left: 16,
          right: 16,
          child: Card(
            color: Colors.black87,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    session.currentPoseName ?? 'Đang tải...',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (session.currentPoseDescription != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      session.currentPoseDescription!,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
        
        // Timer
        Positioned(
          bottom: 16,
          left: 16,
          child: Card(
            color: Colors.black87,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  const Icon(Icons.timer, color: Colors.white, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    _formatTime(_elapsedSeconds),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildControls(PracticeSession session) {
    final isLastPose = session.currentPoseIndex >= session.totalPoses - 1;

    return Container(
      padding: const EdgeInsets.all(24),
      color: Colors.black87,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Skip button
          OutlinedButton.icon(
            onPressed: _skipCurrentPose,
            icon: const Icon(Icons.skip_next, color: Colors.white),
            label: const Text(
              'Bỏ qua',
              style: TextStyle(color: Colors.white),
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            ),
          ),
          
          // Capture button
          ElevatedButton.icon(
            onPressed: () => _captureAndSubmitPose(session),
            icon: const Icon(Icons.camera_alt, size: 28),
            label: const Text(
              'Chụp & Đánh giá',
              style: TextStyle(fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
          ),
          
          // Complete button (show only on last pose)
          if (isLastPose)
            ElevatedButton.icon(
              onPressed: _completeSession,
              icon: const Icon(Icons.check_circle),
              label: const Text('Hoàn thành'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
            ),
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }
}
