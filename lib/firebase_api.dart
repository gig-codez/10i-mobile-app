import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'exports/exports.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// @pragma('vm:entry-point')
// Future<void> handleBackgroundMessage(RemoteMessage message) async{
//   storeMessage(message);
// }

Future<void> handleForegroundMessage(RemoteMessage message) async {
  AndroidNotificationDetails androidNotificationDetails =
      const AndroidNotificationDetails('id_1', 'channel_name',
          priority: Priority.high, importance: Importance.max, playSound: true);

  NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);
  await flutterLocalNotificationsPlugin.show(
      0,
      message.notification!.title ?? '',
      message.notification!.body ?? '',
      notificationDetails);
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  static FirebaseApi instance = FirebaseApi._();
  FirebaseApi._();

  Future<void> initNotifications() async {
    try {
      await _firebaseMessaging.requestPermission();
      FirebaseMessaging.onMessage.listen(handleForegroundMessage);

      // todo: implement fcm for apple
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
        if (apnsToken != null) {
          // APNS token is available, make FCM plugin API requests...
          String? token = await FirebaseMessaging.instance.getToken();
          if (token != null) {
            print("Token => $token");
            AuthService().updateFcmToken(token);
          }
        }
      }

      FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
        print(fcmToken);
        AuthService().updateFcmToken(fcmToken);
      }).onError((err) {
        debugPrint(err);
      });

      debugPrint(await FirebaseMessaging.instance.getToken());
      FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
          alert: true, badge: true, sound: true);
      initPushNotifications();
    } catch (e) {
      log(e.toString());
    }
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
    FirebaseMessaging.instance.getInitialMessage();
    // FirebaseMessaging.onMessageOpenedApp.listen();
    // FirebaseMessaging.onBackgroundMessage();
  }

  static init() async {
    instance.initNotifications();
    await initLocalNotifications();
  }

  static Future initLocalNotifications() async {
    var androidSettings =
        const AndroidInitializationSettings('mipmap/ic_launcher');
    var iosSettings = const DarwinInitializationSettings();
    var initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );
    await flutterLocalNotificationsPlugin.initialize(initSettings);
  }
}
