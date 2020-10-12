import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:groceryapp/home_screen.dart';
import 'package:groceryapp/login-page.dart';

class FruitScreen extends StatefulWidget {
  static String id = "fruit_screen";

  @override
  _FruitScreenState createState() => _FruitScreenState();
}

class _FruitScreenState extends State<FruitScreen> {
  int _indexCurrent = 0;
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
          backgroundColor: Colors.brown[600],
          title: Text('Small Basket'),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                color: Theme.of(context).primaryColor,
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                'https://img.favpng.com/14/21/22/dart-programming-language-flutter-object-oriented-programming-png-favpng-riHaX64gXj4juQ8nZjn9im0C8.jpg',
                              ),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          //loggedInUser.email,
                          '',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Profile',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  'Settings',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.arrow_back),
                title: Text(
                  'Logout',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  _auth.signOut();
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              )
            ],
          ),
        ));
  }
}
