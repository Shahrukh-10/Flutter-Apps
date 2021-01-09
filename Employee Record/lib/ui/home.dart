import 'package:firebase_learn/net/user_setup.dart';
import 'package:flutter/material.dart';

import 'details_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _name = TextEditingController();
    TextEditingController _phone = TextEditingController();
    TextEditingController _address = TextEditingController();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Add Details'),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.grey[800],
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0,30.0,40.0,0.0),
                  child: TextFormField(
                    controller: _name,
                    decoration: const InputDecoration(
                    icon: Icon(Icons.person,),
                    hintText: 'Enter Name',
                    labelText: 'Name ',
                    )
                  ),
                ),
                SizedBox(height: 0.0,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0,30.0,40.0,0.0),
                  child: TextFormField(
                      controller: _address,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.home),
                        hintText: 'Address',
                        labelText: 'Enter Add',
                      )
                  ),
                ),
                SizedBox(height: 0.0,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0,30.0,40.0,0.0),
                  child: TextFormField(
                      controller: _phone,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.phone),
                        hintText: 'Phone No',
                        labelText: 'Enter Phone no',
                      )
                  ),
                ),
                SizedBox(height: 35.0,),
                Container(
                      child: RaisedButton(
                        color: Colors.grey[900],
                        onPressed: () async{
                         bool result = await userSetup(_name.text,_address.text,_phone.text);
                         if(result)
                           {
                             Navigator.pop(context);
                           }
                        },
                        child: Text('Add Employee',
                        style: TextStyle(
                          color: Colors.white30
                        ),),
                      )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
