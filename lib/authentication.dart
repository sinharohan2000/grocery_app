import 'export.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
final googleSignInVar = GoogleSignIn();

//Google SignIn
Future<bool> googleSignIn() async {
  GoogleSignInAccount googleSignInAccount = await googleSignInVar.signIn();
  if (googleSignInAccount != null) {
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential result = await _auth.signInWithCredential(credential);
    User user = _auth.currentUser;
    return Future.value(true);
  }
  return null;
}

//SignIn with email and password
Future<bool> signin(String email, String password) async {
  try {
    UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    User user = result.user;
    return Future.value(true);
  } catch (e) {
    print(e);
  }
  return null;
}

//SignUp with email and password
Future<bool> signup(String email, String password) async {
  try {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
    return Future.value(true);
  } catch (e) {
    print(e);
  }
  return null;
}

//SignOut the user
Future<bool> signOutUser() async {
  User user = _auth.currentUser;
  if (user.providerData[1].providerId == 'google.com') {
    await googleSignInVar.disconnect();
    await googleSignInVar.signOut();
  }

  await _auth.signOut();
  return Future.value(true);
}

//Get UID
Future<String> getCurrentUID() async {
  String uid = (await _auth.currentUser).uid;
}