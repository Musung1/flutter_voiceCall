import 'package:crud_project/constants/controller.dart';
import 'package:crud_project/controllers/noteController.dart';
import 'package:crud_project/models/note.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CardWidget extends GetWidget<NoteController> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: noteController.notes.map((value){
        return SingleCard(note: value);
      }).toList(),
    );
  }
}

class SingleCard extends StatelessWidget {
  const SingleCard({
    Key? key,
    required this.note,
  }) : super(key: key);

  final NoteModel note;

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
            Text(note.name!),
            Text(note.title!),
          ],
        ),
      ),
    );
  }
}
