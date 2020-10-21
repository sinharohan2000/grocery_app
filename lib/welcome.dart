// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:groceryapp/screens/login-page.dart';

import 'export.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
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
                  Hero(
                    tag: 'name',
                    child: ColorizeAnimatedTextKit(
                      text:['Small Basket'],
                      textStyle: TextStyle(
                        fontFamily: 'SansitaSwashed',
                        color: Colors.brown[500],
                        fontSize: 30.0,
                        letterSpacing: 2.5,
                        fontWeight: FontWeight.bold,
                      ),
                      colors: [
                        Colors.brown,
                        Colors.blue,
                        Colors.yellow,
                        Colors.red,
                      ],
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
