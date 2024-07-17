import 'package:currency_grain/config/theme/text_theme.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

ThemeData darkThemeData() {
  return ThemeData(
    //! You Can Set All Your Custom Dark Theme Here
      scaffoldBackgroundColor: AppColors.kBlack,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.kPrimary,
        onPrimary: AppColors.kPrimary,
        secondary: AppColors.kSecondary,
        onSecondary: AppColors.kOnSecondary,
        error: AppColors.kRed,
        onError: AppColors.kOnError,
        background: AppColors.kThemeBackgroundDark,
        onBackground: AppColors.kThemeBackgroundLight,
        surface: AppColors.kThemeBackgroundDark,
        onSurface: AppColors.kThemeBackgroundDark,
        onSurfaceVariant: AppColors.kThemeBackgroundContainerDark,
      ),
      datePickerTheme: DatePickerThemeData(
          backgroundColor: AppColors.kThemeBackgroundDark,
          headerBackgroundColor: AppColors.kThemeBackgroundDark,
          headerHeadlineStyle: const TextStyle(color: Colors.white),
          headerHelpStyle: const TextStyle(color: Colors.white),
          dayStyle: const TextStyle(color: Colors.white),
          dividerColor: AppColors.kPrimary,
          rangePickerHeaderHeadlineStyle: const TextStyle(color: Colors.white),
          rangePickerHeaderHelpStyle: const TextStyle(color: Colors.white),
          headerForegroundColor: Colors.white,
          rangePickerHeaderForegroundColor: Colors.white,

          dayForegroundColor: MaterialStateProperty.all(Colors.white),
          dayOverlayColor: MaterialStateProperty.all(Colors.white),
          rangeSelectionOverlayColor: MaterialStateProperty.all(Colors.white),
          // yearBackgroundColor: MaterialStateProperty.all(Colors.white),
          // yearOverlayColor: MaterialStateProperty.all(Colors.white),
          yearForegroundColor: MaterialStateProperty.all(Colors.white),
          todayForegroundColor: MaterialStateProperty.all(Colors.white),
          weekdayStyle: const TextStyle(color: Colors.white),
          // yearStyle:  TextStyle(color: Colors.white),
          // rangePickerHeaderBackgroundColor: Colors.redAccent
          inputDecorationTheme: const InputDecorationTheme(
            helperStyle: TextStyle(color: Colors.white),
            labelStyle: TextStyle(color: Colors.white),
            hintStyle: TextStyle(color: Colors.white),
            counterStyle: TextStyle(color: Colors.white),

          ),
          rangePickerHeaderBackgroundColor:  Colors.white

        // rangePickerSurfaceTintColor: Colors.redAccent,
        // shadowColor: Colors.green,
        // surfaceTintColor: Colors.yellow,

        // todayBackgroundColor: MaterialStateProperty.all(Colors.white),
      ),
      progressIndicatorTheme:
      const ProgressIndicatorThemeData(linearTrackColor: Colors.white24),
      textTheme: CustomTextTheme.textThemeDark,
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
        backgroundColor: AppColors.kBlack,
        dayPeriodTextColor: AppColors.kWhite,
        dialTextColor: AppColors.kWhite,
        hourMinuteTextColor: AppColors.kWhite,
      ));
}
