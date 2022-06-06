import 'package:capstone_flutter/widgets/space.dart';
import 'package:capstone_flutter/widgets/text.dart';
import 'package:capstone_flutter/widgets/transition.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../loginscreen.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.remove("is_login");
      preferences.remove("email");
    });
    Navigator.pushAndRemoveUntil(
      context,
      TransisiHalaman(
          tipe: PageTransitionType.rightToLeftWithFade, page: Loginscreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        margin: const EdgeInsets.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //BAGIAN ATASS
            UrbanistText().blackBold('Profile', 32),
            spaceHeight(20),
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.green,
                    // backgroundImage: AssetImage('images/logo.png'),
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
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        children: [
                          const Icon(Icons.person_outline),
                          spaceWidth(20),
                          UrbanistText().blackNormal('Edit Profile', 18),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    highlightColor: Colors.blue[300],
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        children: [
                          const Icon(Icons.key_outlined),
                          spaceWidth(20),
                          UrbanistText().blackNormal('Reset Password', 18),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    highlightColor: Colors.blue[300],
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        children: [
                          const Icon(Icons.question_answer_outlined),
                          spaceWidth(20),
                          UrbanistText().blackNormal('FAQ', 18),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    highlightColor: Colors.blue[300],
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        children: [
                          const Icon(Icons.email_outlined),
                          spaceWidth(20),
                          UrbanistText().blackNormal('Email Support', 18),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    highlightColor: Colors.blue[300],
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        children: [
                          const Icon(Icons.question_mark_outlined),
                          spaceWidth(20),
                          UrbanistText().blackNormal('Terms & Condition', 18),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                  spaceHeight(50),
                  ElevatedButton(
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
                    child: UrbanistText().blackBold("Sign Out", 18),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.grey[300],
                      minimumSize: const Size.fromHeight(56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
