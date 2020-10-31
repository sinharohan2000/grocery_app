import 'dart:core';

import 'package:groceryapp/export.dart';

Future<void> userSetup(String displayName,String dob,
    String email, String profession,String address) async {
  DocumentReference users = FirebaseFirestore.instance.collection('Users').doc(
      FirebaseAuth.instance.currentUser.uid);
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.collection('addresses').add({
    'displayName': displayName,
    'uid': uid,
    'email': email,
    'dob': dob,
    'profession': profession,
    'address': address,
  });
  return;
}


