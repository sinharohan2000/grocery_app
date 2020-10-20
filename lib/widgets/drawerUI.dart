import 'package:flutter/material.dart';
import 'package:groceryapp/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:groceryapp/screens/home_screen.dart';
import 'package:groceryapp/screens/login-page.dart';
import 'package:groceryapp/screens/map-screen.dart';

class DrawerUI extends StatefulWidget {
  @override
  _DrawerUIState createState() => _DrawerUIState();
}

class _DrawerUIState extends State<DrawerUI> {
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
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Options',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'SansitaSwashed',
                      color: Colors.brown[500],
                      fontSize: 30.0,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/assets/drawer.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.person,
              size: 25,
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, HomeScreen.id);
            },
            leading: Icon(
              Icons.home,
              size: 25,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, MapsScreen.id);
            },
            leading: Icon(
              Icons.location_on,
              size: 25,
            ),
            title: Text(
              'My Location',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              //Navigator.pushNamed(context, );
            },
            leading: Icon(
              Icons.shopping_cart,
              size: 25,
            ),
            title: Text(
              'Cart',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              _auth.signOut();
              Navigator.pop(context);
            },
            leading: Icon(
              Icons.transit_enterexit,
              size: 25,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
