import 'package:crud_project/constants/firebase.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController{
  static NotificationController instance = Get.find();

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
      if(message.notification != null){
        print('Message also contained a notification : ${message.notification!.body} and ${message.notification!.title}');
      }
    });

  }
  Future<void> _getToken()async{
    try{
      String? token = await firebaseMessaging.getToken();
      print("토근 $token");
    }
    catch(e){}
  }
}