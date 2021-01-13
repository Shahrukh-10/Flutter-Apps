import 'package:auth_ui/components/already_have_acc.dart';
import 'package:auth_ui/components/rounded_button.dart';
import 'package:auth_ui/components/rounded_input.dart';
import 'package:auth_ui/components/rounded_pass.dart';
import 'package:auth_ui/constants/constant.dart';
import 'package:auth_ui/screens/login/login_screen.dart';
import 'package:auth_ui/screens/signup/components/background.dart';
import 'package:auth_ui/screens/signup/components/social_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'or_divider.dart';

class Body extends StatelessWidget {

  const Body({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Text('SIGNUP',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
              SizedBox(height: size.height*0.03),
              SvgPicture.asset(
                'assets/icons/signup.svg',
                height: size.height*0.35,
              ),
              SizedBox(height: size.height*0.01),
              RoundedInputField(
                hintText: 'Your Email',
                onChanged: (value){},
              ),
              SizedBox(height: size.height*0.01),
              RoundedPassField(
                onChanged: (value){},
              ),
              SizedBox(height: size.height*0.01),
              RoundedButton(
                text: 'SIGNUP',
                press: (){},
              ),
              SizedBox(height: size.height*0.03),
              AlreadyhadAccount(
                login: false,
                  press: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));}
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocialIcon(
                    socialIcons: 'assets/icons/facebook.svg',
                    press: (){},
                  ),
                  SocialIcon(
                    socialIcons: 'assets/icons/twitter.svg',
                    press: (){},
                  ),
                  SocialIcon(
                    socialIcons: 'assets/icons/google-plus.svg',
                    press: (){},
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}
