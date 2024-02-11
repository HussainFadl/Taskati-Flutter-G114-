import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_project/Core/NetWork/local_storage.dart';
import 'package:taskati_project/Core/Util/App_Functions.dart';
import 'package:taskati_project/Featuers/Home/home_view.dart';
import 'package:taskati_project/Featuers/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    
    bool isUpLoad = AppLocal.getCacheData(AppLocal.ISUPLOAD_KEY) ?? false;
    Future.delayed(const Duration(seconds: 5), () {
      AppFunctions.getMoveToNextPage(
          context: context,
          theScreenYouWantToProceed:
              isUpLoad ? const HomeView() : const UpLoadView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100, right: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Lottie.asset('Assets/AnimationTskati.json',
                  width: 400, height: 400),
              const Text(
                '''Taskati''',
              ),
              const Text(
                '...   نظّم وقتك تنجز مهامك',
              ),
              const Text(
                'It\'s time to get Organized ...',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
