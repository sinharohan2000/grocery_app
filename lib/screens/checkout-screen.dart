import 'package:groceryapp/export.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CheckoutScreen extends StatelessWidget {
  static String id = "checkout_screen";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Checkout Screen',
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      'GST @ 18%',
                    ),
                  ),
                  SizedBox(
                    width: 200,
                  ),
                  Expanded(
                    child: Container(
                      child: Text(
                        '${cart.totalTax}',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 220,
                  ),
                  Expanded(
                    child: Container(
                      child: Text(
                        '${cart.totalAmount + cart.totalTax}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            PaymentButton(
              cart: cart,
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentButton extends StatefulWidget {
  final Cart cart;

  const PaymentButton({@required this.cart});

  @override
  _PaymentButtonState createState() => _PaymentButtonState();
}

class _PaymentButtonState extends State<PaymentButton> {
  bool flag = false;

  Razorpay razorpay;

  @override
  void initState() {
    super.initState();
    razorpay = new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerPaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void openPaymentCheckout() {
    var options = {
      "key": "rzp_test_xUKN62D6CK0KS4",
      "amount": "${(widget.cart.totalAmount + widget.cart.totalTax) * 100}",
      "name": "Small Basket",
      "description": "Payment for cart items",
      "prefill": {
        "contact": "",
        "email": "",
      },
      "external": {
        "wallets": ["GPay"],
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      Toast.show(e, context);
    }
  }

  void handlerPaymentSuccess() {
    print("Payment Success");
    // widget.cart.totalAmount <= 0
    //     ? null
    //     : () async {
    //   await _showAlertDialog();
    //   if (flag == true) {
    //     await Provider.of<Orders>(context, listen: false).addOrder(
    //         widget.cart.items.values.toList(),
    //         widget.cart.totalAmount);
    //     widget.cart.clear();
    //     await _showFinalAlertDialog();
    //     Navigator.pop(context);
    //     Navigator.pop(context);
    //   } else {
    //     Navigator.pop(context);
    //   }
  }

  void handlerPaymentError() {
    print("Payment Error");
  }

  void handlerExternalWallet() {
    print("External Wallet");
    Toast.show('External Wallet', context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }

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
              child: Text('No'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            MaterialButton(
              child: Text('Yes'),
              onPressed: () {
                flag = true;
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
        color: Colors.teal[100],
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        elevation: 1,
        child: FlatButton(
          child: Text(
            'Proceed to Pay',
            style: TextStyle(
              color: Colors.teal,
            ),
          ),
          onPressed: widget.cart.totalAmount <= 0
              ? null
              : () async {
                  openPaymentCheckout();
                  await _showAlertDialog();
                  if (flag == true) {
                    await Provider.of<Orders>(context, listen: false).addOrder(
                        widget.cart.items.values.toList(),
                        widget.cart.totalAmount);
                    widget.cart.clear();
                    await _showFinalAlertDialog();
                    Navigator.pop(context);
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
/*
*
* widget.cart.totalAmount <= 0
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
                    Navigator.pop(context);
                  } else {
                    Navigator.pop(context);
                  }
*
* */