import 'package:crud_project/constants/firebase.dart';
import 'package:crud_project/models/note.dart';
import 'package:crud_project/widget/cardwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NoteController extends GetxController{
  int count = 0;
  String noteCollection = 'notes' ;
  static NoteController instance = Get.find();
  TextEditingController name = TextEditingController();
  TextEditingController title = TextEditingController();
  List<NoteModel> notes =<NoteModel>[].obs;
  RxList<NoteModel> newNotes =<NoteModel>[].obs;

  @override
  void onReady() {
    super.onReady();
    newNotes.bindStream(getNotes());
  }
  addList(){ // 노트 받아서 리스트로 만듬
    notes.add(NoteModel(name.text,title.text));
    addNoteToFirebase(notes[count]);
    count ++;
}
addNoteToFirebase(NoteModel noteModel){
    firebaseFirestore.collection(noteCollection).doc(count.toString()).set({
      'name' : name.text.trim(), 'title' : title.text.trim(),
    });
}
  Stream <List<NoteModel>> getNotes() =>
    firebaseFirestore.collection(noteCollection).snapshots().map((value) =>
      value.docs.map((item)=>
        NoteModel.fromMap(item.data())
      ).toList()
    );



}