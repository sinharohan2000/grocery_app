import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:groceryapp/models/product-model.dart';
import 'package:groceryapp/widgets/pdt_item.dart';
import 'package:provider/provider.dart';
import 'package:groceryapp/screens/home_screen.dart';
import 'package:groceryapp/screens/login-page.dart';

class DairyScreen extends StatefulWidget {
  static String id = "dairy_screen";

  @override
  _DairyScreenState createState() => _DairyScreenState();
}

class _DairyScreenState extends State<DairyScreen> {
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
        .items;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[200],
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.id);
              }),
          title: Text('Dairy Products'),
          centerTitle: true,
        ),

    body: Container(
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: pdts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (ctx, i) =>
              ChangeNotifierProvider.value(
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
