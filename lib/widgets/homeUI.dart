import 'package:groceryapp/export.dart';
import 'package:flutter/material.dart';

class HomeUI extends StatefulWidget {
  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/assets/background.jpg'),
            fit: BoxFit.cover),
      ),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, FruitScreen.id);
            },
            child: Container(
              decoration: kHomeScreenCardDecoration.copyWith(
                image: DecorationImage(
                  image: AssetImage('images/assets/fruits.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.only(top: 20, left: 25),
              margin: EdgeInsets.only(top: 25, left: 30, right: 30, bottom: 25),
              child: Center(
                child: Text(
                  'Fruits',
                  style: TextStyle(
                    //todo: Add font family
                    fontFamily: 'Lobster',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.0,
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ),
              ),
              height: 200.0,
              width: double.infinity,
            ),
          ), //fruits
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, VegetablesScreen.id);
            },
            child: Container(
              decoration: kHomeScreenCardDecoration.copyWith(
                image: DecorationImage(
                  image: AssetImage('images/assets/vegetables.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.only(top: 20, left: 25),
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 25),
              child: Center(
                child: Text(
                  'Vegetables',
                  style: TextStyle(
                    //todo: Add font family
                    fontFamily: 'Lobster',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.0,
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ),
              ),
              height: 200.0,
              width: double.infinity,
            ),
          ), //vegetables
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, DairyScreen.id);
            },
            child: Container(
              decoration: kHomeScreenCardDecoration.copyWith(
                image: DecorationImage(
                  image: AssetImage('images/assets/dairy_products.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.only(top: 20, left: 25),
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 25),
              child: Center(
                child: Text(
                  'Dairy Products',
                  style: TextStyle(
                    //todo: Add font family
                    fontFamily: 'Lobster',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.0,
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ),
              ),
              height: 200.0,
              width: double.infinity,
            ),
          ), //Dairy
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, MartScreen.id);
            },
            child: Container(
              decoration: kHomeScreenCardDecoration.copyWith(
                image: DecorationImage(
                  image: AssetImage('images/assets/mart_products.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.only(top: 20, left: 25),
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 25),
              child: Center(
                child: Text(
                  'Mart Products',
                  style: TextStyle(
                    //todo: Add font family
                    fontFamily: 'Lobster',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.0,
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ),
              ),
              height: 200.0,
              width: double.infinity,
            ),
          ), //Mart
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, GrainsScreen.id);
            },
            child: Container(
              decoration: kHomeScreenCardDecoration.copyWith(
                image: DecorationImage(
                  image: AssetImage('images/assets/grains_pulses.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.only(top: 20, left: 25),
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 25),
              child: Center(
                child: Text(
                  'Grains & Pulses',
                  style: TextStyle(
                    //todo: Add font family
                    fontFamily: 'Lobster',
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.0,
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ),
              ),
              height: 200.0,
              width: double.infinity,
            ),
          ), //Grains
        ],
      ),
    );
  }
}
