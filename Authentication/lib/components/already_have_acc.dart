import 'dart:math';

import 'package:auth_ui/constants/constant.dart';
import 'package:flutter/material.dart ';

class AlreadyhadAccount extends StatelessWidget {
  final bool login;
  final Function press;

  const AlreadyhadAccount({
    Key key,
    this.login,
    this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
            login ? "Don't have an Account ? " : "Already have an Account ?",
            style: TextStyle(
              color: kprimaryColor,
              fontWeight: FontWeight.bold,
            )
        ),
        GestureDetector(
          onTap: press,
          child: Text(
              login ? 'Sign Up':'Sign In',
              style: TextStyle(
                color: kprimaryColor,
                fontWeight: FontWeight.bold,
              )
          ),

        )
      ],
    );
  }
}
