import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskati_project/Core/Util/App_Colors.dart';
import 'package:taskati_project/Core/Util/App_Text_Styles.dart';

final lightTheme = ThemeData(
    ///////// Text Style Theme //////////////
    scaffoldBackgroundColor: Colors.blue[200],
    textTheme: TextTheme(
      displayLarge: getHeadlineStyle(color: AppColors.darkThemeColor),
      displayMedium: getTitleStyle(color: AppColors.darkThemeColor),
      displaySmall: getSmallStyle(color: AppColors.darkThemeColor),
    ),

    /////////// AppBar Theme ////////////
    appBarTheme: AppBarTheme(
        titleTextStyle: getHeadlineStyle(),
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        backgroundColor: Colors.transparent,
        elevation: 0.0),

    ////////// Input Decoration Theme ////////////
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor),
          borderRadius: BorderRadius.circular(15),
        )),
    fontFamily: GoogleFonts.poppins().fontFamily,
    datePickerTheme: DatePickerThemeData(
        backgroundColor: Colors.blue[200],
        dayBackgroundColor: MaterialStateColor.resolveWith(
            (states) => AppColors.darkThemeColor),
        dayForegroundColor:
            MaterialStateColor.resolveWith((states) => AppColors.navyBlue),
        headerForegroundColor: AppColors.blackColor,
        dayOverlayColor:
            MaterialStateColor.resolveWith((states) => AppColors.navyBlue)));

////////////////////////////////////////////////////////
///////////////////////////////////////////////////////

final darkTheme = ThemeData(
    splashColor: AppColors.darkThemeColor,
    scaffoldBackgroundColor: AppColors.darkThemeColor,
    appBarTheme: AppBarTheme(
        titleTextStyle: getHeadlineStyle(),
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        backgroundColor: Colors.transparent,
        elevation: 0.0),
    textTheme: Typography.whiteMountainView,
    inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor),
          borderRadius: BorderRadius.circular(15),
        )),
    fontFamily: GoogleFonts.poppins().fontFamily,
    datePickerTheme: DatePickerThemeData(
        backgroundColor: AppColors.greyColor,
        dayBackgroundColor:
            MaterialStateColor.resolveWith((states) => AppColors.greyColor),
        dayForegroundColor:
            MaterialStateColor.resolveWith((states) => AppColors.whiteColor),
        headerForegroundColor: AppColors.blackColor));
