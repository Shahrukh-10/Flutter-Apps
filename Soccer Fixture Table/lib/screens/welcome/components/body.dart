import 'package:auth_ui/components/rounded_button.dart';
import 'package:auth_ui/constants/constant.dart';
import 'package:auth_ui/screens/login/login_screen.dart';
import 'package:auth_ui/screens/signup/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 170),
                child: Container(
                  child: Text('Welcome to Barca',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                    color: Colors.white
                  ),
                  ),
                ),
              ),
            SizedBox(
              height: 70.0,
            ),
            Container(
                child: Image(image: AssetImage('assets/images/barc.png'),
                width: size.width*0.4 )
            ),
            SizedBox(
              height: 60.0,
            ),
            RoundedButton(
              text: "LOGIN",
              color: kprimaryColor,
              textColor: Colors.white,
              press: (){
                Navigator.push(context, MaterialPageRoute(builder: (Context) => LoginScreen()));
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            RoundedButton(
              text: "SIGN UP",
              color: Colors.white38 ,
              textColor: Colors.white,
              press: (){
                Navigator.push(context, MaterialPageRoute(builder: (Context) => SignUpScreen()));
              },
            )

        ],
    ));
  }
}


