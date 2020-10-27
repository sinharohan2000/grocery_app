import 'package:groceryapp/export.dart';


class ProfileScreen extends StatefulWidget {
  static String id = "profile_screen";
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

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
         professionTextField(),
         SizedBox(
           height: 20,
         ),
         dobField(),
         SizedBox(
           height: 20,
         ),
         titleTextField(),
         SizedBox(
           height: 20,
         ),
         aboutTextField(),
         SizedBox(
           height: 20,
         ),
         FlatButton(
           onPressed: () {},
           child: Center(
             child: Container(
               width: 200,
               height: 50,
               decoration: BoxDecoration(
                 color: Colors.teal,
                 borderRadius: BorderRadius.circular(10),
               ),
               child: Center(
                 child:Text(
                   "Create Profile",
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 18,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ),
             ),
           ),
         ),
       ],
     ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: _imageFile == null
              ? AssetImage("images/assets/background.jpg")
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
    );
  }

  Widget usernameTextField() {
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
        labelText: "User Name",
        helperText: "User name can't be empty",
        hintText: "Provide a unique user name",
      ),
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
        hintText: "e.g businessman,salesman...",
      ),
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
    );
  }
}


