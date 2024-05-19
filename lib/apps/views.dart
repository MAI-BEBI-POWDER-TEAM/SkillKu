// import 'dart:developer';

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:skillku/data/controller/home_controller.dart';
import 'package:skillku/data/controller/job_controller.dart';
import 'package:skillku/data/controller/course_controller.dart';
import 'package:skillku/data/remote/response/job.dart';
import 'package:skillku/domain/entities/course.dart';
import 'package:skillku/utils/theme_utils.dart';

// Auth
part 'views/auth/onboarding_views.dart';
// Home
part 'views/home/home_views.dart';
// Explore
part 'views/explore/explore_views.dart';
// Profile
part 'views/profile/profile_views.dart';

// Widgets
part 'widgets/home_course_widget.dart';
part 'widgets/page_bottom_navbar.dart';
part 'widgets/category_widget.dart';
part 'widgets/course_widget.dart';
part 'widgets/job_widget.dart';
