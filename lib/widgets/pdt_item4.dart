import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:groceryapp/models/product-model4.dart';
import 'package:groceryapp/cart.dart';
import'package:groceryapp/screens/cart_screen.dart';


class ProductItems extends StatelessWidget {
  final String name;
  final String imageUrl;

  ProductItems({this.name, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final pdt = Provider.of<ProductModel>(context);


    final cart=Provider.of<Cart>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridTile(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Image.network(imageUrl),
              ),
            ),
            Card(
              color: Colors.brown[50],
              child: Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          name,
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              cart.addItem(pdt.id, pdt.productName, pdt.price);
                            },
                            child: Icon(
                              Icons.add,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            )
          ],
        ),
      ),
    );
  }
}