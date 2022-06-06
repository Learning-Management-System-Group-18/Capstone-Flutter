import 'package:capstone_flutter/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'loginscreen.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Container(
                  height: 350.0,
                  width: 350.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: Svg('assets/images/helloimages.svg'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Hello,',
                  style: GoogleFonts.urbanist(
                      fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Upgrade your Professional Skill with Us. Lets go Follow us',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.urbanist(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Loginscreen()));
                  },
                  child: const Text('Get Started'),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: RepoColor().color1,
                    minimumSize: const Size.fromHeight(60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}