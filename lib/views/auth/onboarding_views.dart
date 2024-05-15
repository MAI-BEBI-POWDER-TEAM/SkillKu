import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingPageViews extends StatefulWidget {
  const OnBoardingPageViews({super.key});

  @override
  State<OnBoardingPageViews> createState() => _OnBoardingPageViewsState();
}

class _OnBoardingPageViewsState extends State<OnBoardingPageViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/bg-onboarding.png',
            scale: 0.1,
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/alphabet-logo-colored.png',
                    scale: 3.5,
                  ),
                  Text(
                    'Masuk ke Skill-Ku',
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
