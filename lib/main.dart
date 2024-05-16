import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:skillku/apps/views.dart';
import 'package:skillku/data/controller/job_controller.dart';
import 'package:skillku/data/controller/training_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive init
  await Hive.initFlutter();

  // Get Put
  Get.lazyPut(() => JobController());
  Get.lazyPut(() => TrainingController());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SkillKu',
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Poppins',
        ),
        home: const SplashPageViews(),
      ),
    );
  }
}

class SplashPageViews extends StatefulWidget {
  const SplashPageViews({super.key});

  @override
  State<SplashPageViews> createState() => _SplashPageViewsState();
}

class _SplashPageViewsState extends State<SplashPageViews> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, _, __) => const OnBoardingPageViews(),
            transitionsBuilder: (_, anim, __, child) =>
                FadeTransition(opacity: anim, child: child),
          ),
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/background/bg-splash.png',
            scale: 0.1,
          ),
          Center(
            child: Image.asset(
              'assets/logo/alphabet-logo-colored.png',
              scale: 3.5,
            ),
          ),
        ],
      ),
    );
  }
}
