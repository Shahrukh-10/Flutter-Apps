import 'package:auth_ui/auth_functions/authentication.dart';
import 'package:auth_ui/components/already_have_acc.dart';
import 'package:auth_ui/components/rounded_button.dart';
import 'package:auth_ui/components/rounded_input.dart';
import 'package:auth_ui/components/rounded_pass.dart';
import 'package:auth_ui/components/text_field.dart';
import 'package:auth_ui/constants/constant.dart';
import 'package:auth_ui/screens/homeScreen/homescreen.dart';
import 'package:auth_ui/screens/login/components/background.dart';
import 'package:auth_ui/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../login_screen.dart';


class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key:key);
  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               Text('LOGIN',
                  style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height:size.height*0.03),
                SvgPicture.asset(
                  'assets/icons/login.svg',
                  height: size.height*0.35,
                ),
                SizedBox(height:size.height*0.01),
                TextFieldContainer(
                  child: RoundedInputField(
                    hintText: 'Your Email',
                    onChanged: (value){
                     _email='$value';
                    },
                  ),
                ),
                SizedBox(height:size.height*0.01),
                RoundedPassField(
                  onChanged: (value){
                    _password='$value';
                  },
                ),
                SizedBox(height:size.height*0.01),
                RoundedButton(
                  text: "LOGIN",
                  press: ()async{
                   bool result =await SignIn(_email, _password);
                   if(result)
                     {
                       print('success');
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));

                     }
                   else {
                     SnackBar(
                       content: Text('Error'),
                       action: SnackBarAction(
                         label: 'Retry',
                         onPressed: () {
                         },
                       ),
                     );
                   }
                  },
                ),
                SizedBox(height:size.height*0.03),
                AlreadyhadAccount(
                  login: true,
                  press: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                  },

                )
              ],
          ),
        )
    );
  }
}
