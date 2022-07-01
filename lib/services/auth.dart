import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthBase {
  // sign in with email and password

  Future<User?> siginInWithEmailAndPassword(String email, String password);

  // sign up with email and password

  Future<User?> signUpwithEmailAndPassword(String email, String password);

  // method to return the current user
  User? get getCurrentUser;

  // stream authstate changes
  Stream<User?> get authStateChanges;

  // sign out
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _auth = FirebaseAuth.instance;
  @override
  Future<User?> siginInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      debugPrint(userCredential.user.toString());

      return userCredential.user;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<User?> signUpwithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  @override
  Future<void> signOut() {
    return _auth.signOut();
  }

  @override
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  @override
  User? get getCurrentUser => _auth.currentUser;
}
