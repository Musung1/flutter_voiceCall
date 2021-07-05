import 'package:crud_project/constants/controller.dart';
import 'package:flutter/material.dart';
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("LOGIN"),
      ),
      body : Column(
        children: [
          TextField(
            controller:authController.email,
          ),
          TextField(
            controller:authController.password,
          ),
          TextButton(
            child : Text("로그인"),
            onPressed:()=> authController.signIn(),
          ),
          TextButton(
            child : Text("가입"),
            onPressed:() => authController.signUp(),
          ),

        ],
      ),
    );
  }
}
