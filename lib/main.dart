import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati_project/Core/Model/task_model.dart';
import 'package:taskati_project/Core/Util/App_Colors.dart';
import 'package:taskati_project/Core/Util/App_Text_Styles.dart';
import 'package:taskati_project/Core/themes.dart';
import 'package:taskati_project/Featuers/splash_view.dart';

//1- themes (dark, light)
//2- widget (change)
//3- cache mode

void main() async {
  // initializes HiveFlutter
  await Hive.initFlutter();
  // open Box to store any data allover the application
  await Hive.openBox('user');
  // Registering the TypeAdapter of TaskModel.dart file
  Hive.registerAdapter<TaskModel>(TaskModelAdapter());
  await Hive.openBox<TaskModel>('task');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Taskati 🂠',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: darkTheme,
        theme: lightTheme,
        home: const SplashView());
  }
}
