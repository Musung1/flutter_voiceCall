import 'package:crud_project/constants/controller.dart';
import 'package:crud_project/models/note.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class NewCard extends StatelessWidget {
  const NewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView(
      children: noteController.newNotes.map((NoteModel note){
        return Column(
          children : [
            Text(note.name!),
            Text(note.title!),
        ],
      );
      },
    ).toList()),
    );
  }
}
