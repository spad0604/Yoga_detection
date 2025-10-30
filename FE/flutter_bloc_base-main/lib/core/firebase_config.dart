import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_starter/data/states/auth/auth_bloc.dart';
import 'package:flutter_starter/presenter/app.dart';
import 'package:flutter_starter/presenter/navigation/navigation.dart';
import 'package:flutter_starter/di.dart';

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
      // Hiển thị notification hệ thống khi app đang foreground
      try {
        final notification = message.notification;
        final data = message.data;
        final title = notification?.title ?? data['title'] ?? 'Thông báo';
        final body = notification?.body ?? data['body'] ?? '';

        // Hiển thị notification với flutter_local_notifications
        final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
            FlutterLocalNotificationsPlugin();

        const AndroidNotificationChannel channel = AndroidNotificationChannel(
          'high_importance_channel',
          'Thông báo quan trọng',
          description: 'Kênh này được sử dụng cho các thông báo quan trọng.',
          importance: Importance.high,
        );

        flutterLocalNotificationsPlugin.show(
          message.hashCode,
          title,
          body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              importance: Importance.high,
              priority: Priority.high,
              icon: '@mipmap/ic_launcher',
            ),
          ),
        );
      } catch (e) {
        // ignore: avoid_print
        print('[FirebaseConfig] Error showing notification: $e');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Navigate to Friends page when user taps notification
      try {
        AppRouter(authBloc: provider.get<AuthBloc>()).push(const FriendsRoute());
      } catch (_) {}
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
