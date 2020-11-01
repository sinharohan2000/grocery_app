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
            CheckoutButton(
              cart: cart,
            ),
          ],
        ),
      ),
    );
  }
}

class CheckoutButton extends StatefulWidget {
  final Cart cart;

  const CheckoutButton({@required this.cart});

  @override
  _CheckoutButtonState createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  bool flag = false;

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to'),
                Text('order the selected items?'),
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              child: Text('Yes'),
              onPressed: () {
                flag = true;
                Navigator.pop(context);
              },
            ),
            MaterialButton(
              child: Text('No'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showFinalAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order confirmed'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Your order has been placed'),
                Text('Thank you for using Small Basket!'),
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
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
          onPressed: widget.cart.totalAmount <= 0
              ? null
              : () async {
            await _showAlertDialog();
            if (flag == true) {
              await Provider.of<Orders>(context, listen: false).addOrder(
                  widget.cart.items.values.toList(),
                  widget.cart.totalAmount);
              widget.cart.clear();
              await _showFinalAlertDialog();
              Navigator.pop(context);
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}