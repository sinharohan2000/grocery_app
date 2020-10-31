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
      productName: 'Lays American',
      imgUrl:
      'https://blueberrymartnepal.com/863-home_default/lays-american-style-cream-onion-42gm.jpg',
      price: 20.0,
      category: 'Mart',
    ),
    ProductModel4(
      id: '31',
      productName: 'Pickle Powder',
      imgUrl:
      'https://5.imimg.com/data5/LD/XT/MY-14442040/pickle-powder-500x500.jpg',
      price: 47.0,
      category: 'Mart',
    ),
    ProductModel4(
      id: '32',
      productName: 'Priya Detergent',
      imgUrl:
      'https://5.imimg.com/data5/HA/CL/MY-3854394/priya-detergent-powder-500x500.jpg',
      price: 47.0,
      category: 'Mart',
    ),
    ProductModel4(
      id: '33',
      productName: 'Medimix Soap',
      imgUrl:
      'https://images-na.ssl-images-amazon.com/images/I/51CacmpYVzL.jpg',
      price: 36.0,
      category: 'Mart',
    ),
    ProductModel4(
      id: '34',
      productName: 'Nycil Powder',
      imgUrl:
      'https://d2s8edsvfzlfgk.cloudfront.net/images/detailed/16/image_7_0laj-cd.jpg?t=1592648723',
      price: 107.0,
      category: 'Mart',
    ),
    ProductModel4(
      id: '35',
      productName: 'Kurkure',
      imgUrl:
      'https://images-na.ssl-images-amazon.com/images/I/91XtChXpXEL._SL1500_.jpg',
      price: 107.0,
      category: 'Mart',
    ),
  ];

  List<ProductModel4> get items {
    return [..._items];
  }


}