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
    if (name.length >= 3 && name.length <= 30) {
      _nama = name;
      return null;
    } else if (name.length < 3) {
      return 'Username min 3 characters!';
    } else if (name.length > 30) {
      return 'Username max 30 characters!';
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
    if (password.length >= 8 && password.length <= 16) {
      _password = password;
      return null;
    } else if (password.length < 8) {
      return 'Password min 8 characters! (${password.length}/16)';
    } else if (password.length > 16) {
      return 'Password max 16 characters! (${password.length}/16)';
    }
  }

  saveSession(
      BuildContext context, String email, String token, String name) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("email", email);
    await pref.setBool("is_login", true);
    await pref.setString("token", token);
    await pref.setString("fullName", name);

    print("data session : ${pref.getString("fullName")}");
    print("data session : ${pref.getString("token")}");
  }

  isvalid(BuildContext context) async {
    final register =
        await _authRepository.userRegister(_nama, _email, _password);
    print('register : $register');
    if (register == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email is already registered!')),
      );
    } else {
      if (register.status?.code == "BAD_CREDENTIALS") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email is already registered!')),
        );
      } else {
        AlertSucces(context, "Account registered successfully!")
            .then((value) => Navigator.pop(context));
      }
    }
  }

  cekLogin(BuildContext context, String email, String password) async {
    final login = await _authRepository.userLogin(email, password);
    print('login = $login');

    if (login == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email or password is incorrect!')),
      );
    } else {
      var token = login?.data?.token;
      var fullName = login?.data?.fullName;
      if (login.status?.code == "BAD_CREDENTIALS") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email or password is incorrect!')),
        );
      } else if (login.data?.role?[0] != "ROLE_USER") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Your account cannot access this app!')),
        );
      } else {
        saveSession(
          context,
          email,
          token!,
          fullName!,
        );
        Navigator.pushAndRemoveUntil(
          context,
          TransisiHalaman(
            tipe: PageTransitionType.size,
            align: Alignment.center,
            page: const NavigationPage(),
          ),
          (route) => false,
        );
      }
    }
  }
}


// if (email == '' || password == '') {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Email or Password cannot be empty!')),
//       );
//     } else if (!EmailValidator.validate(email)) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Invalid email!')),
//       );
//     } else if (login?.status?.code == "BAD_CREDENTIALS") {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Email or password is incorrect')),
//       );
//     } else if (login?.status?.code == "SUCCESS" &&
//         token != null &&
//         fullName != null) {
//       saveSession(
//         context,
//         email,
//         token,
//         fullName,
//       );
//       print(token);
//       Navigator.pushAndRemoveUntil(
//         context,
//         TransisiHalaman(
//           tipe: PageTransitionType.size,
//           align: Alignment.center,
//           page: const NavigationPage(),
//         ),
//         (route) => false,
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Account not found!')),
//       );
//     }