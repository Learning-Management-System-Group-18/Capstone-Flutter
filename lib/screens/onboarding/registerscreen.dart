import 'package:capstone_flutter/constants/icon.dart';
import 'package:capstone_flutter/controllers/AuthController.dart';
import 'package:capstone_flutter/widgets/space.dart';
import 'package:capstone_flutter/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({Key? key}) : super(key: key);

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  bool? passwordVisible;
  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisible = false;
  }

  final _formKey = GlobalKey<FormState>();

  bool isselect = false;

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);

    if (usernameController.text.length != 0 ||
        emailController.text.length != 0 ||
        passwordController.text.length != 0) {
      setState(() {
        isselect = true;
      });
    } else {
      setState(() {
        isselect = false;
      });
    }

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
          physics: const ClampingScrollPhysics(),
          child: Container(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 15),
            child: Form(
              key: _formKey,
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
                  UrbanistText().blackBold('Create your Account', 30),
                  spaceHeight(38),
                  TextFormField(
                    key: const Key('username'),
                    onChanged: (val) {
                      setState(() {
                        usernameController.text = val;
                      });
                    },
                    style: UrbanistText().styleText(16),
                    decoration: InputDecoration(
                      prefixIcon: RepoIcon().user2,
                      hintStyle: GoogleFonts.urbanist(fontSize: 16),
                      hintText: "Username",
                      fillColor: RepoColor().color3,
                      filled: true,
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                    ),
                    validator: (username) =>
                        authController.isUsernameValid(username!),
                  ),
                  spaceHeight(10),
                  TextFormField(
                    key: const Key('email'),
                    style: UrbanistText().styleText(16),
                    onChanged: (val) {
                      setState(() {
                        emailController.text = val;
                      });
                    },
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
                    validator: (email) => authController.isEmailValid(email!),
                  ),
                  spaceHeight(10),
                  TextFormField(
                    key: const Key('password'),
                    style: UrbanistText().styleText(16),
                    obscureText: !passwordVisible!,
                    enableSuggestions: false,
                    onChanged: (val) {
                      setState(() {
                        passwordController.text = val;
                      });
                    },
                    autocorrect: false,
                    decoration: InputDecoration(
                      prefixIcon: RepoIcon().lock,
                      hintStyle: GoogleFonts.urbanist(fontSize: 16),
                      hintText: "Password",
                      fillColor: RepoColor().color3,
                      filled: true,
                      isDense: true,
                      suffixIcon: IconButton(
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
                    validator: (password) =>
                        authController.isPasswordValid(password!),
                  ),
                  spaceHeight(30),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        authController.isvalid(context);
                      }
                    },
                    child: isselect == false
                        ? UrbanistText().primaryBold('Sign Up', 16)
                        : UrbanistText().whiteBold("Sign Up", 16),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary:
                          isselect == false ? Colors.white : RepoColor().color1,
                      minimumSize: const Size.fromHeight(56),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: BorderSide(
                              color: RepoColor().color1, width: 1.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: GoogleFonts.urbanist(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: UrbanistText().primaryBold('Sign In', 16),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
