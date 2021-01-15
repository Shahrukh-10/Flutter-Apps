
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<bool> SignIn(String email,String password)async{
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password);
    return true;
  }
  catch(e)
  {
    print(e.toString());
    return false;
  }

}
Future<bool> SignUp(String email,String password)async{
  try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, password: password);
    return true;
  }
  catch(e)
  {
    print(e.toString());
    return false;
  }

}