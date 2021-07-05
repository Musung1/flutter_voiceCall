import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("스플래시"),
      ),
      body: Center(
        child : CircularProgressIndicator(),
          ),
    );
  }
}
