import 'package:flutter/material.dart';
import 'package:taskati_project/Core/Util/App_Colors.dart';

class CustomButton extends StatelessWidget {
   const  CustomButton({
    super.key,
    this.background = const Color(0xff4E5AE8),
   required this.text,
   required this.onPressed,
  });

  final String text;
  final Function() onPressed;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: background,
        foregroundColor: AppColors.whiteColor
      ),
      onPressed: onPressed,
     child: Text(text,
     ));
  }
}

