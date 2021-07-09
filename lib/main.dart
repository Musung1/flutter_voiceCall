import 'package:crud_project/constants/controller.dart';
import 'package:crud_project/controllers/NotificationController.dart';
import 'package:crud_project/controllers/noteController.dart';
import 'package:crud_project/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/authController.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized(); // 초기 바인딩? 공부
  await Firebase.initializeApp().then((value){ // 얘는 파이어베이스 쓰려면 해야함
    Get.put(AuthController());
    Get.put(NoteController());
    Get.put(NotificationController());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Splash(),
    );
  }
}
