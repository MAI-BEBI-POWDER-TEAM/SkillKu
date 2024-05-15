import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skillku/views/auth/onboarding_views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      child: GetMaterialApp(
        title: 'Flutter Demo',
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
            'assets/bg-splash.png',
            scale: 0.1,
          ),
          Center(
            child: Image.asset(
              'assets/alphabet-logo-colored.png',
              scale: 3.5,
            ),
          ),
        ],
      ),
    );
  }
}
