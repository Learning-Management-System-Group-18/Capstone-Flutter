import 'package:capstone_flutter/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UrbanistText {
  Widget blackBold(
    String text,
    double size,
  ) {
    return Text(
      text,
      style: GoogleFonts.urbanist(
          fontSize: size, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  Widget blackNormal(
    String text,
    double size,
  ) {
    return Text(
      text,
      style: GoogleFonts.urbanist(fontSize: size, color: Colors.black),
    );
  }

  Widget whiteNormal(
    String text,
    double size,
  ) {
    return Text(
      text,
      style: GoogleFonts.urbanist(fontSize: size, color: Colors.white),
    );
  }

  Widget whiteBold(
    String text,
    double size,
  ) {
    return Text(
      text,
      style: GoogleFonts.urbanist(
          fontSize: size, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Widget primaryBold(
    String text,
    double size,
  ) {
    return Text(
      text,
      style: GoogleFonts.urbanist(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: RepoColor().color1),
    );
  }

  TextStyle styleText(double size) {
    return GoogleFonts.urbanist(fontSize: size);
  }
}
