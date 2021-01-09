
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<bool> userSetup(String name, String phone, String address) async{

 try{
    String uid = FirebaseAuth.instance.currentUser.uid.toString();
    DocumentReference documentReference = FirebaseFirestore.instance.collection('New Users')
        .doc(uid).collection('Employees')
        .doc(name);

    FirebaseFirestore.instance.runTransaction((transaction) async{
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if(!snapshot.exists)
      {
        documentReference.set({
          "Name" : name,
          "Phone No" : address,
          "Address" : phone
        });
      }
    });

    return true;
  }catch(e)
  {
    return false;
  }

}