
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trackex/home.dart';
import 'signin.dart';
import 'main.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
Future login(emaillogin,paswordlogin,context) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emaillogin.text.trim(),
      password: paswordlogin.text.trim(),
    );
    emaillogin.clear();
    paswordlogin.clear();
    // Navigator.replace(
    //     context, oldRoute: MaterialPageRoute(builder: (context) => Login()),
    //     newRoute: MaterialPageRoute(builder: (context) => home()));
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
    // Navigator.pop(context);
  } on FirebaseAuthException catch (e) {
    final snackBar = SnackBar(
        content: Text(e.code,style: TextStyle(
          color: Colors.white,
        )),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
            emaillogin.clear();
            paswordlogin.clear();
          },
        )
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
Future signup1(emailsign,paswordsign,context) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailsign.text.trim(),
      password: paswordsign.text.trim(),
    );
    emailsign.clear();
    paswordsign.clear();
    Navigator.pop(context);

    // Navigator.replace(
    //     context, oldRoute: MaterialPageRoute(builder: (context) => Login()),
    //     newRoute: MaterialPageRoute(builder: (context) => home()));
  } on FirebaseAuthException catch (e) {
    final snackBar = SnackBar(
        content: Text(e.code),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
            emailsign.clear();
            paswordsign.clear();
          },
        )
    );
  }
}


Future<void> signup(emailsign,passwordsign,displayName,context) async {
  try {
    final auth = FirebaseAuth.instance;

    // Create the user account with email and password
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: emailsign.text.trim(),
      password: passwordsign.text.trim(),
    );

    // Update the user's display name
    User? user = userCredential.user;
    await user?.updateDisplayName(displayName);

    emailsign.clear();
    passwordsign.clear();
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));

  } on FirebaseAuthException catch (e) {
    final snackBar = SnackBar(
        content: Text(e.code),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
            emailsign.clear();
            passwordsign.clear();
          },
        )
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
String? getUserName() {
  User? user = FirebaseAuth.instance.currentUser;
  String? displayName = user?.displayName;
  return displayName;
}
// Future Addata1(
//     datetime, amount,type,what,note,context
//     )async{
//   final docuser =FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser?.email??'Unknown User');
//   //.doc(getUserName());
//       final json ={
//         'datetime':datetime,
//         'amount':amount.text.trim(),
//         'type' : type,
//         'what' : what,
//         'note' : note.text.trim(),
//       };
//   await docuser.add(json);
//
// }

Future<void> checkAndAddData(documentId,fieldName,textController,context,collectionr) async {
  final documentSnapshot = await FirebaseFirestore.instance.collection(collectionr).doc(documentId).get();

  if (documentSnapshot.exists) {
    final fieldData = documentSnapshot.data()![fieldName];
    if (fieldData != null&&fieldName=='Income') {
      // Field is present, update the data
      await FirebaseFirestore.instance.collection(collectionr).doc(documentId).update({
       fieldName: int.parse(textController.text)+fieldData,
      });
      print('Field updated successfully.');
    }else if(fieldData != null&&fieldName!='Income'){
      await FirebaseFirestore.instance.collection(collectionr).doc(documentId).update({
        fieldName: fieldData+int.parse(textController.text),
      });
    }
    else {
      // Field is not present, add the data
      await FirebaseFirestore.instance.collection(collectionr).doc(documentId).update({
        fieldName: int.parse(textController.text),
      });
      print('Field added successfully.');
    }
    Navigator.pop(context);
  } else {
    print('Document does not exist.');
    await FirebaseFirestore.instance.collection(collectionr).doc(documentId).set({
      fieldName:int.parse(textController.text),
    },);

  }
}