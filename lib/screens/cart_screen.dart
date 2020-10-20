// import 'package:flutter/material.dart';
//
// import 'package:provider/provider.dart';
// import 'package:groceryapp/models/orders.dart';
// import 'package:groceryapp/cart.dart';
// import 'package:groceryapp/widgets/cart_item.dart';
import 'package:groceryapp/export.dart';

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
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/assets/cartempty.png'),
                fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: cart.items.length,
                  itemBuilder: (ctx, i) => CartPdt(
                        cart.items.values.toList()[i].id,
                        cart.items.keys.toList()[i],
                        cart.items.values.toList()[i].price,
                        cart.items.values.toList()[i].quantity,
                        cart.items.values.toList()[i].name,
                      )),
            ),
            CheckoutButton(
              cart: cart,
            ),
          ],
        ),
      ),
    );
  }
}

class CheckoutButton extends StatefulWidget {
  final Cart cart;

  const CheckoutButton({@required this.cart});

  @override
  _CheckoutButtonState createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.black54,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        elevation: 10,
        child: FlatButton(
          child: Text(
            'Checkout',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onLongPress: () {
            widget.cart.clear();
          },
          onPressed: widget.cart.totalAmount <= 0
              ? null
              : () async {
            await Provider.of<Orders>(context, listen: false).addOrder(
                widget.cart.items.values.toList(),
                widget.cart.totalAmount);
            widget.cart.clear();
          },
        ),
      ),
    );
  }
}
