import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:flutter/foundation.dart';

/// Giữ ảnh chụp ở dạng gốc trước khi upload lên server.
class ImageQualityEnhancer {
  /// Trả về file gốc, không resize/chỉnh sáng/contrast/sharpen.
  static Future<File> enhanceImage(File imageFile) async {
    debugPrint('📸 Upload raw image: ${imageFile.path}');
    return imageFile;
  }

  /// Trả về bytes gốc, không chỉnh sửa ảnh.
  static Future<Uint8List> enhanceImageBytes(Uint8List bytes) async {
    return bytes;
  }

  /// Kiểm tra xem ảnh có cần resize không
  static Future<bool> needsResize(File imageFile) async {
    try {
      final bytes = await imageFile.readAsBytes();
      final image = img.decodeImage(bytes);

      if (image == null) return false;

      return image.width > 1920 || image.height > 1920;
    } catch (e) {
      return false;
    }
  }

  /// Lấy kích thước ảnh
  static Future<ImageSize?> getImageSize(File imageFile) async {
    try {
      final bytes = await imageFile.readAsBytes();
      final image = img.decodeImage(bytes);

      if (image == null) return null;

      return ImageSize(image.width.toDouble(), image.height.toDouble());
    } catch (e) {
      return null;
    }
  }
}

class ImageSize {
  final double width;
  final double height;

  ImageSize(this.width, this.height);

  @override
  String toString() => '${width.toInt()}x${height.toInt()}';
}
