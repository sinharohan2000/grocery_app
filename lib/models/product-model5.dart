import 'package:flutter/foundation.dart';

class ProductModel5 with ChangeNotifier {
  final String id;
  final String productName;
  final String category;
  final double price;
  final String imgUrl;
  final String description;

  ProductModel5(
      {@required this.id,
      @required this.productName,
      @required this.category,
      @required this.price,
      @required this.imgUrl,
        @required this.description});
}

class Products5 with ChangeNotifier {
  List<ProductModel5> _items = [
    ProductModel5(
      id: '40',
      productName: 'Patanjali Aata',
      imgUrl:
          'https://images-na.ssl-images-amazon.com/images/I/91oIQlysS4L._SL1500_.jpg',
      price: 183.0,
      category: 'Grains',
      description: '- Patanjali Whole Wheat Atta\n- Net Wt. 1kg',
    ),
    ProductModel5(
      id: '41',
      productName: 'Moong Daal',
      imgUrl:
      'https://www.gramiyum.in/wp-content/uploads/2019/09/moong-dal-green-split.jpg',
      price: 70.0,
      category: 'Grains',
      description: '- Green Moong\n- Dal Split\n- 500 gm pouch',
    ),
    ProductModel5(
      id: '42',
      productName: 'Toor Daal',
      imgUrl:
      'https://aapkagrocery.com/wp-content/uploads/2020/06/toor-dal.png',
      price: 48.0,
      category: 'Grains',
      description: '- Toor Daal\n- 500 gm Pouch\n- Unpolished Split',
    ),
    ProductModel5(
      id: '43',
      productName: 'Tata Salt',
      imgUrl:
      'https://images-na.ssl-images-amazon.com/images/I/61VASI018mL._SL1400_.jpg',
      price: 48.0,
      category: 'Grains',
      description: '- TATA Salt\n- Vacuum Evaporated Iodised\n- 250gm Pouch',
    ),
    ProductModel5(
      id: '43',
      productName: 'Patanjali Rice',
      imgUrl:
      'https://images-na.ssl-images-amazon.com/images/I/91ZHw62YpYL._SL1500_.jpg',
      price: 260.0,
      category: 'Grains',
      description: '- Patanjali Rice\n- 1121 Gold\n- 5 kg Pack',
    ),
  ];

  List<ProductModel5> get items {
    return [..._items];
  }


  ProductModel5 findById5(String id) {
    return _items.firstWhere((pdt) => pdt.id == id);
  }

}