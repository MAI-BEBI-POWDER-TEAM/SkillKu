part of '../../views.dart';

class ProfilePageViews extends StatefulWidget {
  const ProfilePageViews({super.key});

  @override
  State<ProfilePageViews> createState() => _ProfilePageViewsState();
}

class _ProfilePageViewsState extends State<ProfilePageViews> {
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
    );
  }
}