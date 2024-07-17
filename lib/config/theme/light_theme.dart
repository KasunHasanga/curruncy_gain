

import 'package:currency_grain/config/theme/text_theme.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

ThemeData lightThemeData() {
  return ThemeData(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.kPrimary,
        onPrimary: AppColors.kPrimary,
        secondary: AppColors.kSecondary,
        onSecondary: AppColors.kOnSecondary,
        error: AppColors.kRed,
        onError: AppColors.kOnError,
        background: AppColors.kThemeBackgroundLight,
        onBackground: AppColors.kThemeBackgroundDark,
        surface: AppColors.kThemeBackgroundLight,
        onSurface: AppColors.kThemeBackgroundLight,
        onSurfaceVariant: AppColors.kThemeBackgroundContainerLight,
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: AppColors.kThemeBackgroundLight,
        headerBackgroundColor:  AppColors.kThemeBackgroundLight,
        headerHeadlineStyle: const TextStyle(color: Colors.black87),
        dayStyle: const TextStyle(color: Colors.black87),
        dividerColor: AppColors.kPrimary,
        rangePickerHeaderHeadlineStyle: const TextStyle(color: Colors.black87),
        rangePickerHeaderHelpStyle: const TextStyle(color: Colors.black87),
        headerForegroundColor: Colors.black87,
        rangePickerHeaderForegroundColor: Colors.black87,

        dayForegroundColor: MaterialStateProperty.all(Colors.black87),
        dayOverlayColor: MaterialStateProperty.all(Colors.black87),
        rangeSelectionOverlayColor: MaterialStateProperty.all(Colors.black87),
        // yearBackgroundColor: MaterialStateProperty.all(Colors.white),
        // yearOverlayColor: MaterialStateProperty.all(Colors.white),
        yearForegroundColor: MaterialStateProperty.all(Colors.black87),
        todayForegroundColor: MaterialStateProperty.all(Colors.black87),
        weekdayStyle: const TextStyle(color: Colors.black87),
        // yearStyle:  TextStyle(color: Colors.white),
        // rangePickerHeaderBackgroundColor: Colors.redAccent
        inputDecorationTheme: const InputDecorationTheme(
          helperStyle: TextStyle(color: Colors.black87),
          labelStyle: TextStyle(color: Colors.black87),
          hintStyle: TextStyle(color: Colors.black87),
          counterStyle: TextStyle(color: Colors.black87),
        ),



      ),
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      textTheme: CustomTextTheme.textThemeLight,
      progressIndicatorTheme:
      const ProgressIndicatorThemeData(linearTrackColor: Colors.black12),
      inputDecorationTheme: InputDecorationTheme(
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.kRed)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.kBorderColor),
              borderRadius: BorderRadius.circular(14)),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.kBorderColor),
              borderRadius: BorderRadius.circular(14)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.kPrimary)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.kBorderColor),
              borderRadius: BorderRadius.circular(14))),
      timePickerTheme: const TimePickerThemeData(
        backgroundColor: AppColors.kWhite,
        dayPeriodTextColor: AppColors.kBlack,
        dialTextColor: AppColors.kBlack,
        hourMinuteTextColor: AppColors.kBlack,
      ));
}
