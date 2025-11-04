import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:path_provider/path_provider.dart';

/// Helper class for cropping images to focus on detected person
class ImageCropHelper {
  /// Crops image to focus on the person based on pose landmarks
  /// Returns the path to the cropped image file
  static Future<String> cropImageToPerson({
    required String originalImagePath,
    required List<Pose> poses,
    double paddingFactor = 0.15, // 15% padding around person
  }) async {
    if (poses.isEmpty) {
      debugPrint('⚠️ No poses detected, returning original image');
      return originalImagePath;
    }

    try {
      // Read original image
      final imageBytes = await File(originalImagePath).readAsBytes();
      final codec = await ui.instantiateImageCodec(imageBytes);
      final frame = await codec.getNextFrame();
      final image = frame.image;

      final imageWidth = image.width.toDouble();
      final imageHeight = image.height.toDouble();

      debugPrint('📐 Original image size: ${imageWidth}x$imageHeight');

      // Calculate bounding box from landmarks
      final boundingBox = _calculateBoundingBox(poses.first, imageWidth, imageHeight);

      if (boundingBox == null) {
        debugPrint('⚠️ Could not calculate bounding box, returning original image');
        return originalImagePath;
      }

      debugPrint('📦 Bounding box before padding: $boundingBox');

      // Add padding
      final paddedBox = _addPadding(
        boundingBox,
        imageWidth,
        imageHeight,
        paddingFactor,
      );

      debugPrint('📦 Bounding box after padding: $paddedBox');

      // Crop the image
      final croppedImage = await _cropImage(
        image,
        paddedBox['left']!,
        paddedBox['top']!,
        paddedBox['width']!,
        paddedBox['height']!,
      );

      // Save cropped image
      final dir = await getApplicationDocumentsDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final croppedImagePath = '${dir.path}${Platform.pathSeparator}cropped_pose_$timestamp.jpg';

      final croppedBytes = await _imageToBytes(croppedImage);
      await File(croppedImagePath).writeAsBytes(croppedBytes);

      debugPrint('✅ Cropped image saved: $croppedImagePath');
      debugPrint('📐 Cropped size: ${croppedImage.width}x${croppedImage.height}');

      // Dispose images to free memory
      image.dispose();
      croppedImage.dispose();

      return croppedImagePath;
    } catch (e) {
      debugPrint('❌ Error cropping image: $e');
      return originalImagePath; // Return original on error
    }
  }

  /// Calculate bounding box from pose landmarks
  static Map<String, double>? _calculateBoundingBox(
    Pose pose,
    double imageWidth,
    double imageHeight,
  ) {
    final landmarks = pose.landmarks.values.toList();
    if (landmarks.isEmpty) return null;

    double minX = imageWidth;
    double maxX = 0;
    double minY = imageHeight;
    double maxY = 0;

    // Find min/max coordinates from all landmarks
    for (final landmark in landmarks) {
      // Filter out landmarks with very low likelihood
      if (landmark.likelihood < 0.3) continue;

      minX = min(minX, landmark.x);
      maxX = max(maxX, landmark.x);
      minY = min(minY, landmark.y);
      maxY = max(maxY, landmark.y);
    }

    // Validate bounds
    if (minX >= maxX || minY >= maxY) {
      debugPrint('⚠️ Invalid bounding box coordinates');
      return null;
    }

    final width = maxX - minX;
    final height = maxY - minY;

    return {
      'left': minX,
      'top': minY,
      'width': width,
      'height': height,
    };
  }

  /// Add padding around bounding box while keeping within image bounds
  static Map<String, double> _addPadding(
    Map<String, double> box,
    double imageWidth,
    double imageHeight,
    double paddingFactor,
  ) {
    final width = box['width']!;
    final height = box['height']!;

    // Calculate padding based on the larger dimension
    final maxDimension = max(width, height);
    final padding = maxDimension * paddingFactor;

    // Apply padding
    double left = box['left']! - padding;
    double top = box['top']! - padding;
    double right = box['left']! + width + padding;
    double bottom = box['top']! + height + padding;

    // Clamp to image bounds
    left = max(0, left);
    top = max(0, top);
    right = min(imageWidth, right);
    bottom = min(imageHeight, bottom);

    return {
      'left': left,
      'top': top,
      'width': right - left,
      'height': bottom - top,
    };
  }

  /// Crop image to specified region
  static Future<ui.Image> _cropImage(
    ui.Image image,
    double left,
    double top,
    double width,
    double height,
  ) async {
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder);

    // Draw the cropped region
    canvas.drawImageRect(
      image,
      ui.Rect.fromLTWH(left, top, width, height),
      ui.Rect.fromLTWH(0, 0, width, height),
      ui.Paint(),
    );

    final picture = recorder.endRecording();
    return await picture.toImage(width.toInt(), height.toInt());
  }

  /// Convert ui.Image to bytes
  static Future<Uint8List> _imageToBytes(ui.Image image) async {
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }
}
