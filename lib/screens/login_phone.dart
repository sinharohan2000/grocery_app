import 'package:groceryapp/export.dart';

class LoginScreenPhone extends StatefulWidget {
  static const id = 'login_phone';

  @override
  _LoginScreenPhoneState createState() => _LoginScreenPhoneState();
}

class _LoginScreenPhoneState extends State<LoginScreenPhone> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                        height: 50.0,
                        child: Image(
                          image: AssetImage('images/food-delivery.png'),
                          width: 50.0,
                        )),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: Hero(
                      tag: 'name',
                      child: Text(
                        'Hi, Welcome',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: 'SansitaSwashed',
                          color: Colors.brown[500],
                          fontSize: 30.0,
                          letterSpacing: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 30.0,
              ),

              //Mobile number box
              Center(
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.brown[100],
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.brown[300],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                        ),
                        child: Center(
                          child: Text(
                            '+977',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter Mobile Number',
                            ),
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            controller: _controller,
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //NEXT BUTTON
              Center(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.brown[400],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      'NEXT',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
