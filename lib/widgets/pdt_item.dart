import 'package:flutter/material.dart';


class ProductItems extends StatelessWidget {
  final String name;
  final String imageUrl;

  ProductItems({this.name, this.imageUrl});

  @override
  Widget build(BuildContext context) {
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
                            onPressed: () {},
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