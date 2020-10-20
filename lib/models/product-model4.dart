import 'package:flutter/foundation.dart';

class ProductModel4 with ChangeNotifier {
  final String id;
  final String productName;
  final String category;
  final double price;
  final String imgUrl;

  ProductModel4(
      {@required this.id,
      @required this.productName,
      @required this.category,
      @required this.price,
      @required this.imgUrl});
}

class Products4 with ChangeNotifier {
  List<ProductModel4> _items = [
    ProductModel4(
      id: '30',
      productName: 'Chips',
      imgUrl:
      'https://i1.wp.com/www.eatthis.com/wp-content/uploads/2018/09/bowl-potato-chips.jpg?fit=1024%2C750&ssl=1',
      price: 10.0,
      category: 'Mart',
    ),
    ProductModel4(
      id: '31',
      productName: 'Mango Pickle',
      imgUrl:
      'https://www.thespruceeats.com/thmb/R_U8CobBKSa8axd3WfzOhJmF-DA=/3437x2578/smart/filters:no_upscale()/group-photograph-of-indian-pickles-like-mango-pickle---lemon-pickle-and-green-chilli-pickle--sarved-in-white-ceramic-bowl--selective-focus-666981148-5b0f5ae30e23d9003605af19.jpg',
      price: 100.0,
      category: 'Mart',
    ),

  ];

  List<ProductModel4> get items {
    return [..._items];
  }


}