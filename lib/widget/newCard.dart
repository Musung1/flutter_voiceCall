import 'package:crud_project/constants/controller.dart';
import 'package:crud_project/models/note.dart';
import 'package:crud_project/models/room.dart';
import 'package:crud_project/screens/chatRoom.dart';
import 'package:crud_project/screens/chatroom2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class NewCard extends StatelessWidget {
  const NewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView(
      children: audioController.channels.map((RoomModel room){
        return Column(
          children : [
            TextButton(
              onPressed :(){
                audioController.joinChannel(room.channel!);
                Get.to(()=>ChatRoom());
        },
              child : Text(room.channel!),
            ),
        ],
      );
      },
    ).toList()),
    );
  }
}
