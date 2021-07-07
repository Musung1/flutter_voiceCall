import 'package:crud_project/widget/newCard.dart';
import 'package:flutter/material.dart';
class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title : Text("바구니"),
      ),
      body : NewCard(),
      );
  }
}
