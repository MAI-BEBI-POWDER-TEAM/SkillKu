part of '../../views.dart';

class HomePageViews extends StatefulWidget {
  const HomePageViews({super.key});

  @override
  State<HomePageViews> createState() => _HomePageViewsState();
}

class _HomePageViewsState extends State<HomePageViews>
    with SingleTickerProviderStateMixin {
  RxInt currentPage = 0.obs;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);

    tabController.addListener(() {
      setState(() {
        currentPage.value = tabController.index;
      });
    });

    super.initState();
  }

  List<Map<String, dynamic>> programmingList = <Map<String, dynamic>>[
    {
      'thumbnail': 'assets/thumbnail/programming/front-end-thumb.png',
      'title': 'Front-End\nDevelopment',
    },
    {
      'thumbnail': 'assets/thumbnail/programming/back-end-thumb.png',
      'title': 'Back-End\nDevelopment',
    },
    {
      'thumbnail': 'assets/thumbnail/programming/mobile-thumb.png',
      'title': 'Mobile App\nDevelopment',
    },
    {
      'thumbnail': 'assets/thumbnail/programming/devops-thumb.png',
      'title': 'DevOps',
    },
  ];

  List<Map<String, dynamic>> designList = <Map<String, dynamic>>[
    {
      'thumbnail': 'assets/thumbnail/design/creative-thumb.png',
      'title': 'Creative Art',
    },
    {
      'thumbnail': 'assets/thumbnail/design/uiux-thumb.png',
      'title': 'UI/UX Design',
    },
    {
      'thumbnail': 'assets/thumbnail/design/fashion-thumb.png',
      'title': 'Fashion Design',
    },
    {
      'thumbnail': 'assets/thumbnail/design/graphic-thumb.png',
      'title': 'Graphic Design',
    },
  ];

  List<Map<String, dynamic>> multimediaList = <Map<String, dynamic>>[
    {
      'thumbnail': 'assets/thumbnail/multimedia/photography-thumb.png',
      'title': 'Photography',
    },
    {
      'thumbnail': 'assets/thumbnail/multimedia/videography-thumb.png',
      'title': 'Videography',
    },
    {
      'thumbnail': 'assets/thumbnail/multimedia/vlogging-thumb.png',
      'title': 'Vlogging',
    },
    {
      'thumbnail': 'assets/thumbnail/multimedia/fashion-photo-thumb.png',
      'title': 'Fashion Photoshoot',
    },
    {
      'thumbnail': 'assets/thumbnail/multimedia/product-photo-thumb.png',
      'title': 'Product Photoshoot',
    }
  ];

  List<Map<String, dynamic>> analyticList = <Map<String, dynamic>>[
    {
      'thumbnail': 'assets/thumbnail/analytic/business-analytics-thumb.png',
      'title': 'Business Analytics',
    },
    {
      'thumbnail': 'assets/thumbnail/analytic/data-analytics-thumb.png',
      'title': 'Data Analytics',
    },
    {
      'thumbnail': 'assets/thumbnail/analytic/market-analytics-thumb.png',
      'title': 'Market Analytics',
    },
  ];

  List<Map<String, dynamic>> courseList = <Map<String, dynamic>>[
    {
      'thumbnail': 'assets/image/creative-art.png',
      'title': 'Introduction to Colors #1',
      'category': 'Creative Art Design',
      'date': DateTime.now(),
      'type': 'Online',
    },
    {
      'thumbnail': 'assets/image/photography.jpg',
      'title': 'The Exposure Triangle',
      'category': 'Photography',
      'date': DateTime.now(),
      'type': 'Online',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 80.h,
        title: Text(
          'Beranda',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: AppThemeUtils.kColorPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 32.sp,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w, top: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Hello, ',
                    style: TextStyle(
                      color: AppThemeUtils.kColorPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                    children: [
                      TextSpan(
                        text: 'Andre!',
                        style: TextStyle(
                          color: AppThemeUtils.kColorPrimary,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  BoxIcons.bxs_user_circle,
                  size: 36.r,
                ),
              ],
            ),
          ),
        ],
        bottom: TabBar(
          controller: tabController,
          labelColor: AppThemeUtils.kColorPrimary,
          indicatorColor: AppThemeUtils.kColorPrimary,
          unselectedLabelColor: AppThemeUtils.kColorGrey2,
          isScrollable: true,
          tabAlignment: TabAlignment.center,
          tabs: const [
            Tab(text: 'Pemrograman'),
            Tab(text: 'Design'),
            Tab(text: 'Multimedia'),
            Tab(text: 'Analytics'),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          height: 1.sh,
          width: 1.sw,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 1.sw,
                  height: 215.h,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: tabController,
                    children: [
                      ListView.builder(
                        itemCount: programmingList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              right: 16.w,
                              top: 16.h,
                              bottom: 16.h,
                            ),
                            child: CategoryWigdet(
                              imageUrl: programmingList[index]['thumbnail'],
                              title: programmingList[index]['title'],
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: designList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              right: 16.w,
                              top: 16.h,
                              bottom: 16.h,
                            ),
                            child: CategoryWigdet(
                              imageUrl: designList[index]['thumbnail'],
                              title: designList[index]['title'],
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: multimediaList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              right: 16.w,
                              top: 16.h,
                              bottom: 16.h,
                            ),
                            child: CategoryWigdet(
                              imageUrl: multimediaList[index]['thumbnail'],
                              title: multimediaList[index]['title'],
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: analyticList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              right: 16.w,
                              top: 16.h,
                              bottom: 16.h,
                            ),
                            child: CategoryWigdet(
                              imageUrl: analyticList[index]['thumbnail'],
                              title: analyticList[index]['title'],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1.sw,
                  height: 0.3.h,
                  color: AppThemeUtils.kColorGrey2,
                  margin: EdgeInsets.symmetric(vertical: 24.h),
                ),
                Text(
                  'Pilihan Kelas',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 200.h,
                  width: 300.w,
                  child: ListView.builder(
                    itemCount: courseList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return HomeCourseWidget(
                        imageUrl: courseList[index]['thumbnail'],
                        title: courseList[index]['title'],
                        category: courseList[index]['category'],
                        date: courseList[index]['date'],
                        type: courseList[index]['type'],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
