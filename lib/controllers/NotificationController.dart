import 'package:crud_project/constants/firebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationController extends GetxController{
  static NotificationController instance = Get.find();
  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      'This channel is used for important notifications',
      importance: Importance.high,
      playSound: true);
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async{
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await flutterLocalNotificationsPlugin
    .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
    ?.createNotificationChannel(channel);
  }

  @override
  void onReady()async{
    super.onReady();
    FirebaseMessaging.instance.getInitialMessage();
    _getToken();
    _initNotification();


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
    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      print("got a message = ${message.data}");
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if(message.notification != null){
        print('Message also contained a notification : ${message.notification!.body} and ${message.notification!.title}');
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification!.title,
          notification!.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channel.description,
              color: Colors.blue,
              playSound: true,
              icon: '@mipmap/ic_launcher',
            ),
          )
        );
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
      print('새 메세지 오픈');
       RemoteNotification? notification = message.notification;
       AndroidNotification? android = message.notification?.android;
       if(notification != null && android != null){
         Get.dialog(
           AlertDialog(
             title : Text(notification.title!),
             content: SingleChildScrollView(
               child : Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(notification.body!),
                 ],
               ),
             ),
           ),
         );
         }
       }
    );

  }
  Future<void> _getToken()async{
    try{
      String? token = await firebaseMessaging.getToken();
      print("토근 $token");
    }
    catch(e){}
  }
  void showNotification(){
    flutterLocalNotificationsPlugin.show(
      0,
      "새로운 메세지",
      "hello",
      NotificationDetails(
        android: AndroidNotificationDetails(
            channel.id,
            channel.name, channel.description,
            importance: Importance.high,
            color: Colors.blue,
            playSound: true,
            icon: '@mipmap/ic_launcher'
        ),
      ),
    );
  }
}