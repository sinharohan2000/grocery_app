import 'package:groceryapp/export.dart';

class HomeScreen extends StatefulWidget {
  static String id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;



  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.brown[600],
        title: Text(
            'Small Basket',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            fontFamily: 'SansitaSwashed',
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushNamed(context, CartScreen.id);
            },
          ),
        ],
      ),
      drawer: DrawerUI(),
      body: HomeUI(),
    );
  }
}
