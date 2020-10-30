import 'dart:core';

import 'package:groceryapp/export.dart';

Future<void> userSetup(String displayName,String dob,
    String email, String profession,String address) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({
    'displayName': displayName,
    'uid': uid,
    'email': email,
    'dob': dob,
    'profession': profession,
    'address': address,
  });
  return;
}
