import 'package:flutter/material.dart';

extension AppColors on BuildContext {
  //
  static const Color kThemeBackgroundDark = Color(0xFF202330);
  static const Color kThemeBackgroundContainerDark = Color(0xFF080911);
  static const Color kThemeBackgroundLight = Color(0xFFFFFFFF);
  static const Color kThemeBackgroundContainerLight = Color(0xF9F5F5F5);

  static const Color kPrimary = Color(0xFF2789FB);
  static const Color kSecondary = Color(0xFF2789FB);
  static const Color kOnSecondary = Color(0xFF2789FB);
  static const Color kOnError = Color(0xFF2789FB);

  static const Color kSplashBgColor1 = Color(0xFF0078C0);
  static const Color kSplashBgColor2 = Color(0xFF035C91);
  static const Color kLightGreen = Color(0xFF4CAF50);
  static const Color kBellNotify = Color(0xFF42B362);
  static const Color kGray = Color(0xFF9B9B9B);
  static const Color kDividerBlue = Color(0xFF2789FB);
  static const Color kOrange = Colors.deepOrange;
  static const Color kDividerYellow = Color(0xFFB4C400);
  static const Color kDividerGreen = Color(0xFF00C48C);
  static const Color kTextColor = Color(0xFF747F91);

  static const Color kDarkModeColor = Color(0xFF172947);

  static const Color kTransparent = Color(0x00FFFFFF);
  static const Color kWhite = Color(0xFFFFFFFF);
  static const Color kAliceBlue = Color(0xFFE9F3FF);

  static const Color kBlack20 = Color(0x20000000);
  static const Color kBlack = Color(0xFF000000);
  static const Color kBorderColor = Color(0xFFE0E0E7);
  static const Color kRed = Color(0xFFFF6D51);

  ///leave type Color
  static const Color kLeaveTypePublic= Color(0xFF84D45F);
  static const Color kLeaveTypeBank= Color(0xFF7068D1);
  static const Color kLeaveTypeMercantile= Color(0xFFCF3A55);



  // static const Color kLoginDivider = Color(0xFFD6DDEB);


  static const Color kShadow = Color(0x259BA0B7);
  static const Color kBgColor = Color(0xFFEFEFF2);




  //linear Gradient
  static const LinearGradient linearGradientCard01 = LinearGradient(
      colors: [
        Color(0xFFD1E2FF),
        Color(0xFFA3BBE2),
      ],
      begin: FractionalOffset(0.0, 0.0),
      end: FractionalOffset(1.0, 0.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp);

  static const LinearGradient appbarGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[kLeaveTypeBank,
        Color(0xFFA3BBE2),]);
}