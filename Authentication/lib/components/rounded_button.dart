import 'package:auth_ui/constants/constant.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color ;
  final Color textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = kprimaryColor,
    this.textColor,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
            onPressed: press,
            color: color,
            child: Text(text,
              style: TextStyle(
                  color: textColor,
                  letterSpacing: 2.0
              ),
            )
        ),
      ),
    );
  }
}