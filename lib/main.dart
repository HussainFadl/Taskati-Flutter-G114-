import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati_project/Featuers/splash_view.dart';

// themes (dark, light)

void main() async {
  // initializes HiveFlutter
  await Hive.initFlutter();
  // open Box to store any data allover the application
  await Hive.openBox('user');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taskati 🂠',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: SplashView(),
    );
  }
}
