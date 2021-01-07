import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> signIn(String email,String pass) async{
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);
    return true;
  }catch(e)
  {
    return false;
  }
}
Future<bool> register(String email,String pass) async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass);
      return true;
    } on FirebaseAuthException catch(e) {
      if (e.code == 'weak-password') {
        print('weak password');
      }
      else if (e.code == 'email-already-in-use') {
        print('account already exist');
      }
    return false;
    }catch(e)
    {
      print(e.toString());
      return false;
    }

}
Future<bool> addCoin(String id,String amount) async{

    try{
      String uid =FirebaseAuth.instance.currentUser.uid;
      var value = double.parse(amount);
      DocumentReference documentReference = FirebaseFirestore.instance.
          collection('Users').
          doc(uid).
          collection('Coins').
          doc(id);
      FirebaseFirestore.instance.runTransaction((transaction) async{
        DocumentSnapshot snapshot = await transaction.get(documentReference);
        if(!snapshot.exists){
          documentReference.set({"Amount": value});
          return true;
        }
        else{
          double newAmount = snapshot.data()['Amount']+value;
          transaction.update(documentReference, {'Amount':newAmount});
          return true;
        }
      });
    }catch(e){
      return false;
    }
}