import 'package:flutter/foundation.dart';

class ProductModel4 with ChangeNotifier {
  final String id;
  final String productName;
  final String category;
  final double price;
  final String imgUrl;
  final String description;

  ProductModel4(
      {@required this.id,
      @required this.productName,
      @required this.category,
      @required this.price,
      @required this.imgUrl,
        @required this.description});
}

class Products4 with ChangeNotifier {
  List<ProductModel4> _items = [
    ProductModel4(
      id: '30',
      productName: 'Lays American',
      imgUrl:
          'https://www.bigbasket.com/media/uploads/p/l/294297_12-lays-potato-chips-calm-cream-onion-flavour.jpg',
      price: 20.0,
      category: 'Mart',
      description:
          '- Lays Potato Chips \n- Calm Cream & Onion Flavour\n- 30 g Pouch',
    ),
    ProductModel4(
      id: '31',
      productName: 'Pickle Powder',
      imgUrl:
      'https://5.imimg.com/data5/LD/XT/MY-14442040/pickle-powder-500x500.jpg',
      price: 50.0,
      category: 'Mart',

      description: '- Double Horse Pickle Powder\n- 100g Pouch',
    ),
    ProductModel4(
      id: '32',
      productName: 'Priya Detergent',
      imgUrl:
      'https://5.imimg.com/data5/HA/CL/MY-3854394/priya-detergent-powder-500x500.jpg',
      price: 46.0,
      category: 'Mart',
      description: '- Priya Detergent\n- 1 kg pack\n- Heavy Duty Fresh Pure',
    ),
    ProductModel4(
      id: '33',
      productName: 'Medimix Soap',
      imgUrl:
      'https://images-na.ssl-images-amazon.com/images/I/51CacmpYVzL.jpg',
      price: 36.0,
      category: 'Mart',

      description: '- Medimix Ayurvedic Soap\n- Sandal',
    ),
    ProductModel4(
      id: '34',
      productName: 'Nycil Powder',
      imgUrl:
      'https://d2s8edsvfzlfgk.cloudfront.net/images/detailed/16/image_7_0laj-cd.jpg?t=1592648723',
      price: 107.0,
      category: 'Mart',

      description: '- Nycil Cool Herbal Powder\n- Germ Expert\n- Buy 1 Get 1 Free',
    ),
    // ProductModel4(
    //   id: '35',
    //   productName: 'Kurkure',
    //   imgUrl:
    //   'https://images-na.ssl-images-amazon.com/images/I/91XtChXpXEL._SL1500_.jpg',
    //   price: 107.0,
    //   category: 'Mart',
    //
    //   description: 'Potato, (Solanum tuberosum), annual plant in the nightshade family (Solanaceae), grown for its starchy edible tubers. ... Potatoes are frequently served whole or mashed as a cooked vegetable and are also ground into potato flour, used in baking and as a thickener for sauces.',
    // ),
  ];

  List<ProductModel4> get items {
    return [..._items];
  }

  ProductModel4 findById4(String id) {
    return _items.firstWhere((pdt) => pdt.id == id);
  }

}