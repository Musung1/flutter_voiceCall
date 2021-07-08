import 'package:crud_project/constants/controller.dart';
import 'package:crud_project/constants/firebase.dart';
import 'package:crud_project/screens/Home.dart';
import 'package:crud_project/screens/login.dart';
import 'package:crud_project/screens/recommand.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  static AuthController instance = Get.find();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  late Rx<User?>firebaseUser;
  String usersCollection = "users";

  @override
  void onReady() {
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser,(User? a)=>setScreen(a));
    super.onReady();
  }
  setScreen(User? user){
    if(user == null) Get.to(()=>Login());
    else Get.to(()=>Home());
  }
  void signIn(){
    auth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text).then((value)=> clearControllers());

  }
  void signUp(){
    try{auth.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),).then((result){
          String uid = result.user!.uid;
          addUserToFirebase(uid);
          clearControllers();
    });}
    catch(e){
      Get.snackbar("실패", "다시시도");
    }
  }
  clearControllers(){
    email.clear();
    password.clear();
  }
  void signOut() {
    auth.signOut();
    clearControllers();
  }
  addUserToFirebase(String userId)async{
    await firebaseFirestore.collection(usersCollection).doc(userId).set({
      "id": userId, "email": email.text.trim()
    });
  }
}