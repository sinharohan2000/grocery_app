import 'package:flutter/material.dart';


class productItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  productItem({this.name, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridTile(
        child: Image.network(imageUrl),
        footer: GridTileBar(
          title: Text(name),
          trailing: IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: (){},
          ),
          backgroundColor: Colors.brown[700],
        ),
      ),
    );
  }
}
