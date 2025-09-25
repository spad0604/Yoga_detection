import 'dart:typed_data';

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

class _CameraDetectionPageState extends State<CameraDetectionPage> {
  CameraDetectionBloc get _bloc => context.read<CameraDetectionBloc>();

  CameraController? _cameraController;
  PoseDetector? _poseDetector;
  bool _isProcessing = false;
  Size? _previewSize;

  @override
  void initState() {
    _initializeCameraAndDetector();
    () async {
      await _initializeCameraAndDetector();
      await _startStream();
      if (mounted) setState(() {});
    }();
    super.initState();
  }

  Future<void> _initializeCameraAndDetector() async {
    final status = await Permission.camera.request();

    if (!status.isGranted) {
      return;
    }

    final cameras = await availableCameras();

    final camera = cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.back);

    _cameraController = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.nv21,
    );

    await _cameraController!.initialize();

    _previewSize = _cameraController!.value.previewSize;
    _poseDetector = PoseDetector(options: PoseDetectorOptions(mode: PoseDetectionMode.stream));
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
                                    isFrontCamera: _controller!.description.lensDirection ==
                                        CameraLensDirection.front,
                                  ),
                                );
                              },
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
                          cameraDetectionButton(
                              AppImages.ic_video, Colors.white, Colors.black, () {}),
                          cameraDetectionButton(
                              AppImages.ic_present, Colors.white, Colors.black, () {}),
                          cameraDetectionButton(
                              AppImages.ic_pause, Colors.white, Colors.black, () {}),
                          cameraDetectionButton(AppImages.ic_close, Colors.red, Colors.white, () {
                            dispose();
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
