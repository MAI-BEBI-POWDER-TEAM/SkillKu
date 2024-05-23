part of '../../views.dart';

class OnBoardingPageViews extends StatefulWidget {
  const OnBoardingPageViews({super.key});

  @override
  State<OnBoardingPageViews> createState() => _OnBoardingPageViewsState();
}

class _OnBoardingPageViewsState extends State<OnBoardingPageViews> {
  Future signInWithGoogle() async {
    try {
      // GoogleSignInAccount?
      final googleUser = await GoogleSignIn().signIn();
      // GoogleSignInAuthentication?
      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // log('$googleAuth: $credential', name: 'Login');
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (ex) {
      Get.snackbar(
        'SkillKu',
        'Failed to login! $ex',
        colorText: AppThemeUtils.kColorWhite,
        backgroundColor: Colors.redAccent,
      );
      log('${ex.code}: ${ex.stackTrace}', name: 'Login Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: 1.sw,
            child: Image.asset(
              'assets/background/bg-onboarding.png',
              scale: 0.1,
              fit: BoxFit.fitWidth,
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 16.h),
                  Image.asset(
                    'assets/logo/alphabet-logo-colored.png',
                    scale: 3.5,
                  ),
                  Text(
                    'Masuk ke Skill-Ku',
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () async {
                      await signInWithGoogle();

                      if (FirebaseAuth.instance.currentUser != null) {
                        Get.snackbar(
                          'SkillKu',
                          'Welcome back, ${FirebaseAuth.instance.currentUser?.displayName}!',
                          colorText: AppThemeUtils.kColorWhite,
                          backgroundColor: AppThemeUtils.kColorPrimary,
                        );

                        // Temporary
                        Get.off(() => const NavbarPageSetup());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(1.sw - 50.w, 45.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.r)),
                      ),
                      backgroundColor: AppThemeUtils.kColorPrimary,
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Brand(Brands.google),
                        SizedBox(width: 8.w),
                        Text(
                          'Masuk menggunakan Google',
                          style: TextStyle(
                            color: AppThemeUtils.kColorWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'Dengan melanjutkan, Anda menyetujui ',
                      style: TextStyle(
                        color: AppThemeUtils.kColorPrimary,
                      ),
                      children: [
                        TextSpan(
                          text: 'Ketentuan Layanan',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppThemeUtils.kColorPrimary,
                          ),
                        ),
                        TextSpan(text: '\ndan '),
                        TextSpan(
                          text: 'Kebijakan Privasi',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppThemeUtils.kColorPrimary,
                          ),
                        ),
                        TextSpan(text: ' Skill-Ku'),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
