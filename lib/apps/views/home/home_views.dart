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

  final HomeController _homeController = Get.find();
  final CourseController _courseController = Get.find();

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    Future(() => _courseController.fetchAllCourses());

    tabController.addListener(() {
      setState(() {
        currentPage.value = tabController.index;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String name = FirebaseAuth.instance.currentUser?.displayName ?? '';

    if (name.contains(' ')) {
      name = FirebaseAuth.instance.currentUser?.displayName!
              .substring(0, name.indexOf(' ')) ??
          '';
    } else {
      name = FirebaseAuth.instance.currentUser?.displayName ?? '';
    }

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
                        text: '$name!',
                        style: TextStyle(
                          color: AppThemeUtils.kColorPrimary,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                FirebaseAuth.instance.currentUser!.photoURL != null
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(
                          FirebaseAuth.instance.currentUser!.photoURL
                              .toString(),
                        ),
                      )
                    : const Icon(
                        BoxIcons.bxs_user,
                        color: AppThemeUtils.kColorPrimary,
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
                        itemCount: _homeController.programmingList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              right: 16.w,
                              top: 16.h,
                              bottom: 16.h,
                            ),
                            child: CategoryWigdet(
                              imageUrl: _homeController.programmingList[index]
                                  ['thumbnail'],
                              title: _homeController.programmingList[index]
                                  ['title'],
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: _homeController.designList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              right: 16.w,
                              top: 16.h,
                              bottom: 16.h,
                            ),
                            child: CategoryWigdet(
                              imageUrl: _homeController.designList[index]
                                  ['thumbnail'],
                              title: _homeController.designList[index]['title'],
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: _homeController.multimediaList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              right: 16.w,
                              top: 16.h,
                              bottom: 16.h,
                            ),
                            child: CategoryWigdet(
                              imageUrl: _homeController.multimediaList[index]
                                  ['thumbnail'],
                              title: _homeController.multimediaList[index]
                                  ['title'],
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: _homeController.analyticList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              right: 16.w,
                              top: 16.h,
                              bottom: 16.h,
                            ),
                            child: CategoryWigdet(
                              imageUrl: _homeController.analyticList[index]
                                  ['thumbnail'],
                              title: _homeController.analyticList[index]
                                  ['title'],
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
                ValueListenableBuilder(
                  valueListenable: _courseController.courseBox.listenable(),
                  builder: (context, course, _) {
                    return SizedBox(
                      height: 220.h,
                      width: 300.w,
                      child: Obx(
                        () => _courseController.courseListRx.isNotEmpty
                            ? ListView.builder(
                                itemCount:
                                    _courseController.courseBox.values.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final e =
                                      _courseController.courseListRx[index];

                                  final startDate =
                                      DateFormat('dd MMMM yyyy').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                      e.start * 1000,
                                    ),
                                  );

                                  final endDate =
                                      DateFormat('dd MMMM yyyy').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                      e.end * 1000,
                                    ),
                                  );

                                  final startTime = DateFormat('HH:mm').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                      e.start * 1000,
                                    ),
                                  );
                                  final endTime = DateFormat('HH:mm').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                      e.end * 1000,
                                    ),
                                  );

                                  return GestureDetector(
                                    onTap: () => Get.to(
                                      () => DetailCoursePageViews(
                                        courseId: e.uuid.toString(),
                                      ),
                                    ),
                                    child: HomeCourseWidget(
                                      imageUrl: _courseController
                                          .courseListRx[index].thumbnail,
                                      title: _courseController
                                          .courseListRx[index].title,
                                      category: _courseController
                                          .courseListRx[index].category,
                                      startDate: startDate,
                                      endDate: endDate,
                                      startTime: startTime,
                                      endTime: endTime,
                                      type: 'Daring',
                                    ),
                                  );
                                },
                              )
                            : const Center(child: Text('No data found!')),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
