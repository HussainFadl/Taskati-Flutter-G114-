import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_project/Core/Util/App_Functions.dart';
import 'package:taskati_project/Core/Util/App_Text_Styles.dart';
import 'package:taskati_project/Featuers/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState(){
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),(){
       AppFunctions.getMoveToNextPage(
        context: context, 
       theScreenYouWantToProceed:const UpLoadView());
      }
      
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.only(top: 100,right: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Lottie.asset('Assets/AnimationTskati.json',
              width: 400,
              height: 400),
              Text('Taskati',
              style: getTitleStyle(fontSize: 20)),
              Text('It\'s time to get Organized',
              style: getSmallStyle(fontSize: 10),),
            ],
          ),
        ),
      ),
    );
  }
}