import 'dart:async';

import 'package:capstone_flutter/constants/colors.dart';
import 'package:capstone_flutter/screens/onboarding/boardingscreen.dart';
import 'package:capstone_flutter/widgets/navigator.dart';
import 'package:capstone_flutter/widgets/transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  bool? islogin;
  String? token;

  cek() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    islogin = prefs.getBool("is_login");
    token = prefs.getString("token");
    print('tokenlogin : $token');
    print('islogin : $islogin');
  }

  @override
  void initState() {
    // TODO: implement initState
    cek();
    super.initState();
    Timer(const Duration(seconds: 5), () {
      if (islogin == false || token!.isEmpty) {
        Navigator.pushReplacement(
            context,
            TransisiHalaman(
                tipe: PageTransitionType.rightToLeft,
                page: const Boardingscreen()));
      } else {
        Navigator.pushReplacement(
            context,
            TransisiHalaman(
                tipe: PageTransitionType.rightToLeft,
                page: const NavigationPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RepoColor().color1,
      body: const Center(
        child: Image(
          image: Svg('assets/icon/logo.svg', size: Size(250, 250)),
        ),
      ),
    );
  }
}
