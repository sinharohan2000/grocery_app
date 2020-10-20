import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:groceryapp/models/product-model2.dart';
import 'package:groceryapp/widgets/pdt_item2.dart';
import 'package:provider/provider.dart';
import 'package:groceryapp/screens/login-page.dart';
import 'package:groceryapp/screens/home_screen.dart';
import 'package:groceryapp/widgets/drawerUI.dart';

class VegetablesScreen extends StatefulWidget {
  static String id = "vegetables_screen";

  @override
  _VegetablesScreenState createState() => _VegetablesScreenState();
}

class _VegetablesScreenState extends State<VegetablesScreen> {
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
    final productData = Provider.of<Products2>(context);
    final vegetableProducts = productData
        .items; //a variable to contain the product that is retrieved from product-Model.dart
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[600],
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pushNamed(context, HomeScreen.id);
            }),
        title: Text('Vegetables'),
        centerTitle: true,
      ),
      drawer: DrawerUI(),
      body: Container(
          child: GridView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: vegetableProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: vegetableProducts[i],
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 2.0,
            child: ProductItems(
              name: vegetableProducts[i].productName,
              imageUrl: vegetableProducts[i].imgUrl,
              //Todo: classify the categories and their products in their respective screens
            ),
          ),
        ),
          )),
    );
  }
}


