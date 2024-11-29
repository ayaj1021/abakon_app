import 'dart:developer';

import 'package:abakon/data/local_data_source/local_storage_impl.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotifications {
  static final _firebaseMessaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//request notification permission
  static Future init() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    //get device token
    final token = await _firebaseMessaging.getToken();
    await SecureStorage().saveUserFirebaseToken(token.toString());
    log('this is user token $token');
  }

//initialize local notifications
  static Future localNotificationInit() async {
    const AndroidInitializationSettings initializationSettingsAndriod =
        AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            // onDidReceiveLocalNotification: (id, title, body, payload) => null,
            );

    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndriod,
      iOS: initializationSettingsDarwin,
      linux: initializationSettingsLinux,
    );

    //request notification permission for android 13 or above
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onNotificationTap,
      onDidReceiveBackgroundNotificationResponse: onNotificationTap,
    );
  }

  //on tap local notification in foreground
  static void onNotificationTap(NotificationResponse notificationResponse) {}
}
