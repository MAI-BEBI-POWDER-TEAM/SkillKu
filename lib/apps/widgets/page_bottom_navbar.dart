part of '../views.dart';

class NavbarPageSetup extends StatefulWidget {
  const NavbarPageSetup({super.key});

  @override
  State<NavbarPageSetup> createState() => _NavbarPageSetupState();
}

class _NavbarPageSetupState extends State<NavbarPageSetup> {
  int _selectedIndex = 0;

  final List<Widget> _pageViews = [
    const HomePageViews(),
    const ExplorePageViews(),
    const ProfilePageViews(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageViews.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppThemeUtils.kColorPrimary,
        unselectedItemColor: AppThemeUtils.kColorGrey2,
        backgroundColor: AppThemeUtils.kColorWhite,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        enableFeedback: false,
        onTap: _onItemTapped,
        iconSize: 20.h,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(BoxIcons.bx_home_circle),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(BoxIcons.bx_compass),
            label: 'Eksplor',
          ),
          BottomNavigationBarItem(
            icon: Icon(BoxIcons.bx_user_circle),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
