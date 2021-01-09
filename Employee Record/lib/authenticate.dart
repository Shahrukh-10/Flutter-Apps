import 'package:firebase_learn/auth_method.dart';
import 'package:firebase_learn/ui/details_view.dart';
import 'package:firebase_learn/ui/home.dart';
import 'package:flutter/material.dart';
class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _email =TextEditingController();
  TextEditingController _password =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width/1.3,
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: _email,
                decoration: InputDecoration(
                    hintText: 'Example.com',
                    hintStyle: TextStyle(
                        color: Colors.white
                    ),
                    labelText: 'E-mail',
                    labelStyle: TextStyle(
                        color: Colors.white
                    )
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width/1.4,
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                        color: Colors.white
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: Colors.white
                    )
                ),
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: MediaQuery.of(context).size.width/1.4,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white
              ),
              child: MaterialButton(
                onPressed: () async{
                  bool navigate = await register(_email.text, _password.text);
                  if(navigate){
                    //navigate
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Details_View() ));
                  }
                  else{
                    //error
                  }
                },
                child: Text('Register'),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width/1.4,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white
              ),
              child: MaterialButton(
                onPressed: () async{
                  bool navigate = await signIn(_email.text, _password.text);
                  if(navigate){

                  print('success');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Details_View() ));
                    //navigate
                  }
                  else{
                    //error
                  }
                },
                child: Text('Log in'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
