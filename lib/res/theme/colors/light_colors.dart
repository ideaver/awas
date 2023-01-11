import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Circular Value
const defaultCircular = 30.0;
const defaultTopLeftCircular = 35.0;
const defaultMargin = 25.0;

BorderRadius kBorderRadius = BorderRadius.circular(defaultCircular);

class LightColors {
  static const Color kPrimaryColor = Blue;
  static const Color kSecondaryColor = kRed;
  static const Color kTertiaryColor = Color(0xFFE9C24F);

  static const Color kLightYellow = Color(0xFFFFF9EC);
  static const Color kLightYellow2 = Color(0xFFFFE4C7);
  static const Color kDarkYellow = Color(0xFFF9BE7C);
  static const Color kPalePink = Color(0xFFFED4D6);

  static const Color Blue = Color(0xFF0095FF);

  static const Color kRed = Color(0xFFE9003A);
  static const Color kLavender = Color(0xFFD5E4FE);
  static const Color kBlue = Color(0xFF6488E4);
  static const Color kLightGreen = Color(0xFFD9E6DC);
  static const Color kGreen = Color(0xFF309397);

  static const Color kDarkBlue = Color(0xFF0D253F);

  //Secondary Color
  static const Color kDangerColor = Color(0xffF27D81);
  static const Color kWarningColor = Color(0xffF6CE7E);
  static const Color kSuccessColor = kGreen;
  static const Color kInfoColor = Color(0xff60B2F0);

//Gray Color Set
  static const Color kBackgroundColor = Color(0xffffffff); //0xFF000000
  static const Color kGreyColor = Color(0xFFF5F5F5);
  static const Color kDarkGreyColor = Color(0xFF9599a4);
  static const Color kWhiteColor = Color(0xFFFFFFFF);
  static const Color kBlackColor = Color(0xFF333333);

  static TextStyle titleTextStyle = GoogleFonts.roboto(
      textStyle: const TextStyle(
    color: LightColors.kDarkBlue,
    fontSize: 32,
    fontWeight: FontWeight.w500,
  ));

  static TextStyle subTitleTextStyle = GoogleFonts.montserrat(
      textStyle: const TextStyle(
    color: LightColors.kDarkGreyColor,
    fontSize: 18,
    fontWeight: FontWeight.normal,
  ));

  static TextStyle subTitle2TextStyle = GoogleFonts.montserrat(
      textStyle: const TextStyle(
    color: LightColors.kDarkGreyColor,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  ));

  static TextStyle linkTextStyle = GoogleFonts.montserrat(
      textStyle: const TextStyle(
    color: LightColors.Blue,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ));

  static TextStyle whiteTextStyle = GoogleFonts.montserrat(
      textStyle: const TextStyle(
    color: kWhiteColor,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  ));
}
