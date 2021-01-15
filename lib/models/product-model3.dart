import 'package:flutter/foundation.dart';

class ProductModel3 with ChangeNotifier {
  final String id;
  final String productName;
  final String category;
  final double price;
  final String imgUrl;
  final String description;

  ProductModel3(
      {@required this.id,
      @required this.productName,
      @required this.category,
      @required this.price,
      @required this.imgUrl,
        @required this.description});
}

class Products3 with ChangeNotifier {
  List<ProductModel3> _items = [

    ProductModel3(
      id: '20',
      productName: 'Amul Milk',
      imgUrl:
      'https://images-na.ssl-images-amazon.com/images/I/81jBZSGusFL._SL1500_.jpg',
      price: 24.7,
      category: 'Dairy',
      description: 'Potato, (Solanum tuberosum), annual plant in the nightshade family (Solanaceae), grown for its starchy edible tubers. ... Potatoes are frequently served whole or mashed as a cooked vegetable and are also ground into potato flour, used in baking and as a thickener for sauces.',
    ),
    ProductModel3(
      id: '21',
      productName: 'Cheese',
      imgUrl:
      'https://www.ecosystemmarketplace.com/wp-content/uploads/2019/11/Swiss-Cheese.jpg',
      price: 500.0,
      category: 'Dairy',
      description: 'Potato, (Solanum tuberosum), annual plant in the nightshade family (Solanaceae), grown for its starchy edible tubers. ... Potatoes are frequently served whole or mashed as a cooked vegetable and are also ground into potato flour, used in baking and as a thickener for sauces.',
    ),
    ProductModel3(
      id: '22',
      productName: 'Amul Paneer',
      imgUrl:
      'https://awesomedairy.com/wp-content/uploads/2017/02/amul-malai-paneer.png',
      price: 39.0,
      category: 'Dairy',
      description: 'Potato, (Solanum tuberosum), annual plant in the nightshade family (Solanaceae), grown for its starchy edible tubers. ... Potatoes are frequently served whole or mashed as a cooked vegetable and are also ground into potato flour, used in baking and as a thickener for sauces.',
    ),
    ProductModel3(
      id: '23',
      productName: 'Dahi',
      imgUrl:
      'https://market.thulo.com/uploads/ads/2018122715459247045_500.jpg',
      price: 74.0,
      category: 'Dairy',
      description: 'Potato, (Solanum tuberosum), annual plant in the nightshade family (Solanaceae), grown for its starchy edible tubers. ... Potatoes are frequently served whole or mashed as a cooked vegetable and are also ground into potato flour, used in baking and as a thickener for sauces.',
    ),
    ProductModel3(
      id: '24',
      productName: 'Amul Butter',
      imgUrl:
      'https://5.imimg.com/data5/QM/MI/MY-3508796/amul-butter-500x500.jpg',
      price: 50.0,
      category: 'Dairy',
      description: 'Potato, (Solanum tuberosum), annual plant in the nightshade family (Solanaceae), grown for its starchy edible tubers. ... Potatoes are frequently served whole or mashed as a cooked vegetable and are also ground into potato flour, used in baking and as a thickener for sauces.',
    ),
    // ProductModel3(
    //   id: '25',
    //   productName: 'Amul Ghee',
    //   imgUrl:
    //   'https://images-na.ssl-images-amazon.com/images/I/81jSZt5XnKL._SY879_.jpg',
    //   price: 500.0,
    //   category: 'Dairy',
    //   description: 'Potato, (Solanum tuberosum), annual plant in the nightshade family (Solanaceae), grown for its starchy edible tubers. ... Potatoes are frequently served whole or mashed as a cooked vegetable and are also ground into potato flour, used in baking and as a thickener for sauces.',
    // ),

  ];

  List<ProductModel3> get items {
    return [..._items];
  }

  ProductModel3 findById3(String id) {
    return _items.firstWhere((pdt) => pdt.id == id);
  }
}