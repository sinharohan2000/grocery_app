import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/cart.dart';
import 'package:groceryapp/models/product-model.dart';
import 'package:groceryapp/screens/checkout-screen.dart';
import 'package:groceryapp/screens/login-page.dart';
import 'package:groceryapp/screens/map-screen.dart';
import 'package:groceryapp/screens/registration-screen.dart';
import 'package:groceryapp/welcome.dart';
import 'package:groceryapp/screens/home_screen.dart';
import 'package:groceryapp/screens/fruits-screen.dart';
import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  runApp(GroceryApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class GroceryApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery App',
      theme: ThemeData(
        backgroundColor: Color(0xfff4e3),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Small Basket : The Perfect Grocery Store'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  List<ProductModel> cart;
  ValueSetter<ProductModel> _valueSetter;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData.light(),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          MapsScreen.id: (context) => MapsScreen(),
          FruitScreen.id: (context) => FruitScreen(),
          CheckoutScreen.id: (context) => CheckoutScreen(),
          //Cart.id: (context) => Cart(cart),
        },
      ),
    );
  }
}
