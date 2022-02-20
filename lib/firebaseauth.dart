
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _auth = FirebaseAuth.instance; 

Future<bool> signIn(String email, String password) async {
  try {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> Register(String email, String password) async {
  try {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return true; 
  } catch (e) {
    print(e.toString());
    return false; 
  }
}

Future<bool> SignOut() async {
  try {
    await _auth.signOut(); 
    return true; 
  } catch (e) {
    return false; 
  }
}