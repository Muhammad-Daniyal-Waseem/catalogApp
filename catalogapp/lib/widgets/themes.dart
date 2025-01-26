import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily:
            GoogleFonts.lato().fontFamily, // Corrected GoogleFonts usage
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyMedium: GoogleFonts.lato(), // Applying Lato font
            ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: ThemeData.dark().textTheme.copyWith(
              bodyMedium: GoogleFonts.lato(),
            ),
      );

  static Color creamcolor = Color(0xfff5f5f5);
  static Color darkBlueColor = Color(0xff403b58);
}
