import 'package:groceryapp/main.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/signin-page.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body:SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage('images/food-delivery.png'),
                    width: 50.0,
                  ),
                  Text(
                    'Small Basket',
                    style: TextStyle(
                      fontFamily: 'SansitaSwashed',
                      color:Colors.white,
                      fontSize: 30.0,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.yellow,
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
