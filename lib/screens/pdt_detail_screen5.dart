import 'package:flutter/material.dart';
import 'package:groceryapp/export.dart';


class DetailPage5 extends StatelessWidget {
  static String id = "detail_screen5";
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedPdt = Provider.of<Products5>(context).findById5(productId);
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedPdt.productName),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.network(loadedPdt.imgUrl),
            ),
          ),
          Text(
            'Price: \₹ ${loadedPdt.price}',
            style: TextStyle(
              fontSize: 25,
              fontFamily: "Righteous",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              '${loadedPdt.description}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cart.addItem(productId, loadedPdt.productName, loadedPdt.price);
          Toast.show("${loadedPdt.productName} added to cart", context);
        },
        child: Icon(
          Icons.add_shopping_cart,
          size: 30,
        ),
      ),
    );
  }
}
