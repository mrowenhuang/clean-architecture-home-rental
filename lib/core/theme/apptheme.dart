import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Apptheme {
  static ThemeData appTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: false,
      fontFamily: GoogleFonts.kodchasan().fontFamily,
    );
  }
}
