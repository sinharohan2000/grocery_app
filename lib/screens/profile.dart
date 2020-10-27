import 'package:flutter/material.dart';
import 'package:groceryapp/export.dart';

// ignore: camel_case_types
class profileGetPage extends StatefulWidget {
  static String id = 'profile';

  @override
  _profileGetPageState createState() => _profileGetPageState();
}

class _profileGetPageState extends State<profileGetPage> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

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
      body: Stack(alignment: Alignment.center, children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.lightGreen[800],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              height: 100,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(bottom: 15, top: 40),
                child: Text(
                  'Profile'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'Righteous',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            loggedInUser.photoURL != null
                ? CircleAvatar(
                    radius: 120,
                    backgroundImage:
                        NetworkImage(loggedInUser.photoURL.toString()),
                  )
                : CircleAvatar(
                    radius: 120,
                    backgroundImage:
                        AssetImage('images/assets/user_profile.png'),
                  ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.lightGreen[100],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 40, bottom: 40),
                child: Text(
                  loggedInUser.displayName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Lobster',
                      letterSpacing: 1,
                      fontSize: 30,
                      color: Colors.lightGreen[800]),
                ),
              ),
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.lightGreen[700],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              height: 100,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(bottom: 15, top: 40),
                child: Text(
                  loggedInUser.email,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Righteous',
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
      drawer: DrawerUI(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, ProfileScreen.id);
        },
        child: Icon(
          Icons.mode_edit,
        ),
        backgroundColor: Colors.lightGreen[800],
      ),
    );
  }
}
