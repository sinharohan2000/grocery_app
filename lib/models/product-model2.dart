import 'package:flutter/foundation.dart';

class ProductModel2 with ChangeNotifier {
  final String id;
  final String productName;
  final String category;
  final double price;
  final String imgUrl;
  final String description;

  ProductModel2(
      {@required this.id,
        @required this.productName,
        @required this.category,
        @required this.price,
        @required this.imgUrl,
        @required this.description});
}

class Products2 with ChangeNotifier {
  List<ProductModel2> _items = [
    ProductModel2(
      id: '10',
      productName: 'Broccoli',
      imgUrl:
      'https://i5.walmartimages.ca/images/Enlarge/094/505/6000200094505.jpg',
      price: 40.0,
      category: 'Vegetables',
      description:'Broccoli is a green vegetable that vaguely resembles a miniature tree. It belongs to the plant species known as Brassica oleracea Its closely related to cabbage, Brussels sprouts, kale and cauliflower — all edible plants collectively referred to as cruciferous vegetables.',
    ),
    ProductModel2(
      id: '11',
      productName: 'Potato',
      imgUrl:
      'https://img.tesco.com/Groceries/pi/000/0262410000000/IDShot_540x540.jpg?h=540&w=540',
      price: 30.0,
      category: 'Vegetables',
      description: 'Potato, (Solanum tuberosum), annual plant in the nightshade family (Solanaceae), grown for its starchy edible tubers. ... Potatoes are frequently served whole or mashed as a cooked vegetable and are also ground into potato flour, used in baking and as a thickener for sauces.',
    ),
    ProductModel2(
      id: '12',
      productName: 'Onion',
      imgUrl:
      'https://c.files.bbci.co.uk/32E6/production/_113903031_mediaitem113903028.jpg',
      price: 45.0,
      category: 'Vegetables',
    ),
    ProductModel2(
      id: '13',
      productName: 'Tomatoes',
      imgUrl:
      'https://media.istockphoto.com/photos/tomato-isolated-on-white-background-picture-id466175630?k=6&m=466175630&s=612x612&w=0&h=fu_mQBjGJZIliOWwCR0Vf2myRvKWyQDsymxEIi8tZ38=',
      price: 14.0,
      category: 'Vegetables',
    ),
    ProductModel2(
      id: '14',
      productName: 'Beans-Haricot',
      imgUrl:
      'https://chefsmandala.com/wp-content/uploads/2018/03/Beans-Haricot.jpg',
      price: 24.0,
      category: 'Vegetables',
    ),
    ProductModel2(
      id: '15',
      productName: 'Methi',
      imgUrl:
      'https://thestateindia.com/wp-content/uploads/2020/01/fenugreeki-methi-health-benefits.jpg',
      price: 12.0,
      category: 'Vegetables',
    ),
    ProductModel2(
      id: '16',
      productName: 'Cauliflower',
      imgUrl:
      'https://images.heb.com/is/image/HEBGrocery/000319058',
      price: 40.0,
      category: 'Vegetables',
    ),
    ProductModel2(
      id: '17',
      productName: 'Cabbage',
      imgUrl:
      'https://images-na.ssl-images-amazon.com/images/I/61awtjWicTL._SL1024_.jpg',
      price: 47.0,
      category: 'Vegetables',
    ),
  ];
  List<ProductModel2> get items {
    return [..._items];
  }
}