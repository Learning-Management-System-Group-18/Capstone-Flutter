import 'package:capstone_flutter/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UrbanistText {
  Text blackBold(
    String text,
    double size,
  ) {
    return Text(
      text,
      style: GoogleFonts.urbanist(
          fontSize: size, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  Text blackNormal(
    String text,
    double size,
  ) {
    return Text(
      text,
      style: GoogleFonts.urbanist(fontSize: size, color: Colors.black),
    );
  }

  Text whiteNormal(
    String text,
    double size,
  ) {
    return Text(
      text,
      style: GoogleFonts.urbanist(fontSize: size, color: Colors.white),
    );
  }

  Text whiteBold(
    String text,
    double size,
  ) {
    return Text(
      text,
      style: GoogleFonts.urbanist(
          fontSize: size, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Text primaryBold(
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

  Text primaryNormal(
    String text,
    double size,
  ) {
    return Text(
      text,
      style: GoogleFonts.urbanist(
          fontSize: size,
          fontWeight: FontWeight.normal,
          color: RepoColor().color1),
    );
  }

  Text warningBold(
    String text,
    double size,
  ) {
    return Text(
      text,
      style: GoogleFonts.urbanist(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: RepoColor().colorWarning),
    );
  }

  TextStyle styleText(double size) {
    return GoogleFonts.urbanist(fontSize: size);
  }
}
