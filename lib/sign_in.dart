import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<bool> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  print("Called signInWithGoogle");
  if (user.uid != null) {
    return true;
  } else {
    return false;
  }

//  return 'signInWithGoogle succeeded: $user';
}

void signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Sign Out");
}

Future<bool> signUpWithEmailAndPassword(userEmail, userPassword) async {
  final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
    email: userEmail,
    password: userPassword,
  ))
      .user;
  print("Called: signUpWithEmailAndPassword");
  bool _success;
  if (user != null) {
    _success = true;
  } else {
    _success = false;
  }
  return _success;
}

void signOutUser() async {
  await _auth.signOut();

  print("User Sign Out");
}

Future<bool> isLoggedIn() async {
  if (await FirebaseAuth.instance.currentUser() != null) {
    return true;
  } else {
    return false;
  }
}
