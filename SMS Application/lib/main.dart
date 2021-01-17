import 'package:flutter/material.dart';
import 'package:sms_app/components/textfield.dart';
import 'package:sms_app/function/smsfunc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String _no ;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purpleAccent[700],
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent[700],
          title: Text('SMS'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text_Field(
                onChanged: (value){
                  _no='$value';
                },
              ),
              SizedBox(height: 20,),
        Container(
            child: RaisedButton(
              child: Text(
                  'Send'
              ),
              onPressed: () {
                sendSms(_no);
              },
            )
        ),
            ],
          ),
        ),
      ),
    );
  }
}
