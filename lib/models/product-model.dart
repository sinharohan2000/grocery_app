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

class Products with ChangeNotifier {
  List<ProductModel> _items = [
    ProductModel(
      id: '0',
      productName: 'Mango',
      imgUrl:
          'https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-260nw-607114589.jpg',
      price: 50.0,
      category: 'Fruits',
    ),
    ProductModel(
      id: '1',
      productName: 'Banana',
      imgUrl:
          'https://cdn.mos.cms.futurecdn.net/42E9as7NaTaAi4A6JcuFwG-1200-80.jpg',
      price: 60.0,
      category: 'Fruits',
    ),
  ];
  List<ProductModel> get items {
    return [..._items];
  }


}
