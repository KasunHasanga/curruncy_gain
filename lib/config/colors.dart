import 'package:flutter/material.dart';

extension AppColors on BuildContext {


  static const Color kPrimary = Color(0xFF00222C);
  static const Color kGray = Color(0xFF9B9B9B);
  static const Color kTextColor1 = Color(0xFF1E2022);
  static const Color kOrange = Color(0xFFFE9719);
  static const Color kBorderColor = Color(0xFFA3A3A3);


  static const Color kThemeBackgroundDark = Color(0xFFF8F8F8);
  static const Color kThemeBackgroundLight = Color(0xFFF8F8F8);

  static const Color kLightGreen = Color(0xFF4CAF50);
  static const Color kTransparent = Color(0x00FFFFFF);
  static const Color kWhite = Color(0xFFFFFFFF);

  static const Color kBlack = Color(0xFF000000);
  // static const Color kBorderColor = Color(0xFFE0E0E7);
  static const Color kRed = Color(0xFFFF6D51);
  static const Color kLightOrange = Color(0xFFf69844);
  static const Color appbarGradientColor01 = Color(0xFF4D5BBE);
  static const Color appbarGradientColor02 = Color(0xFF3A469A);

  static const LinearGradient appbarGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: <Color>[appbarGradientColor01, appbarGradientColor02]);


}