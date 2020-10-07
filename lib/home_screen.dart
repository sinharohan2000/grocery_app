import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {
  static String id="home_screen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indexCurrent=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Small Basket'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: NetworkImage('https://img.favpng.com/14/21/22/dart-programming-language-flutter-object-oriented-programming-png-favpng-riHaX64gXj4juQ8nZjn9im0C8.jpg',
                        ),
                            fit: BoxFit.fill
                        ),
                      ),
                    ),
                    Text(
                      'BOTism.dart',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'BOTism.dart@gmail.com',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile',style: TextStyle(fontSize: 18),),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings',style: TextStyle(fontSize: 18),),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text('Logout',style: TextStyle(fontSize: 18),),
              onTap:() {},
            )
          ],
        ),
      ),
      body: Container(
        child: Card(

        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexCurrent,
        type: BottomNavigationBarType.fixed,
        iconSize: 30.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            title: Text('Cart'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            title: Text('Location'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
            backgroundColor: Colors.blue,
          ),
        ],
        onTap: (index){
          setState(() {
            _indexCurrent=index;
          });
        },
      ),
    );
  }
}




