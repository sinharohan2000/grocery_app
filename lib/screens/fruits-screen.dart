import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:groceryapp/models/product-model.dart';
import 'package:groceryapp/widgets/pdt_item.dart';
import 'package:provider/provider.dart';
import 'package:groceryapp/screens/login-page.dart';
import 'package:groceryapp/screens/home_screen.dart';
//import 'package:groceryapp/cart.dart';

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
    final productData = Provider.of<Products>(context);
    final pdts = productData
        .items; //a variable to contain the product that is retrieved from product-Model.dart
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[800],
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pushNamed(context, HomeScreen.id);
            }),
        title: Text('Fruits'),
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
      ),
      body: Container(
          child: GridView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: pdts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: pdts[i],
          child: Card(
            elevation: 2.0,
            child: productItem(
              name: pdts[i].productName,
              imageUrl: pdts[i].imgUrl,
              //Todo: classify the categories and their products in their respective screens
            ),
          ),
        ),
      )),
    );
  }
}

