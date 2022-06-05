import 'package:capstone_flutter/constants/colors.dart';
import 'package:capstone_flutter/screens/registerscreen.dart';
import 'package:capstone_flutter/widgets/navigator.dart';
import 'package:capstone_flutter/widgets/space.dart';
import 'package:capstone_flutter/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/icon.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool? passwordVisible;
  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: RepoIcon().arrowCircle,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 15),
            child: Column(
              children: [
                Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: Svg('assets/images/rafiki.svg'),
                    ),
                  ),
                ),
                spaceHeight(10),
                UrbanistText().blackBold("Login to your Account", 30),
                spaceHeight(38),
                TextFormField(
                  key: Key('email'),
                  style: UrbanistText().styleText(16),
                  // controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: RepoIcon().email1,
                    hintStyle: GoogleFonts.urbanist(fontSize: 16),
                    hintText: "Email",
                    fillColor: RepoColor().color3,
                    filled: true,
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  key: Key('password'),
                  style: UrbanistText().styleText(16),
                  obscureText: !passwordVisible!,
                  enableSuggestions: false,
                  autocorrect: false,
                  // controller: passwordController,
                  decoration: InputDecoration(
                    prefixIcon: RepoIcon().lock,
                    hintStyle: GoogleFonts.urbanist(fontSize: 16),
                    hintText: "Password",
                    fillColor: RepoColor().color3,
                    filled: true,
                    isDense: true,
                    suffixIcon: IconButton(
                      // color: authmodelView.primaryColor,
                      icon: Icon(
                        passwordVisible!
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible!;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot the password?',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.urbanist(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NavigationPage()),
                        (route) => false);
                  },
                  child: UrbanistText().whiteBold("Sign In", 16),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: RepoColor().color1,
                    minimumSize: const Size.fromHeight(56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 34,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UrbanistText().blackNormal("Don't have an Account?", 16),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Registerscreen()));
                      },
                      child: UrbanistText().primaryBold('Sign Up', 16),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
