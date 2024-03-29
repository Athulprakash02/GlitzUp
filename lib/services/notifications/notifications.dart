import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:glitzup/main.dart';

String? fcmToken;

class FirebaseNotification {
  static final _firebaseMessaging = FirebaseMessaging.instance;

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      // saveNoti
    }
  }

  Future<void> initNotification() async {
    try {
      await _firebaseMessaging.requestPermission();
      fcmToken = await _firebaseMessaging.getToken();
      await storeToken();

      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
      await _firebaseMessaging.setForegroundNotificationPresentationOptions(
          alert: true, badge: true, sound: true);
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;

        if (notification != null && android != null) {
          // saveNotificationToFirestore(notification, message.data);
          flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    channelDescription: channel.description,
                    color: Colors.white,
                    playSound: true,
                    icon: "@mipmap/ic_launcher"),
              ));
        }
      });
    } catch (e) {}
  }

  static storeToken() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(
        {"fcmToken": token},
        SetOptions(merge: true),
      );
    } catch (e) {
      print(e);
    }
  }

  void saveNotificationToFirestore(
      RemoteNotification notification, Map<String, dynamic> data) {
    final firestore = FirebaseFirestore.instance;

    // ignore: duplicate_ignore, duplicate_ignore
    try {
      final notificationData = {
        'title': notification.title,
        'body': notification.body,
        'timestamp': DateTime.now(),
        'uid': FirebaseAuth.instance.currentUser!.uid,
        // 'user_uid': data['uid'],
      };

      firestore
          .collection('user_notifications')
          .add(notificationData)
          .then((_) {})
          .catchError((error) {});
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<void> sendNotification(String title, String body) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description,
            color: Colors.white,
            playSound: true,
            icon: "@mipmap/ic_launcher");

    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      title,
      body,
      platformChannelSpecifics,
    );
  }
}
