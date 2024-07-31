import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class API {

  //provider
  API.internal();

  //instance
  static final API _instance = API.internal();

  //with static filed
  static API get instance => _instance;

  Future signupUser (String email , String password , Function() completion) async {
    try{
      final creds = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      completion();
    }on FirebaseAuthException catch (e) {
      if (e.code == "The password provided is too weak.") {
        print("The password provided is too weak.");
      }else if (e.code == "email-already-in-use"){
        print('The account already exists for that email.');
      }
      completion();
    }catch (e) {
      print(e);
      completion();
    }
  }



}
