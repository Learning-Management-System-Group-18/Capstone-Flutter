import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../constants/icon.dart';
import '../../widgets/space.dart';
import '../../widgets/text.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

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
        title: UrbanistText().blackBold('Reset Password', 18),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                key: Key('password1'),
                style: UrbanistText().styleText(16),
                // controller: emailController,
                decoration: input_decoration('New Password'),
              ),
              spaceHeight(20),
              TextFormField(
                key: Key('password2'),
                style: UrbanistText().styleText(16),
                // controller: emailController,
                decoration: input_decoration('Repeat New Password'),
              ),
              spaceHeight(50),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: UrbanistText().whiteBold("Reset", 16),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: RepoColor().color1,
                  minimumSize: const Size.fromHeight(56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration input_decoration(String hint) {
    return InputDecoration(
      hintStyle: GoogleFonts.urbanist(fontSize: 16),
      hintText: hint,
      fillColor: RepoColor().color3,
      filled: true,
      isDense: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
    );
  }
}
