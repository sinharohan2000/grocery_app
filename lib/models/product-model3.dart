import 'package:flutter/foundation.dart';

class ProductModel3 with ChangeNotifier {
  final String id;
  final String productName;
  final String category;
  final double price;
  final String imgUrl;

  ProductModel3(
      {@required this.id,
      @required this.productName,
      @required this.category,
      @required this.price,
      @required this.imgUrl});
}

class Products3 with ChangeNotifier {
  List<ProductModel3> _items = [

    ProductModel3(
      id: '20',
      productName: 'Milk',
      imgUrl:
      'https://cdn.pixabay.com/photo/2016/12/06/18/27/milk-1887234_1280.jpg',
      price: 30.0,
      category: 'Dairy',
    ),
    ProductModel3(
      id: '21',
      productName: 'Cheese',
      imgUrl:
      'https://www.ecosystemmarketplace.com/wp-content/uploads/2019/11/Swiss-Cheese.jpg',
      price: 500.0,
      category: 'Dairy',
    ),
  ];

  List<ProductModel3> get items {
    return [..._items];
  }


}