import 'package:flutter/material.dart';
import 'package:groceryapp/export.dart';

// ignore: camel_case_types
class profileGetPage extends StatefulWidget {
  static String id = 'profile';

  @override
  _profileGetPageState createState() => _profileGetPageState();
}

// ignore: camel_case_types
class _profileGetPageState extends State<profileGetPage> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  String uid;

  // ignore: non_constant_identifier_names
  String Address;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getUser(); //User's data for address access
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
        uid = user.uid;
      }
    } catch (e) {
      print(e);
    }
  }

  void getUser() {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(_auth.currentUser.uid)
        .collection('addresses')
        .doc()
        .get()
        .then((value) {
      Address = value.data().toString();
      print(value.data());
      print(Address);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(loggedInUser.uid)
            .collection('addresses')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Stack(alignment: Alignment.center, children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(70, 51, 51, 1),
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
                  radius: 90,
                  backgroundImage:
                  NetworkImage(loggedInUser.photoURL.toString()),
                )
                    : CircleAvatar(
                  radius: 90,
                  backgroundImage:
                  AssetImage('images/assets/user_profile.png'),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(235, 212, 212, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      loggedInUser.displayName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Lobster',
                          letterSpacing: 1,
                          fontSize: 25,
                          color: Color.fromRGBO(70, 51, 51, 1)),
                    ),
                  ),
                  width: double.infinity,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(70, 51, 51, 1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20, top: 20),
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
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(235, 212, 212, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      'Address',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Lobster',
                          letterSpacing: 1,
                          fontSize: 25,
                          color: Color.fromRGBO(70, 51, 51, 1)),
                    ),
                  ),
                  width: double.infinity,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(70, 51, 51, 1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20, top: 20),
                    child: !snapshot.hasData
                        ? Text(
                      snapshot.data.doc['address'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Righteous',
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    )
                        : Text(
                      '*No Address found',
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
          ]);
        },
      ),
      drawer: DrawerUI(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, ProfileScreen.id);
        },
        child: Icon(
          Icons.mode_edit,
          color: Color.fromRGBO(70, 51, 51, 1),
        ),
        backgroundColor: Color.fromRGBO(235, 212, 212, 1),
      ),
    );
  }
}
