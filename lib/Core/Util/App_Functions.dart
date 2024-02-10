import 'package:flutter/material.dart';
import 'package:taskati_project/Core/Util/App_Buttons.dart';
import 'package:taskati_project/Core/Util/App_Colors.dart';
import 'package:taskati_project/Core/Util/App_Text_Styles.dart';





class AppFunctions {
  static getMoveToNextPage({
    required context,
    required theScreenYouWantToProceed,
  }) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => theScreenYouWantToProceed));
  }

  static showMySnackBar(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.redColor,
      content: Text((text), style: getSmallStyle()),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(20),
    ));
  }

 
}
