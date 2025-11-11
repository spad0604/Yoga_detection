# 🔧 Orientation Lock Fix - Hướng dẫn

## ❌ Vấn đề
Khi phóng to video YouTube sang chế độ fullscreen (landscape), app bị xoay ngang và không quay về portrait mode khi:
- Thoát fullscreen
- Back từ video player
- Back từ trang Pose Details

## ✅ Giải pháp đã áp dụng

### 1. **YouTube Video Card** (`lib/presenter/widgets/youtube_video_card.dart`)

#### Thay đổi:
- **Import** `flutter/services.dart` để sử dụng `SystemChrome`
- **initState()**: Lock orientation về portrait khi widget khởi tạo
- **_initializePlayer()**: 
  - Lắng nghe sự kiện fullscreen của YouTube player
  - Khi **vào fullscreen**: Cho phép landscape + portrait
  - Khi **thoát fullscreen**: Lock lại về portrait only
- **dispose()**: Đảm bảo reset về portrait khi widget bị hủy

```dart
void _lockOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

// Listen to fullscreen changes
_controller!.addListener(() {
  if (_controller!.value.isFullScreen) {
    // Allow landscape in fullscreen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  } else {
    // Lock back to portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
});
```

### 2. **Pose Details Page** (`lib/presenter/pages/pose_details/pose_details.dart`)

#### Thay đổi:
- **initState()**: Lock orientation về portrait khi vào trang
- **dispose()**: Reset orientation về portrait khi rời trang

```dart
@override
void initState() {
  super.initState();
  
  // Lock orientation to portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  // ... rest of code
}

@override
void dispose() {
  // Ensure orientation is reset to portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  super.dispose();
}
```

### 3. **Camera Detection Page** (`lib/presenter/pages/camera_detection/camera_detection.dart`)

#### Thay đổi:
- **dispose()**: Reset orientation về portrait khi thoát camera

> **Lưu ý**: Camera page vẫn cho phép cả landscape và portrait trong khi sử dụng (để linh hoạt khi chụp), nhưng sẽ reset về portrait khi thoát.

```dart
@override
void dispose() {
  // ... existing dispose code
  
  // Reset orientation to portrait when leaving camera page
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  super.dispose();
}
```

## 🎯 Flow hoạt động

### Kịch bản 1: Xem video YouTube
1. ✅ Vào Pose Details → **Locked portrait**
2. ✅ Tap thumbnail → Player hiển thị portrait
3. ✅ Tap fullscreen → **Cho phép landscape**
4. 📱 Màn hình tự động xoay ngang
5. ✅ Thoát fullscreen → **Lock lại portrait**
6. 📱 Màn hình tự động quay về dọc
7. ✅ Back từ page → **Reset portrait**

### Kịch bản 2: Chụp ảnh yoga pose
1. ✅ Vào Pose Details → **Locked portrait**
2. ✅ Tap "Start Practice" → Vào Camera → **Cho phép landscape + portrait**
3. 📸 Chụp ảnh (có thể dọc hoặc ngang)
4. ✅ Back từ camera → **Reset portrait**
5. ✅ Quay về Pose Details → Portrait mode

## 🔍 Kiểm tra

### Test cases cần thử:
- [ ] Xem video YouTube ở portrait mode
- [ ] Phóng to video → màn hình xoay ngang
- [ ] Thoát fullscreen → màn hình quay về dọc
- [ ] Back khi đang xem video → quay về portrait
- [ ] Vào camera, xoay ngang
- [ ] Back từ camera → quay về portrait
- [ ] Navigate giữa các trang → luôn portrait (trừ video fullscreen)

## 📦 Dependencies liên quan

```yaml
# pubspec.yaml
dependencies:
  youtube_player_flutter: ^9.0.4  # Hỗ trợ fullscreen detection
```

## 🚀 Cách chạy sau khi update

```powershell
# Option 1: Sử dụng virtual drive (khuyến nghị)
.\quick_setup.ps1
flutter run

# Option 2: Manual
flutter clean
flutter pub get
flutter run
```

## 💡 Tips

### Nếu vẫn bị xoay ngang:
1. Restart app hoàn toàn (không chỉ hot reload)
2. Kiểm tra device settings → Auto-rotate có bật không
3. Test trên device thật (emulator đôi khi không chính xác)

### Customize orientation cho trang khác:
```dart
// Lock portrait
SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown,
]);

// Lock landscape
SystemChrome.setPreferredOrientations([
  DeviceOrientation.landscapeLeft,
  DeviceOrientation.landscapeRight,
]);

// Allow all
SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown,
  DeviceOrientation.landscapeLeft,
  DeviceOrientation.landscapeRight,
]);
```

## ⚠️ Lưu ý quan trọng

1. **Luôn reset orientation trong dispose()** để tránh ảnh hưởng trang khác
2. **YouTube player listener** rất quan trọng để detect fullscreen mode
3. **Camera page** cần linh hoạt hơn nên cho phép cả landscape
4. **Hot reload** có thể không áp dụng orientation changes → cần **hot restart**

## 📝 Changelog

- ✅ Thêm orientation lock cho YouTube Video Card
- ✅ Thêm fullscreen detection và auto-rotate
- ✅ Lock Pose Details page ở portrait mode
- ✅ Reset orientation khi dispose Camera page
- ✅ Đảm bảo app luôn quay về portrait khi back

---

**Tác giả**: GitHub Copilot  
**Ngày**: 11/11/2025  
**Version**: 1.0
