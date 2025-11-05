import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:flutter/foundation.dart';

/// Utility để tăng chất lượng ảnh trước khi upload lên server
/// 
/// Các cải tiến:
/// - Resize về kích thước tối ưu (1920x1080 hoặc tỉ lệ tương đương)
/// - Tăng độ sáng và contrast
/// - Sharpen nhẹ để tăng độ rõ nét
/// - Encode với quality 95%
class ImageQualityEnhancer {
  /// Tăng chất lượng ảnh
  /// 
  /// Returns: File ảnh mới đã được enhance
  static Future<File> enhanceImage(File imageFile) async {
    try {
      debugPrint('📸 Bắt đầu enhance image: ${imageFile.path}');
      
      // 1. Đọc file ảnh
      final bytes = await imageFile.readAsBytes();
      img.Image? image = img.decodeImage(bytes);
      
      if (image == null) {
        debugPrint('⚠️ Không thể decode ảnh, trả về file gốc');
        return imageFile;
      }

      debugPrint('📐 Kích thước gốc: ${image.width}x${image.height}');

      // 2. Resize về kích thước tối ưu (1920x1080 hoặc tỉ lệ tương đương)
      const maxWidth = 1920;
      const maxHeight = 1920; // Cho phép hình vuông hoặc dọc
      
      if (image.width > maxWidth || image.height > maxHeight) {
        // Giữ tỉ lệ khung hình
        final aspectRatio = image.width / image.height;
        int newWidth, newHeight;
        
        if (aspectRatio > 1) {
          // Ảnh ngang
          newWidth = maxWidth;
          newHeight = (maxWidth / aspectRatio).round();
        } else {
          // Ảnh dọc hoặc vuông
          newHeight = maxHeight;
          newWidth = (maxHeight * aspectRatio).round();
        }
        
        debugPrint('🔄 Resize về: ${newWidth}x${newHeight}');
        image = img.copyResize(
          image,
          width: newWidth,
          height: newHeight,
          interpolation: img.Interpolation.cubic, // Chất lượng cao nhất
        );
      }

      // 3. Cân bằng sáng và tương phản
      debugPrint('💡 Điều chỉnh độ sáng và contrast...');
      image = img.adjustColor(
        image,
        brightness: 1.05,  // Tăng sáng 5%
        contrast: 1.1,     // Tăng contrast 10%
        saturation: 1.05,  // Tăng màu sắc 5%
      );

      // 4. Sharpen nhẹ để tăng độ rõ nét
      debugPrint('✨ Sharpen ảnh...');
      image = img.convolution(image, filter: [
        0, -1, 0,
        -1, 5, -1,
        0, -1, 0,
      ]);

      // 5. Encode với quality 95%
      debugPrint('💾 Encode với quality 95%...');
      final enhancedBytes = img.encodeJpg(image, quality: 95);

      // 6. Lưu file mới
      final originalPath = imageFile.path;
      final enhancedPath = originalPath.replaceAll('.jpg', '_enhanced.jpg')
          .replaceAll('.jpeg', '_enhanced.jpeg')
          .replaceAll('.png', '_enhanced.jpg');
      
      final enhancedFile = File(enhancedPath);
      await enhancedFile.writeAsBytes(enhancedBytes);

      final originalSize = await imageFile.length();
      final enhancedSize = enhancedBytes.length;
      
      debugPrint('✅ Enhanced thành công!');
      debugPrint('   Kích thước gốc: ${(originalSize / 1024).toStringAsFixed(1)} KB');
      debugPrint('   Kích thước mới: ${(enhancedSize / 1024).toStringAsFixed(1)} KB');
      debugPrint('   Tỉ lệ: ${((enhancedSize / originalSize) * 100).toStringAsFixed(1)}%');

      return enhancedFile;
      
    } catch (e, stackTrace) {
      debugPrint('❌ Lỗi khi enhance image: $e');
      debugPrint('StackTrace: $stackTrace');
      // Nếu có lỗi, trả về file gốc
      return imageFile;
    }
  }

  /// Enhance ảnh từ bytes (dùng cho upload trực tiếp)
  static Future<Uint8List> enhanceImageBytes(Uint8List bytes) async {
    try {
      img.Image? image = img.decodeImage(bytes);
      
      if (image == null) return bytes;

      // Resize
      const maxWidth = 1920;
      const maxHeight = 1920;
      
      if (image.width > maxWidth || image.height > maxHeight) {
        final aspectRatio = image.width / image.height;
        int newWidth, newHeight;
        
        if (aspectRatio > 1) {
          newWidth = maxWidth;
          newHeight = (maxWidth / aspectRatio).round();
        } else {
          newHeight = maxHeight;
          newWidth = (maxHeight * aspectRatio).round();
        }
        
        image = img.copyResize(
          image,
          width: newWidth,
          height: newHeight,
          interpolation: img.Interpolation.cubic,
        );
      }

      // Adjust colors
      image = img.adjustColor(
        image,
        brightness: 1.05,
        contrast: 1.1,
        saturation: 1.05,
      );

      // Sharpen
      image = img.convolution(image, filter: [
        0, -1, 0,
        -1, 5, -1,
        0, -1, 0,
      ]);

      // Encode
      return Uint8List.fromList(img.encodeJpg(image, quality: 95));
      
    } catch (e) {
      debugPrint('❌ Lỗi khi enhance image bytes: $e');
      return bytes;
    }
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
