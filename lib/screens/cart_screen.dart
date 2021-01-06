import 'package:groceryapp/export.dart';

class CartScreen extends StatelessWidget {
  static String id = "cart_screen";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'My Cart',
        ),
        leading: MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/assets/cartempty.png'),
                fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: cart.items.length,
                  itemBuilder: (ctx, i) => CartPdt(
                        cart.items.values.toList()[i].id,
                        cart.items.keys.toList()[i],
                        cart.items.values.toList()[i].price,
                        cart.items.values.toList()[i].quantity,
                        cart.items.values.toList()[i].name,
                      )),
            ),
            Material(
              color: Colors.black54,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              elevation: 10,
              child: FlatButton(
                child: Text(
                  'Checkout',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, CheckoutScreen.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
