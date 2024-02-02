
import 'package:flutter/material.dart';


class AppFunctions{

  static getMoveToNextPage({
  required context,
  required theScreenYouWantToProceed,
}){

  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: 
  (context)=> theScreenYouWantToProceed ));

  
}
}

