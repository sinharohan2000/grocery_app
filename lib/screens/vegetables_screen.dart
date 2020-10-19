import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:groceryapp/models/product-model2.dart';
import 'package:groceryapp/widgets/pdt_item.dart';
import 'package:provider/provider.dart';
import 'package:groceryapp/screens/login-page.dart';
import 'package:groceryapp/screens/home_screen.dart';

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
    final vegetablesData = Provider.of<Products2>(context);
    final vegetableProducts = vegetablesData
        .items; //a variable to contain the product that is retrieved from product-Model.dart
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[600],
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pushNamed(context, HomeScreen.id);
            }
        ),
        title: Text('Vegetables'),
        centerTitle: true,
      ),
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
            elevation: 2.0,
            child: ProductItem(
              name: vegetableProducts[i].productName,
              imageUrl: vegetableProducts[i].imgUrl,
            ),
          ),
        ),
          )),
    );
  }
}


