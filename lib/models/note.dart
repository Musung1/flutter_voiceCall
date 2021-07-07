import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel{
  static const NAME = "name";
  static const TITLE = "title";
  String? name;
  String? title;
  NoteModel(this.name,this.title);
  NoteModel.fromMap(Map<String,dynamic> data){
    name = data[NAME];
    title = data[TITLE];
  }
}