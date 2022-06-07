import 'package:capstone_flutter/screens/loginscreen.dart';
import 'package:capstone_flutter/screens/registerscreen.dart';
import 'package:capstone_flutter/widgets/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/AuthController.dart';
import 'screens/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var islogin = prefs.getBool("is_login");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthController(),
          child: const Registerscreen(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthController(),
          child: const Loginscreen(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: islogin == false ? const Splashscreen() : const NavigationPage(),
      ),
    ),
  );
}
