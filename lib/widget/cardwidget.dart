import 'package:crud_project/constants/controller.dart';
import 'package:crud_project/controllers/audioChatController.dart';
import 'package:crud_project/controllers/noteController.dart';
import 'package:crud_project/models/room.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_state_manager/src/simple/get_view.dart';

class CardWidget extends GetWidget<NoteController> {
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Column(
      children: audioController.channels.map((value){
        return SingleCard(channel: value);
      }).toList(),
    ));
  }
}

class SingleCard extends StatelessWidget {
  const SingleCard({
    Key? key,
    required this.channel,
  }) : super(key: key);

  final RoomModel channel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width : 200,
        height : 50,
        color : Colors.amberAccent,
        child : Column(
          children: [
            Text(channel.channel!),
          ],
        ),
      ),
    );
  }
}
