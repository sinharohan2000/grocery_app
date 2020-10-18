import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/screens/login-page.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin {

  AnimationController controller;


  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    controller.forward();
    controller.addListener(() {
      setState(() {
      });
      print(controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.teal,
      body:SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Image(
                      image: AssetImage('images/food-delivery.png'),
                      width: 100.0,
                    ),
                  ),
                  Text(
                    'Small Basket',
                    style: TextStyle(
                      fontFamily: 'SansitaSwashed',
                      color: Colors.brown[500],
                      fontSize: 30.0,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.brown[200],
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0,horizontal:
              25.0),

              child: FlatButton(
                  onPressed: (){
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  child: Text(
                    'Divein',
                    style: TextStyle(
                      color:Colors.black,
                      fontSize: 25.0,
                      letterSpacing: 2.5,
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
