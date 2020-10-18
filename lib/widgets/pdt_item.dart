import 'package:flutter/material.dart';

class productItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  productItem({this.name, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(imageUrl),
    );
  }
}
