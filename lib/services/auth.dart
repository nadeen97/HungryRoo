//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
//
//class AppAuth
//{
//  final FirebaseAuth _auth=FirebaseAuth.instance;
//  Future loginAuth({@required String email,@required String password})
//  async {
//
//    try{
//      var user =await _auth.signInWithEmailAndPassword(email: email, password: password);
//      return user!=null;
//    }
//    catch(e){
//      return e.messege;
//    }
//  }
//  Future signupAuth({@required String email,@required String password})
//  async {
//    try{
//      var authResult =await _auth.createUserWithEmailAndPassword(email: email, password: password);
//      return authResult.user;
//    }
//    catch(e){
//      return e.messege;
//    }
//  }
//}