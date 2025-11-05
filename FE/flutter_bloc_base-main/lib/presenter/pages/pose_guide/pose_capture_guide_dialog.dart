import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_starter/presenter/languages/translation_keys.g.dart';

/// Dialog hướng dẫn người dùng chụp ảnh yoga đúng cách
class PoseCaptureGuideDialog extends StatelessWidget {
  const PoseCaptureGuideDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => const PoseCaptureGuideDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.camera_alt, color: Theme.of(context).primaryColor),
          const SizedBox(width: 8),
          Text(LocaleKeys.CaptureGuideTitle.tr()),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.CaptureGuideDescription.tr(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 16),
            
            // Hướng dẫn ĐÚNG
            Text(
              LocaleKeys.DoTitle.tr(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 8),
            _buildGuideItem(
              '✅ Chụp toàn thân',
              'Đảm bảo từ đầu đến chân vào khung hình',
              Icons.accessibility_new,
              Colors.green,
            ),
            _buildGuideItem(
              '✅ Đứng cách camera 2-3m',
              'Không quá gần hoặc quá xa',
              Icons.straighten,
              Colors.green,
            ),
            _buildGuideItem(
              '✅ Ánh sáng tốt',
              'Chụp nơi có ánh sáng đủ, tránh ngược sáng',
              Icons.lightbulb,
              Colors.green,
            ),
            _buildGuideItem(
              '✅ Nền đơn giản',
              'Tránh nền có nhiều người/vật thể',
              Icons.wallpaper,
              Colors.green,
            ),
            _buildGuideItem(
              '✅ Camera thẳng góc',
              'Đặt camera ngang tầm người, không chụp từ trên/dưới',
              Icons.crop_free,
              Colors.green,
            ),
            
            const SizedBox(height: 16),
            
            // Hướng dẫn SAI
            const Text(
              '❌ TRÁNH',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 8),
            _buildGuideItem(
              '❌ Tránh góc nghiêng',
              'Camera phải thẳng góc với người tập',
              Icons.screen_rotation,
              Colors.red,
            ),
            _buildGuideItem(
              '❌ Không bị che khuất',
              'Không để đồ vật che tay/chân',
              Icons.block,
              Colors.red,
            ),
            _buildGuideItem(
              '❌ Không chụp quá gần',
              'Phải thấy hết đầu, tay, chân trong khung',
              Icons.zoom_in,
              Colors.red,
            ),
            _buildGuideItem(
              '❌ Không ngược sáng',
              'Tránh đứng trước cửa sổ hoặc nguồn sáng mạnh',
              Icons.brightness_high,
              Colors.red,
            ),
            
            const SizedBox(height: 16),
            
            // Tip
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.tips_and_updates, color: Colors.blue.shade700, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Mẹo: Dùng giá đỡ điện thoại hoặc nhờ người khác chụp để có ảnh ổn định và toàn thân!',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue.shade900,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Đã Hiểu',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildGuideItem(String title, String desc, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  desc,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
