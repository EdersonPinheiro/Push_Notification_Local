import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../../notification_service.dart';

class FirebaseMessagingService {
  final NotificationService _notificationService;

  FirebaseMessagingService(this._notificationService);

  Future<void> initialize() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      badge: true,
      sound: true,
      alert: true,
    );

    getDeviceFirebaseToken();
    onMessage();
  }

  getDeviceFirebaseToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    debugPrint('===============================');
    debugPrint('Token = $token');
    debugPrint('===============================');
  }

  onMessage() {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification =
          message.notification; // remote messaging
      AndroidNotification? android =
          message.notification?.android; //android etc..

      if (notification != null && android != null) {
        _notificationService.showNotification(
          CustomNotification(
            id: android.hashCode,
            title: notification.title!, //nao é nulo
            body: notification.body!,
            payload: message.data['route'] ?? '',
          ),
        );
      }
    });
  }
}
