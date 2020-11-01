import 'package:groceryapp/export.dart';
import 'package:groceryapp/screens/profile.dart';

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
      debugShowCheckedModeBanner: false,
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
          CartScreen.id: (context) => CartScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
          profileGetPage.id: (context) => profileGetPage(),
        },
      ),
    );
  }
}
