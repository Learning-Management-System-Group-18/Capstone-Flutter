import 'package:capstone_flutter/widgets/navigator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/auth_repository.dart';
import '../widgets/alert.dart';
import '../widgets/transition.dart';

class AuthController extends ChangeNotifier {
  String _nama = '';
  String _email = '';
  String _password = '';
  final AuthRepository _authRepository = AuthRepository();

  bool isGet = false;
  bool get loading => isGet;

  isUsernameValid(String name) {
    if (name.isEmpty) {
      return 'Username cannot be empty!';
    }
    if (name.length >= 3) {
      _nama = name;
      return null;
    } else {
      return 'Username min 3 characters!';
    }
  }

  isEmailValid(String email) {
    if (email.isEmpty) {
      return 'Email cannot be empty!';
    } else if (EmailValidator.validate(email)) {
      _email = email;
      return null;
    } else {
      return 'Please enter a valid email!';
    }
  }

  isPasswordValid(String password) {
    if (password.isEmpty) {
      return 'Password cannot be empty!';
    }
    if (password.length >= 8) {
      _password = password;
      return null;
    } else {
      return 'Password min 8 characters! (${password.length}/8)';
    }
  }

  saveSession(BuildContext context, String email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("email", email);
    await pref.setBool("is_login", true);

    Navigator.pushAndRemoveUntil(
      context,
      TransisiHalaman(
          tipe: PageTransitionType.size,
          align: Alignment.center,
          page: NavigationPage()),
      (route) => false,
    );
    notifyListeners();
  }

  isvalid(BuildContext context) {
    print(_email);
    _authRepository.userRegister(_nama, _email, _password);

    AlertSucces(context, "Account registered successfully!")
        .then((value) => Navigator.pop(context));
  }

  cekLogin(BuildContext context, String email, String password) async {
    final login = await _authRepository.userLogin(email, password);

    if (email == '' || password == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email or Password cannot be empty!')),
      );
    } else if (!EmailValidator.validate(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email!')),
      );
    } else if (login?.status?.code == "SUCCESS" && login?.data != null) {
      saveSession(
        context,
        email,
      );
      Navigator.pushAndRemoveUntil(
        context,
        TransisiHalaman(
          tipe: PageTransitionType.size,
          align: Alignment.center,
          page: NavigationPage(),
        ),
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account not found!')),
      );
    }
  }
}
