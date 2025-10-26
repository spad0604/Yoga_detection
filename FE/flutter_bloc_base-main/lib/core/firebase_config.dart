import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseConfig {
  Future<void> initFCM() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings =
        await messaging.requestPermission(alert: true, badge: true, sound: true);

    String? token = await messaging.getToken();
    // debug log
    try {
      // ignore: avoid_print
      print('[FirebaseConfig] initial FCM token: $token');
    } catch (_) {}

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle foreground messages
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle messages that opened the app from a terminated state
    });
  }

  Future<String?> getFcmToken() async {
    // Try a few times to get token as it may not be immediately available
    for (int attempt = 0; attempt < 3; attempt++) {
      try {
        final token = await FirebaseMessaging.instance.getToken();
        // ignore: avoid_print
        print('[FirebaseConfig] getFcmToken attempt=${attempt + 1}, token=$token');
        if (token != null && token.isNotEmpty) return token;
      } catch (e) {
        // ignore: avoid_print
        print('[FirebaseConfig] getFcmToken error: $e');
      }
      await Future.delayed(const Duration(milliseconds: 500));
    }
    return null;
  }
}
