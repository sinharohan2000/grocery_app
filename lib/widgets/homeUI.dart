import 'package:groceryapp/export.dart';

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
                  //image: AssetImage(''),todo: Add images
                  //fit: BoxFit.cover,
                  ),
              padding: EdgeInsets.only(top: 20, left: 25),
              margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: Text(
                'Fruits',
                style: TextStyle(
                  //todo: Add font family
                  letterSpacing: 1.0,
                  fontSize: 25.0,
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
                  //image: AssetImage(''),todo: Add images
                  //fit: BoxFit.cover,
                  ),
              padding: EdgeInsets.only(top: 20, left: 25),
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Text(
                'Vegetables',
                style: TextStyle(
                  //todo: Add font family
                  letterSpacing: 1.0,
                  fontSize: 25.0,
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
                  //image: AssetImage(''),todo: Add images
                  //fit: BoxFit.cover,
                  ),
              padding: EdgeInsets.only(top: 20, left: 25),
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Text(
                'Dairy Products',
                style: TextStyle(
                  //todo: Add font family
                  letterSpacing: 1.0,
                  fontSize: 25.0,
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
                  //image: AssetImage(''),todo: Add images
                  //fit: BoxFit.cover,
                  ),
              padding: EdgeInsets.only(top: 20, left: 25),
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Text(
                'Mart Products',
                style: TextStyle(
                  //todo: Add font family
                  letterSpacing: 1.0,
                  fontSize: 25.0,
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
                  //image: AssetImage(''),todo: Add images
                  //fit: BoxFit.cover,
                  ),
              padding: EdgeInsets.only(top: 20, left: 25),
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Text(
                'Grains & Pulses',
                style: TextStyle(
                  //todo: Add font family
                  letterSpacing: 1.0,
                  fontSize: 25.0,
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
