import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:groceryapp/models/product-model.dart';
import 'package:groceryapp/widgets/drawerUI.dart';
import 'package:groceryapp/widgets/pdt_item.dart';
import 'package:provider/provider.dart';
import 'package:groceryapp/screens/home_screen.dart';
import 'package:groceryapp/screens/login-page.dart';

class MartScreen extends StatefulWidget {
  static String id = "mart_screen";

  @override
  _MartScreenState createState() => _MartScreenState();
}

class _MartScreenState extends State<MartScreen> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.id);
              }),
          title: Text('Mart Products'),
          centerTitle: true,
        ),
        drawer: DrawerUI());
  }
}
