import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/states/camera_detection/camera_detection_event.dart';
import 'package:flutter_starter/data/states/camera_detection/camera_detection_state.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/data/states/camera_detection/camera_detection_bloc.dart';
import 'package:flutter_starter/gen/app_images.dart';
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeCameraAndDetector().then((_) {
      if (mounted) {
        _startStream();
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (_cameraController == null || !_cameraController!.value.isInitialized) return;

    if (state == AppLifecycleState.inactive) {
      _stopStream();
    } else if (state == AppLifecycleState.resumed) {
      _startStream();
    }
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

    // Stop current stream and dispose controller
    await _stopStream();
    await _cameraController!.dispose();
    _cameraController = null;

    // Switch lens direction
    _currentLensDirection = _currentLensDirection == CameraLensDirection.back
        ? CameraLensDirection.front
        : CameraLensDirection.back;

    // Reinitialize with new camera
    await _initializeCameraAndDetector();
    if (mounted) {
      await _startStream();
    }
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
          ResolutionPreset.low, // Start with lowest resolution
          enableAudio: false,
          imageFormatGroup: ImageFormatGroup.yuv420,
        );

        await controller.initialize();

        if (controller.value.isInitialized) {
          _cameraController = controller;
        } else {
          await controller.dispose();
          _showError('Unable to initialize camera. Please try restarting the app or check camera hardware.');
          return;
        }
      } catch (e) {
        _showError('Failed to initialize camera: ${e.toString()}');
        return;
      }

      _previewSize = _cameraController!.value.previewSize;
      _poseDetector = PoseDetector(options: PoseDetectorOptions(mode: PoseDetectionMode.stream));
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
    _stopStream(); // Stop stream first
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
          : SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        'Live',
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
                            CameraPreview(_controller),
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
                                  ),
                                );
                              },
                            ),
                            // Camera rotation button
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          cameraDetectionButton(AppImages.ic_video, Colors.white, Colors.black,
                              () async => await _startStream()),
                          cameraDetectionButton(
                              AppImages.ic_present, Colors.white, Colors.black, () {}),
                          cameraDetectionButton(AppImages.ic_pause, Colors.white, Colors.black,
                              () async => await _stopStream()),
                          cameraDetectionButton(AppImages.ic_close, Colors.red, Colors.white,
                              () async {
                            await _stopStream();
                            context.router.maybePop();
                          })
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
