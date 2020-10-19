import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:groceryapp/models/product-model.dart';
import 'package:groceryapp/widgets/drawerUI.dart';
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
    final fruitProducts = productData
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
      drawer: DrawerUI(),
      body: Container(
          child: GridView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: fruitProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: fruitProducts[i],
          child: Card(
            elevation: 2.0,
            child: productItem(
              name: fruitProducts[i].productName,
              imageUrl: fruitProducts[i].imgUrl,

              //Todo: classify the categories and their products in their respective screens
            ),
          ),
        ),
      )),
    );
  }
}

