import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/authentication.dart';
import 'package:groceryapp/cart.dart';
import 'package:groceryapp/screens/cart_screen.dart';
import 'package:groceryapp/screens/fruits-screen.dart';
import 'package:groceryapp/screens/login-page.dart';
import 'package:groceryapp/screens/map-screen.dart';
import 'package:groceryapp/constants.dart';
import 'package:groceryapp/screens/vegetables_screen.dart';
import 'package:groceryapp/screens/dairy-screen.dart';
import 'package:groceryapp/screens/mart-screen.dart';
import 'package:groceryapp/screens/grains-screen.dart';
import 'package:groceryapp/widgets/drawerUI.dart';


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
                    Navigator.pushNamed(context, VegetablesScreen.id);
                  } else if (post["name"] == "Dairy Products") {
                    Navigator.pushNamed(context, DairyScreen.id);
                  } else if (post["name"] == "Mart Products") {
                    Navigator.pushNamed(context, MartScreen.id);
                  } else
                    Navigator.pushNamed(context, GrainsScreen.id);

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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart,size: 30,),
            onPressed: (){
              Navigator.pushNamed(context, CartScreen.id);
            },
          ),
        ],
      ),
      drawer: DrawerUI(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/assets/background.jpg'),
          fit: BoxFit.cover,
        )),
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

    );
  }
}
