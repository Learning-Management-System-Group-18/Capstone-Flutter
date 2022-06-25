import 'dart:io';

// import 'package:capstone_flutter/constants/colors.dart';
import 'package:capstone_flutter/constants/icon.dart';
import 'package:capstone_flutter/screens/profile/edit_profile_page.dart';
import 'package:capstone_flutter/screens/profile/email_support_page.dart';
import 'package:capstone_flutter/screens/profile/faq_page.dart';
import 'package:capstone_flutter/screens/profile/reset_password_page.dart';
import 'package:capstone_flutter/screens/profile/term_condition_page.dart';
import 'package:capstone_flutter/widgets/space.dart';
import 'package:capstone_flutter/widgets/text.dart';
import 'package:capstone_flutter/widgets/transition.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../onboarding/loginscreen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? file;
  String? path;

  logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setBool("is_login", false);
      preferences.remove("email");
      preferences.remove("token");
    });
    Navigator.pushAndRemoveUntil(
      context,
      TransisiHalaman(
          tipe: PageTransitionType.rightToLeftWithFade,
          page: const Loginscreen()),
      (route) => false,
    );
  }

  profilePath() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    path = pref.getString("imageProfile");
    setState(() {
      file = File(path ?? '');
    });
  }

  @override
  void initState() {
    super.initState();
    profilePath();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          margin: const EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //BAGIAN ATASS
              UrbanistText().blackBold('Profile', 24),
              spaceHeight(20),
              Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 70.0,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    spaceHeight(10),
                    UrbanistText().blackBold('Nirmala Azalea', 18),
                    spaceHeight(5),
                    UrbanistText().blackNormal('nirmala@gmail.com', 16),
                  ],
                ),
              ),
              spaceHeight(15),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Column(
                  children: [
                    InkWell(
                      highlightColor: Colors.blue[300],
                      child: ListTile(
                        title: UrbanistText().blackNormal('Edit Profile', 16),
                        trailing: RepoIcon().goTo,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          TransisiHalaman(
                              tipe: PageTransitionType.rightToLeftWithFade,
                              page: const EditProfilePage()),
                        );
                      },
                    ),
                    InkWell(
                      highlightColor: Colors.blue[300],
                      child: ListTile(
                        title: UrbanistText().blackNormal('Reset Password', 16),
                        trailing: RepoIcon().goTo,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          TransisiHalaman(
                            tipe: PageTransitionType.rightToLeftWithFade,
                            page: const ResetPasswordPage(),
                          ),
                        );
                      },
                    ),
                    InkWell(
                      highlightColor: Colors.blue[300],
                      child: ListTile(
                        title: UrbanistText().blackNormal('FAQ', 16),
                        trailing: RepoIcon().goTo,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          TransisiHalaman(
                            tipe: PageTransitionType.rightToLeftWithFade,
                            page: const FaqPage(),
                          ),
                        );
                      },
                    ),
                    InkWell(
                      highlightColor: Colors.blue[300],
                      child: ListTile(
                        title: UrbanistText().blackNormal('Email Support', 16),
                        trailing: RepoIcon().goTo,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          TransisiHalaman(
                            tipe: PageTransitionType.rightToLeftWithFade,
                            page: const EmailSupportPage(),
                          ),
                        );
                      },
                    ),
                    InkWell(
                      highlightColor: Colors.blue[300],
                      child: ListTile(
                        title: UrbanistText()
                            .blackNormal('Terms and Condition', 16),
                        trailing: RepoIcon().goTo,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          TransisiHalaman(
                            tipe: PageTransitionType.rightToLeftWithFade,
                            page: const TermConditionPage(),
                          ),
                        );
                      },
                    ),
                    spaceHeight(20),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: const Text('Yakin ingin keluar?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Batal'),
                              ),
                              TextButton(
                                onPressed: () {
                                  logOut();
                                  Navigator.pop(context);
                                },
                                child: const Text('Keluar'),
                              )
                            ],
                          ),
                        );
                      },
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.red[600],
                          fontSize: 18,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
