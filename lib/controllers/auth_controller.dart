import 'package:ecommerce_tarek_alabd/services/auth.dart';
import 'package:ecommerce_tarek_alabd/utilities/enums.dart';
import 'package:flutter/cupertino.dart';

class AuthController with ChangeNotifier {
  final AuthBase auth;
  String email;
  String password;
  AuthFormType authFormType;
  AuthController({
    required this.auth,
    this.email = "",
    this.password = "",
    this.authFormType = AuthFormType.login,
  });

  // update the email
  void updateEmail(String email) => copyWith(email: email);
  // update the password
  void updatePassword(String password) => copyWith(password: password);
  // dart data classes are immutable by default
  // so we need to create a new instance of the class
  // to update the state of the class

  void copyWith({
    String? email,
    String? password,
    AuthFormType? authFormType,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.authFormType = authFormType ?? this.authFormType;
    notifyListeners();
  }

  Future<void> submit() async {
    try {
      if (authFormType == AuthFormType.register) {
        // check if the user is registered
        await auth.signUpwithEmailAndPassword(email, password);
      } else {
        await auth.siginInWithEmailAndPassword(email, password);
      }
    } catch (e) {
      rethrow;
    }
  }

  void toggleFormType() {
    final formType = authFormType == AuthFormType.login
        ? AuthFormType.register
        : AuthFormType.login;
    copyWith(email: '', password: '', authFormType: formType);
  }
}
