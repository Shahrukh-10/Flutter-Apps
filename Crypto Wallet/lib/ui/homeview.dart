import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe/net/api_methods.dart';
import 'package:coffe/ui/addview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double bitcoin=0.0;
  double ethereum=0.0;
  double tether=0.0;

  @override
  void initState() {
    getValues();
  }
  getValues() async{
    bitcoin= await getPrice('bitcoin');
    ethereum= await getPrice('ethereum');
    tether= await getPrice('tether');
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    getValue(String id,double amount)
    {
      if(id=='bitcoin')
        {
          return bitcoin * amount;
        }
      else if(id=='ethereum')
      {
        return ethereum * amount;
      }
      else{
        return tether * amount;
      }
    }
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.
          collection('Users').
          doc(FirebaseAuth.instance.currentUser.uid).
          collection('Coins').
          snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
          {
            if(!snapshot.hasData)
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            return ListView(
                children: snapshot.data.docs.map((document) {
              return Container(
                padding: EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 0.0),
                child: Container(
                  height: 115.0,
                  child: Card(
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Coins : ${document.id}',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),),
                        Text('Amount : \₹ ${getValue(document.id, document.data()['Amount']).toStringAsFixed(2)}',style: TextStyle(
                            fontSize: 18.0,
                        )
                        ),
                    ],
                    ),
                  ),
                ),
              );
            },
            ).toList(),
            );

          },
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Addview()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,

      ),
      );
  }
}
