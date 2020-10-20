// import 'package:flutter/material.dart';
// import 'package:groceryapp/cart.dart';
import 'package:groceryapp/export.dart';

class CheckoutScreen extends StatefulWidget {
  static String id = "checkout-screen";

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(
          'New checkout screen',
        ),
      ),
    );
  }
}
