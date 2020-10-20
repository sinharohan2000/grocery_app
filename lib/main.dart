import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/models/product-model.dart';
import 'package:groceryapp/screens/checkout-screen.dart';
import 'package:groceryapp/screens/login-page.dart';
import 'package:groceryapp/screens/map-screen.dart';
import 'package:groceryapp/screens/registration-screen.dart';
import 'package:groceryapp/screens/vegetables_screen.dart';
import 'package:groceryapp/screens/dairy-screen.dart';
import 'package:groceryapp/screens/mart-screen.dart';
import 'package:groceryapp/screens/grains-screen.dart';
import 'package:groceryapp/welcome.dart';
import 'package:groceryapp/screens/home_screen.dart';
import 'package:groceryapp/screens/fruits-screen.dart';
import 'package:provider/provider.dart';
import 'package:groceryapp/models/product-model2.dart';
import 'package:groceryapp/models/product-model3.dart';
import 'package:groceryapp/models/product-model4.dart';
import 'package:groceryapp/models/product-model5.dart';
import 'package:groceryapp/screens/cart_screen.dart';
import 'package:groceryapp/cart.dart';
import 'package:groceryapp/models/orders.dart';


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


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),

        ChangeNotifierProvider.value(
          value: Products2(),
        ),

        ChangeNotifierProvider.value(
          value: Products3(),
        ),

        ChangeNotifierProvider.value(
          value: Products4(),
        ),

        ChangeNotifierProvider.value(
          value: Products5(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
        value: Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          MapsScreen.id: (context) => MapsScreen(),
          FruitScreen.id: (context) => FruitScreen(),
          VegetablesScreen.id: (context) => VegetablesScreen(),
          DairyScreen.id: (context) => DairyScreen(),
          MartScreen.id: (context) => MartScreen(),
          GrainsScreen.id: (context) => GrainsScreen(),
          CheckoutScreen.id: (context) => CheckoutScreen(),
          CartScreen.id:(context)=>CartScreen(),
        },
      ),
    );
  }
}
