import 'package:flutter/material.dart';
import 'package:taskati_project/Featuers/splash_view.dart';

void main() {
  runApp(const MyApp());

  
}
class  MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taskati 🂠',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      home: SplashView(),
    );
  }
}

