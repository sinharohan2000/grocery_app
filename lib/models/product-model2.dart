import 'package:flutter/foundation.dart';

class ProductModel with ChangeNotifier {
  final String id;
  final String productName;
  final String category;
  final double price;
  final String imgUrl;

  ProductModel(
      {@required this.id,
        @required this.productName,
        @required this.category,
        @required this.price,
        @required this.imgUrl});
}

class Products2 with ChangeNotifier {
  List<ProductModel> _items = [
    ProductModel(
      id: '10',
      productName: 'Broccoli',
      imgUrl:
      'https://www.solidstarts.com/wp-content/uploads/Broccoli_edited-480x320.jpg',
      price: 40.0,
      category: 'Vegetables',
    ),
    ProductModel(
      id: '11',
      productName: 'Potato',
      imgUrl:
      'https://img.tesco.com/Groceries/pi/000/0262410000000/IDShot_540x540.jpg?h=540&w=540',
      price: 30.0,
      category: 'Vegetables',
    ),
  ];
  List<ProductModel> get items {
    return [..._items];
  }
}