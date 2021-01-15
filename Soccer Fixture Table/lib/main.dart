import 'package:auth_ui/constants/constant.dart';
import 'package:auth_ui/screens/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Auth',
        theme: ThemeData(
          primaryColor: kprimaryColor,
          scaffoldBackgroundColor: Colors.deepPurple[900],
        ),
        home: WelcomeScreen(),
     );
  }
}
