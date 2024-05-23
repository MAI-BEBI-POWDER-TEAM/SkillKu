part of '../../views.dart';

class ProfilePageViews extends StatefulWidget {
  const ProfilePageViews({super.key});

  @override
  State<ProfilePageViews> createState() => _ProfilePageViewsState();
}

class _ProfilePageViewsState extends State<ProfilePageViews> {
  final user = FirebaseAuth.instance.currentUser;
  RxString phoneNumber = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 80.h,
        title: Text(
          'Profil',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: AppThemeUtils.kColorPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 32.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 4.h),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    user!.photoURL.toString(),
                  ),
                  radius: 60.r,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                user!.displayName.toString(),
                style: TextStyle(
                  color: AppThemeUtils.kColorPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                ),
              ),
              Text(
                user!.email.toString(),
                style: TextStyle(
                  color: AppThemeUtils.kColorGrey2,
                  fontSize: 16.sp,
                ),
              ),
              const Spacer(flex: 2),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();

                    if (FirebaseAuth.instance.currentUser == null) {
                      Get.snackbar(
                        'SkillKu',
                        'Logout successful, see you!',
                        colorText: AppThemeUtils.kColorWhite,
                        backgroundColor: AppThemeUtils.kColorPrimary,
                      );

                      Get.off(() => const OnBoardingPageViews());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppThemeUtils.kColorPrimary,
                    fixedSize: Size(1.sw, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: AppThemeUtils.kColorWhite,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
