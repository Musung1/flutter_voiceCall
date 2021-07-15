import 'package:crud_project/constants/controller.dart';
import'package:flutter/material.dart';
import 'package:get/get.dart';
class ChatRoom extends StatelessWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title : Text(audioController.channelName.text),
      ),
      body: Center(
        child : Column(
          children: [
            Text('ChatRoom'),
            TextButton(
              child : Text("종료"),
              onPressed: (){
                audioController.dispose();
                Get.back();
                },
            ),
          ],
        ),
      ),
    );
  }
}
