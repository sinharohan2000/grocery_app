import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/authentication.dart';
import 'package:groceryapp/fruits-screen.dart';
import 'package:groceryapp/login-page.dart';
import 'package:groceryapp/map-screen.dart';
import 'package:groceryapp/constants.dart';

class HomeScreen extends StatefulWidget {
  static String id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indexCurrent = 0;
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = grocery_data;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 5.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: SafeArea(
              child: FlatButton(
                onPressed: () {
                  if (post["name"] == "Fruits") {
                    Navigator.pushNamed(context, FruitScreen.id);
                  } else if (post["name"] == "Vegetables") {
                    //Navigator.pushNamed(context, MapsScreen.id);
                  } else if (post["name"] == "Dairy Products") {
                  } else if (post["name"] == "Mart Products") {
                  } else if (post["name"] == "Rice & Wheat") {}
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          post["name"],
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        //adding count and add to wish list
                      ],
                    ),
                    // Image.asset(
                    //   //post["image"],
                    //   "images/assets/${post["image"]}",
                    //   width: 10.0,
                    // ),
                  ],
                ),
              ),
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
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
      backgroundColor: Colors.brown[50],
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
                        loggedInUser.email,
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
              onTap: () => signOutUser().whenComplete(
                  () => Navigator.pushNamed(context, LoginScreen.id)),
            )
          ],
        ),
      ),
      body: Container(
        //decoration: ,
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                    itemCount: itemsData.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return itemsData[index];
                    })),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        backgroundColor: Colors.brown[50],
        currentIndex: _indexCurrent,
        type: BottomNavigationBarType.fixed,
        iconSize: 30.0,
        items: [
          BottomNavigationBarItem(
            icon: MaterialButton(onPressed: () {}, child: Icon(Icons.home)),
            title: Text('Home'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: MaterialButton(
                onPressed: () {}, child: Icon(Icons.shopping_basket)),
            title: Text('Cart'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, MapsScreen.id);
                },
                child: Icon(Icons.location_on)),
            title: Text('Location'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: MaterialButton(
                onPressed: () {
                  //Navigator.pushNamed(context, );
                },
                child: Icon(Icons.search)),
            title: Text('Search'),
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
