import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskati_project/Core/Util/App_Colors.dart';
import 'package:taskati_project/Core/Util/App_Text_Styles.dart';

final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.blue[200],
    textTheme: TextTheme(
      displayLarge: getHeadlineStyle(),
      displayMedium: getTitleStyle(),
      displaySmall: getSmallStyle(),
    ),
    appBarTheme: AppBarTheme(
        titleTextStyle: getHeadlineStyle(),
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        backgroundColor: Colors.transparent,
        elevation: 0.0),
    inputDecorationTheme: InputDecorationTheme(
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
    fontFamily: GoogleFonts.poppins().fontFamily);

////////////////////////////////////////////////////////
///////////////////////////////////////////////////////

final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkThemeColor,
    appBarTheme: AppBarTheme(
        titleTextStyle: getHeadlineStyle(),
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        backgroundColor: Colors.transparent,
        elevation: 0.0),
    textTheme: TextTheme(
      displayLarge: getHeadlineStyle(color: Colors.white),
      displayMedium: getTitleStyle(color: Colors.white),
      displaySmall: getSmallStyle(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
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
    fontFamily: GoogleFonts.poppins().fontFamily);
