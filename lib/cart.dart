import 'package:flutter/material.dart';
import 'package:groceryapp/product-model.dart';

// ignore: must_be_immutable
class Cart extends StatefulWidget {
  static String id = "cart-screen";
  List<ProductModel> cart = [ProductModel("Mango", 80)];

  Cart(this.cart);

  @override
  _CartState createState() => _CartState(this.cart);
}

class _CartState extends State<Cart> {
  _CartState(cart);

  List<ProductModel> cart;

  @override
  Widget build(BuildContext context) {
    if (cart != null)
      return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              var item = cart[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                child: Card(
                  elevation: 4.0,
                  child: ListTile(
                    title: Text(item.productName),
                    trailing: GestureDetector(
                        child: Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                        ),
                        onTap: () {
                          setState(() {
                            cart.remove(item);
                          });
                        }),
                  ),
                ),
              );
            }),
      );
    else
      return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: Text('CART IS EMPTY'),
      );
  }
}
