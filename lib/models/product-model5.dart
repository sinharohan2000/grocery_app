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

class Products5 with ChangeNotifier {
  List<ProductModel> _items = [
    ProductModel(
      id: '40',
      productName: 'Basmati 5Kg',
      imgUrl:
      'https://post.greatist.com/wp-content/uploads/sites/3/2020/02/322775_2200-732x549.jpg',
      price: 250.0,
      category: 'Grains',
    ),
    ProductModel(
      id: '41',
      productName: 'Moong Daal',
      imgUrl:
      'https://images-na.ssl-images-amazon.com/images/I/91X3uTBjNHL._SX679_.jpg',
      price: 55.0,
      category: 'Grains',
    )
  ];
  List<ProductModel> get items {
    return [..._items];
  }


}