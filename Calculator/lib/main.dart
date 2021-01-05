import 'package:flutter/material.dart';
import 'package:calculator/widgets/calcButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
void main() {
  runApp(Calculator());
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String history = '';
  String expression = '';

  void numClick(String text)
  {
      setState(() {
        if(expression.length<20)
          {
            expression +=text;
          }
        else{
          expression;
        }
      });
  }
  void allClear(String text)
  {
    setState(() {
      history='';
      expression='';
    });
  }
  void clear(String text)
  {
    setState(() {
      expression='';
    });
  }
  void evaluate(String text)
  {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      setState(() {
        history = expression;
        expression = eval.toString();
      });
    }
    catch(e)
    {
      setState(() {
        history='';
        expression='error !';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0.0,0.0,25.0,12.0),
                child: Text(
                  history,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                        fontSize: 24.0,
                        color: Color(0xFF545F61),
                    ),
                  ),
                ),
                alignment: Alignment.centerRight,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0,0.0,25.0,12.0),
                child: Text(
                expression,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      fontSize: 48.0,
                      color: Colors.white
                    ),
                  ),
                ),
                alignment: Alignment.centerRight,
                ),
              SizedBox(height: 30.0),
              Divider(height: 0.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: 'AC',
                    fillColor: 0xFF6C807F ,
                    callback: allClear,
                  ),
                  CalcButton(
                    text: 'C',
                    fillColor: 0xFF6C807F,
                    callback: clear,

                  ),CalcButton(
                    text: '%',
                    fillColor: 0xFFFFFFFF,
                    textColour: 0xFF65BDAC,
                    callback: numClick,

                  ),CalcButton(
                    text: '*',
                    fillColor: 0xFFFFFFFF,
                    textColour: 0xFF65BDAC,
                    callback: numClick,

                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '7',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '8',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '9',
                    callback: numClick,
                  ),CalcButton(
                    text: '-',
                    fillColor: 0xFFFFFFFF,
                    textColour: 0xFF65BDAC,
                    callback: numClick,

                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '4',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '5',
                    callback: numClick,
                  ),CalcButton(
                    text: '6',
                    callback: numClick,
                  ),CalcButton(
                    text: '/',
                    fillColor: 0xFFFFFFFF,
                    textColour: 0xFF65BDAC,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '1',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '2',
                    callback: numClick,
                  ),CalcButton(
                    text: '3',
                    callback: numClick,
                  ),CalcButton(
                    text: '+',
                    fillColor: 0xFFFFFFFF,
                    textColour: 0xFF65BDAC,
                    callback: numClick,
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '.',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '0',
                    callback: numClick,
                  ),CalcButton(
                    text: '00',
                    callback: numClick,
                  ),CalcButton(
                    text: '=',
                    fillColor: 0xFFFFFFFF,
                    textColour: 0xFF65BDAC,
                    callback: evaluate,
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
