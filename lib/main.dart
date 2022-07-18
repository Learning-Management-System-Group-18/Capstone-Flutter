import 'package:capstone_flutter/controllers/CourseController.dart';
import 'package:capstone_flutter/controllers/HomeController.dart';
import 'package:capstone_flutter/controllers/ProfileController.dart';
import 'package:capstone_flutter/screens/onboarding/loginscreen.dart';
import 'package:capstone_flutter/screens/onboarding/registerscreen.dart';
import 'package:capstone_flutter/screens/onboarding/boardingscreen.dart';
import 'package:capstone_flutter/screens/onboarding/splashscreen.dart';
import 'package:capstone_flutter/widgets/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/AuthController.dart';

main() async {
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
        ChangeNotifierProvider(
          create: (_) => HomeController(),
        ),
        ChangeNotifierProvider(
          create: (_) => CourseController(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileController(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splashscreen(),
      ),
    ),
  );
}
