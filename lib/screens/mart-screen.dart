import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:groceryapp/models/product-model4.dart';
import 'package:groceryapp/widgets/pdt_item4.dart';
import 'package:groceryapp/widgets/drawerUI.dart';
import 'package:provider/provider.dart';
import 'package:groceryapp/screens/home_screen.dart';
import 'package:groceryapp/screens/login-page.dart';

class MartScreen extends StatefulWidget {
  static String id = "mart_screen";

  @override
  _MartScreenState createState() => _MartScreenState();
}

class _MartScreenState extends State<MartScreen> {
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

    final productData = Provider.of<Products4>(context);
    final martProducts = productData.items;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pushNamed(context, HomeScreen.id);
            }),
        title: Text('Mart Products'),
        centerTitle: true,
      ),
      drawer: DrawerUI(),
      body: Container(
          child: GridView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: martProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: martProducts[i],
          child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 2.0,
                    child: ProductItems(
                      name: martProducts[i].productName,
                      imageUrl: martProducts[i].imgUrl,
                    ),
                  ),
                ),
          )),
    );
  }
}
