part of '../../views.dart';

class ExplorePageViews extends StatefulWidget {
  const ExplorePageViews({super.key});

  @override
  State<ExplorePageViews> createState() => _ExplorePageViewsState();
}

class _ExplorePageViewsState extends State<ExplorePageViews>
    with SingleTickerProviderStateMixin {
  RxInt currentPage = 0.obs;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    tabController.addListener(() {
      setState(() {
        currentPage.value = tabController.index;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 80.h,
        title: Text(
          'Eksplor',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: AppThemeUtils.kColorPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 32.sp,
          ),
        ),
        bottom: TabBar(
          controller: tabController,
          labelColor: AppThemeUtils.kColorPrimary,
          indicatorColor: AppThemeUtils.kColorPrimary,
          unselectedLabelColor: AppThemeUtils.kColorGrey2,
          isScrollable: true,
          tabAlignment: TabAlignment.center,
          tabs: const [
            Tab(text: 'Kelas Pelatihan'),
            Tab(text: 'Lowongan Pekerjaan'),
          ],
        ),
      ),
    );
  }
}
