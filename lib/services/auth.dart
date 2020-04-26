import 'package:firebase_auth/firebase_auth.dart';
import 'package:mafia/models/user.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Create user obj based on firebaseuser
  User _userFromFirebase(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  // Auth change user stream

  Stream<User> get user{
    return _auth.onAuthStateChanged
    //.map((FirebaseUser user)=> _userFromFirebase(user));   Aşağadıka kodla aynı
    .map(_userFromFirebase);
  }

  // Sign in  anon
  Future signInAnon() async {
    try{
     AuthResult result =  await _auth.signInAnonymously();
     FirebaseUser user = result.user;
     return _userFromFirebase(user);
     
    } catch(e){
      print(e.toString());
      return null;  
    }
  }

  // Sign in with email & pass
 Future loginWithEmailandPass(String email, String password) async {
    try{
      AuthResult result = await _auth.
      signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebase(user);      
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  // register with email & pass

  Future registerWithEmailandPass(String email, String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebase(user);      
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}