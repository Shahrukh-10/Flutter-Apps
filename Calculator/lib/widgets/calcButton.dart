import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {

  final String text;
  final int textColour;
  final double textsize;
  final Function callback;
  final int fillColor;
  const CalcButton({Key key,
    this.text,
    this.fillColor,
    this.callback,
    this.textColour=0xFFFFFFFF,
    this.textsize=24,
  })
      :super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: SizedBox(
        width: 65,
        height: 65,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(50),
          ),
          child: Text(text,
            style: GoogleFonts.rubik(
            textStyle: TextStyle(
                fontSize: 24.0,
            ),
            ),
          ),
          onPressed: (){
              callback(text);
          },
          color: fillColor!=null ? Color(fillColor):null,
          textColor: Color(textColour),
        ),
      ),
    );
  }
}
