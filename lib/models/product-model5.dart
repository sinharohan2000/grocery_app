import 'package:flutter/foundation.dart';

class ProductModel5 with ChangeNotifier {
  final String id;
  final String productName;
  final String category;
  final double price;
  final String imgUrl;

  ProductModel5(
      {@required this.id,
      @required this.productName,
      @required this.category,
      @required this.price,
      @required this.imgUrl});
}

class Products5 with ChangeNotifier {
  List<ProductModel5> _items = [
    ProductModel5(
      id: '40',
      productName: 'Basmati 5Kg',
      imgUrl:
      'https://post.greatist.com/wp-content/uploads/sites/3/2020/02/322775_2200-732x549.jpg',
      price: 250.0,
      category: 'Grains',
    ),
    ProductModel5(
      id: '41',
      productName: 'Moong Daal',
      imgUrl:
      'https://images-na.ssl-images-amazon.com/images/I/91X3uTBjNHL._SX679_.jpg',
      price: 55.0,
      category: 'Grains',
    )
  ];

  List<ProductModel5> get items {
    return [..._items];
  }


}