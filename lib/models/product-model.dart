import 'package:flutter/foundation.dart';

class ProductModel with ChangeNotifier {
  final String id;
  final String productName;
  final String category;
  final double price;
  final String imgUrl;
  final String description;

  ProductModel({@required this.id,
    @required this.productName,
    @required this.category,
    @required this.price,
    @required this.imgUrl,
    @required this.description});

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
      description: 'The MANGO fruit is roughly oval in shape, with uneven sides. The fruit is a drupe, with an outer flesh surrounding a stone. The flesh is soft and bright yellow-orange in color. The skin of the fruit is yellow-green to red.',
    ),
    ProductModel(
      id: '1',
      productName: 'Banana',
      imgUrl:
      'https://cdn.mos.cms.futurecdn.net/42E9as7NaTaAi4A6JcuFwG-1200-80.jpg',
      price: 60.0,
      category: 'Fruits',
      description: 'A banana is an elongated, edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa. In some countries, bananas used for cooking may be called "plantains", distinguishing them from dessert bananas. ... The fruits grow in clusters hanging from the top of the plant.',
    ),
    ProductModel(
      id: '2',
      productName: 'Pomegranate',
      imgUrl:
      'https://www.simplyrecipes.com/wp-content/uploads/2005/11/pomegranate-horiz-a-1800.jpg',
      price: 198.0,
      category: 'Fruits',
      description: 'A banana is an elongated, edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa. In some countries, bananas used for cooking may be called "plantains", distinguishing them from dessert bananas. ... The fruits grow in clusters hanging from the top of the plant.',
    ),
    ProductModel(
      id: '3',
      productName: 'Pineapple',
      imgUrl:
      'https://cdn.pixabay.com/photo/2016/03/05/21/50/fresh-1239116_1280.jpg',
      price: 50.0,
      category: 'Fruits',
      description: 'A banana is an elongated, edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa. In some countries, bananas used for cooking may be called "plantains", distinguishing them from dessert bananas. ... The fruits grow in clusters hanging from the top of the plant.',
    ),
    ProductModel(
      id: '4',
      productName: 'Grapes',
      imgUrl:
      'https://cdn2.stylecraze.com/wp-content/uploads/2014/07/Is-It-True-That-Eating-Too-Many-Grapes-Causes-Side-Effects.jpg',
      price: 31.5,
      category: 'Fruits',
      description: 'A banana is an elongated, edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa. In some countries, bananas used for cooking may be called "plantains", distinguishing them from dessert bananas. ... The fruits grow in clusters hanging from the top of the plant.',
    ),
    // ProductModel(
    //   id: '5',
    //   productName: 'Papaya',
    //   imgUrl:
    //   'https://i5.walmartimages.ca/images/Large/094/495/6000200094495.jpg',
    //   price: 30.2,
    //   category: 'Fruits',
    //   description: 'A banana is an elongated, edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa. In some countries, bananas used for cooking may be called "plantains", distinguishing them from dessert bananas. ... The fruits grow in clusters hanging from the top of the plant.',
    // ),
    // ProductModel(
    //   id: '6',
    //   productName: 'Apple',
    //   imgUrl:
    //   'https://www.applesfromny.com/wp-content/uploads/2020/05/Rome_NYAS-Apples2.png',
    //   price: 105.0,
    //   category: 'Fruits',
    //   description: 'A banana is an elongated, edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa. In some countries, bananas used for cooking may be called "plantains", distinguishing them from dessert bananas. ... The fruits grow in clusters hanging from the top of the plant.',
    // ),
  ];
  List<ProductModel> get items {
    return [..._items];
  }

   ProductModel findById(String id) {
    return _items.firstWhere((pdt) => pdt.id == id);
  }
}
