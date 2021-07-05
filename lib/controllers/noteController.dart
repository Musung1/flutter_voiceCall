import 'package:crud_project/models/note.dart';
import 'package:crud_project/widget/cardwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteController extends GetxController{
  static NoteController instance = Get.find();
  TextEditingController name = TextEditingController();
  TextEditingController title = TextEditingController();
  RxList<NoteModel> notes =RxList<NoteModel>([]);
  @override
  void onReady() {
    super.onReady();
  }
  addList(){ // 노트 받아서 리스트로 만듬
    notes.add(NoteModel(name.text,title.text));
    print("${name.text},${title.text}");
}


}