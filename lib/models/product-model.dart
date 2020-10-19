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
    ProductModel(
      id: '10',
      productName: 'Broccoli',
      imgUrl:
          'https://www.solidstarts.com/wp-content/uploads/Broccoli_edited-480x320.jpg',
      price: 40.0,
      category: 'Vegetables',
    ),
    ProductModel(
      id: '11',
      productName: 'Potato',
      imgUrl:
          'https://img.tesco.com/Groceries/pi/000/0262410000000/IDShot_540x540.jpg?h=540&w=540',
      price: 30.0,
      category: 'Vegetables',
    ),
    ProductModel(
      id: '20',
      productName: 'Milk',
      imgUrl:
          'https://cdn.pixabay.com/photo/2016/12/06/18/27/milk-1887234_1280.jpg',
      price: 30.0,
      category: 'Dairy',
    ),
    ProductModel(
      id: '21',
      productName: 'Cheese',
      imgUrl:
          'https://www.ecosystemmarketplace.com/wp-content/uploads/2019/11/Swiss-Cheese.jpg',
      price: 500.0,
      category: 'Dairy',
    ),
    ProductModel(
      id: '30',
      productName: 'Chips',
      imgUrl:
          'https://i1.wp.com/www.eatthis.com/wp-content/uploads/2018/09/bowl-potato-chips.jpg?fit=1024%2C750&ssl=1',
      price: 10.0,
      category: 'Mart',
    ),
    ProductModel(
      id: '31',
      productName: 'Mango Pickle',
      imgUrl:
          'https://www.thespruceeats.com/thmb/R_U8CobBKSa8axd3WfzOhJmF-DA=/3437x2578/smart/filters:no_upscale()/group-photograph-of-indian-pickles-like-mango-pickle---lemon-pickle-and-green-chilli-pickle--sarved-in-white-ceramic-bowl--selective-focus-666981148-5b0f5ae30e23d9003605af19.jpg',
      price: 100.0,
      category: 'Mart',
    ),
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

  var _fruitscheck=true;

  List<ProductModel> get items {
    if(_fruitscheck){
      final List<ProductModel>fruitprod=[];
      _items.forEach((prod) {
        if(prod.category=='Fruits') {
          fruitprod.add(ProductModel(id: prod.id,
              productName: prod.productName,
              category: prod.category,
              price: prod.price,
              imgUrl: prod.imgUrl));
        }
      });

      _items=fruitprod;
      print(_items);
      return [..._items];
    }
    // else if{
    //
    // }
    return [..._items];
  }

  void showFruitsOnly(){
       _fruitscheck=true;
       notifyListeners();
  }
}
