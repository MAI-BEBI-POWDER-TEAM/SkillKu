import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:skillku/apps/views.dart';
import 'package:skillku/data/controller/home_controller.dart';
import 'package:skillku/data/controller/job_controller.dart';
import 'package:skillku/data/controller/course_controller.dart';
import 'package:skillku/data/local/course_db.dart';
import 'package:skillku/domain/entities/course.dart';
import 'package:skillku/firebase_options.dart';
import 'package:skillku/utils/theme_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Init Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Hive init
  await Hive.initFlutter();
  Hive.registerAdapter(CourseAdapter());
  await CourseDB.init();

  // Get Put
  Get.put(JobController(), permanent: true);
  Get.put(HomeController(), permanent: true);
  Get.put(CourseController(), permanent: true);

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
        if (FirebaseAuth.instance.currentUser != null) {
          Get.snackbar(
            'SkillKu',
            'Welcome back, ${FirebaseAuth.instance.currentUser?.displayName}!',
            colorText: AppThemeUtils.kColorWhite,
            backgroundColor: AppThemeUtils.kColorPrimary,
          );

          // Temporary
          Get.off(() => const NavbarPageSetup());
        } else {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (context, _, __) => const OnBoardingPageViews(),
              transitionsBuilder: (_, anim, __, child) =>
                  FadeTransition(opacity: anim, child: child),
            ),
          );
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: 1.sw,
            child: Image.asset(
              'assets/background/bg-splash.png',
              scale: 0.1,
              fit: BoxFit.cover,
            ),
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
