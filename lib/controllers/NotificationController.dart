import 'package:crud_project/constants/firebase.dart';
import 'package:crud_project/service/local_notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:crud_project/screens/pushscreen.dart';

class NotificationController extends GetxController{
  static NotificationController instance = Get.find();

  @override
  void onReady()async{
    super.onReady();
    LocalNotificationService.initialize();
    FirebaseMessaging.instance.getInitialMessage(); //
    _initNotification();


  }
  //Receive message when app is in background
  Future<void> backgroundHandler(RemoteMessage message) async{
  }
  _initNotification() async {
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
      }
      LocalNotificationService.display(message);
    }
    );
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];
      Get.to(()=>PushScreen());
    });

  }
}