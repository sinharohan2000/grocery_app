import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:groceryapp/cart.dart';
import 'package:groceryapp/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static String id = "cart_screen";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'My Cart',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, i) => CartPdt(
                    cart.items.values.toList()[i].id,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].price,
                    cart.items.values.toList()[i].quantity,
                    cart.items.values.toList()[i].name)),
          ),
          FlatButton(
              onPressed: () {
              },
              child: Text(
                'Checkout',
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ))
        ],
      ),
    );
  }
}


