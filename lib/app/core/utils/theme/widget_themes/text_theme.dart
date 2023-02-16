import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_test/app/core/constants/colors.dart';
import 'package:technical_test/app/core/utils/extension.dart';

class KTextTheme {
  KTextTheme._();
  static TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
        fontSize: 24.0.sp, fontWeight: FontWeight.w600, color: kDarkColor),
    headline2: GoogleFonts.montserrat(
        fontSize: 20.0.sp, fontWeight: FontWeight.w500, color: kDarkColor),
    headline3: GoogleFonts.poppins(
        fontSize: 16.0.sp, fontWeight: FontWeight.w500, color: kWhiteColor),
    headline4: GoogleFonts.poppins(
        fontSize: 10.0.sp, fontWeight: FontWeight.w500, color: kDarkGrey),
    bodyText1: GoogleFonts.poppins(
        fontSize: 12.0.sp, fontWeight: FontWeight.bold, color: kWhiteColor),
    bodyText2: GoogleFonts.poppins(
        fontSize: 12.0.sp, fontWeight: FontWeight.bold, color: kDarkColor),
    subtitle1: GoogleFonts.poppins(
        fontSize: 8.0.sp, fontWeight: FontWeight.w300, color: kDarkGrey),
  );
}
