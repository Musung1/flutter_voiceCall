import 'package:crud_project/constants/controller.dart';
import 'package:crud_project/controllers/noteController.dart';
import 'package:crud_project/screens/cart.dart';
import 'package:crud_project/widget/cardwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Home extends StatelessWidget {
  Iterable<SingleCard> n1 = noteController.notes.map((value){
    return SingleCard(note: value);
  }).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("홈"),
        actions: [
          IconButton(
            icon: Icon(Icons.cake),
            onPressed: () => Get.to(()=>Cart()),
          ),
        ],
      ),
      body : Column(
        children: [
          TextField(
            controller: noteController.name,
          ),
          TextField(
            controller : noteController.title,
          ),
          TextButton(
            child : Text("등록"),
            onPressed:(){
              noteController.addList();
            } ,
          ),
          TextButton(
            child : Text("로그아웃"),
            onPressed:(){
              authController.signOut();
            } ,
          ),
          SizedBox(
            height : 30,
          ),
          CardWidget(),
        ],
      ),
    );
  }

}

