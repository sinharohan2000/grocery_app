import 'package:flutter/cupertino.dart';
import 'package:groceryapp/export.dart';

class ProfileScreen extends StatefulWidget {
  static String id = "profile_screen";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name, dob, email, about, profession;
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: <Widget>[
          imageProfile(),
          SizedBox(
            height: 20,
          ),
          nameTextField(),
          SizedBox(
            height: 20,
          ),
          usernameTextField(),
          SizedBox(
            height: 20,
          ),
          dobField(),
          SizedBox(
            height: 20,
          ),
          professionTextField(),
          SizedBox(
            height: 20,
          ),
          aboutTextField(),
          SizedBox(
            height: 20,
          ),
          FlatButton(
            onPressed: () {
              User updateUser = FirebaseAuth.instance.currentUser;
              updateUser.updateProfile(displayName: name);
              updateUser.updateEmail(email);
              userSetup(name, about, dob, email, profession);
              Navigator.pop(context);
            },
            child: Center(
                child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Create Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.teal[300],
        child: Icon(
          Icons.arrow_back,
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: _imageFile == null
              ? AssetImage("images/assets/user_profile.png")
              : FileImage(File(_imageFile.path)),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Widget nameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: "Name",
        helperText: "Name can't be empty",
        hintText: "Enter your full name",
      ),
      onChanged: (value) {
        name = value;
        loggedInUser.updateProfile(displayName: name);
      },
    );
  }

  Widget usernameTextField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: "E-Mail",
        helperText: "User name can't be empty",
        hintText: "Provide your new email",
      ),
      onChanged: (value) {
        email = value;
        loggedInUser.updateEmail(email);
      },
    );
  }

  Widget professionTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: "Profession",
        helperText: "Profession can't be empty",
        hintText: "e.g Businessman, Salesman...",
      ),
      onChanged: (value) {
        profession = value;
      },
    );
  }

  Widget dobField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: "Date Of Birth",
        helperText: "Provide DOB on dd/mm/yyyy",
        hintText: "01/01/2020",
      ),
      onChanged: (value) {
        dob = value;
      },
    );
  }

  Widget titleTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: "Title",
        helperText: "It can't be empty",
        hintText: "Flutter Developer",
      ),
    );
  }

  Widget aboutTextField() {
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        labelText: "About",
        helperText: "Write about yourself",
        hintText: "I am Flutter App Developer",
      ),
      onChanged: (value) {
        about = value;
      },
    );
  }
}
