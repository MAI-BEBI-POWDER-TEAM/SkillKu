part of '../../views.dart';

class ExplorePageViews extends StatefulWidget {
  const ExplorePageViews({super.key});

  @override
  State<ExplorePageViews> createState() => _ExplorePageViewsState();
}

class _ExplorePageViewsState extends State<ExplorePageViews>
    with SingleTickerProviderStateMixin {
  RxString searchJob = ''.obs;
  RxString searchCourse = ''.obs;

  final JobController _jobController = Get.find();
  final CourseController _courseController = Get.find();

  late TabController tabController;
  final TextEditingController _searchController = TextEditingController();

  RxInt currentPage = 0.obs;

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: 1.sw,
            height: 1.sh,
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            child: TabBarView(
              controller: tabController,
              children: [
                SizedBox(
                  width: 1.sw,
                  height: 120.h,
                  child: buildCoursePage(),
                ),
                SizedBox(
                  width: 1.sw,
                  height: 120.h,
                  child: buildJobPage(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildJobPage() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: TextFormField(
            controller: _searchController,
            onChanged: (value) {
              searchJob.value = value;
            },
            onSaved: (value) {
              if (value != null) searchJob.value = value;
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(
                BoxIcons.bx_search,
                color: AppThemeUtils.kColorGrey2,
              ),
              isDense: true,
              hintText: 'Search',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppThemeUtils.kColorGrey2),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppThemeUtils.kColorGrey2),
              ),
            ),
          ),
        ),
        Obx(
          () => searchJob.value == ''
              ? FutureBuilder(
                  future: _jobController.getAllJob(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.data.jobsResults != null) {
                          Job job = snapshot.data;

                          return Container(
                            height: 400.h,
                            margin: EdgeInsets.only(left: 16.w, right: 16.w),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.jobsResults!.length,
                              itemBuilder: (context, index) {
                                String location = '';

                                if (job.jobsResults![index].location != null) {
                                  location = job.jobsResults![index].location!
                                      .replaceAll('  ', '');
                                }

                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 8.h),
                                  child: JobWidget(
                                    fee: 'Negotiable',
                                    title: job.jobsResults![index].title,
                                    company:
                                        job.jobsResults![index].companyName,
                                    imageUrl: job.jobsResults![index].thumbnail,
                                    location: location,
                                    description:
                                        job.jobsResults![index].description,
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      }

                      return const SizedBox();
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Center(
                        child: Text(
                          'No open jobs are found!',
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: AppThemeUtils.kColorPrimary,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                        ),
                      );
                    }
                  },
                )
              : FutureBuilder(
                  future: _jobController.getJobBySearch(searchJob.value),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.data.jobsResults != null) {
                          Job job = snapshot.data;

                          return Container(
                            height: 400.h,
                            margin: EdgeInsets.only(left: 16.w, right: 16.w),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.jobsResults!.length,
                              itemBuilder: (context, index) {
                                String location = '';

                                if (job.jobsResults![index].location != null) {
                                  location = job.jobsResults![index].location!
                                      .replaceAll('  ', '');
                                }

                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 8.h),
                                  child: JobWidget(
                                    fee: 'Negotiable',
                                    title: job.jobsResults![index].title,
                                    company:
                                        job.jobsResults![index].companyName,
                                    imageUrl: job.jobsResults![index].thumbnail,
                                    location: location,
                                    description:
                                        job.jobsResults![index].description,
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      }

                      return const SizedBox();
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Center(
                        child: Text(
                          'No open jobs are found!',
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: AppThemeUtils.kColorPrimary,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                        ),
                      );
                    }
                  },
                ),
        ),
      ],
    );
  }

  Column buildCoursePage() {
    Future(() => _courseController.fetchAllCourses());

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: TextFormField(
            controller: _searchController,
            onChanged: (value) {
              searchCourse.value = value;

              if (value.isEmpty || value == '') {
                searchCourse.value = '';
              }
            },
            onSaved: (value) {
              if (value != null) {
                searchCourse.value = value;
              } else {
                searchCourse.value = '';
              }
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(
                BoxIcons.bx_search,
                color: AppThemeUtils.kColorGrey2,
              ),
              isDense: true,
              hintText: 'Search',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppThemeUtils.kColorGrey2),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppThemeUtils.kColorGrey2),
              ),
            ),
          ),
        ),
        ValueListenableBuilder(
          valueListenable: _courseController.courseBox.listenable(),
          builder: (context, courses, __) {
            return Obx(
              () => _courseController.courseListRx.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : Container(
                      width: 1.sw,
                      height: 400.h,
                      margin: EdgeInsets.only(
                        top: 8.h,
                        left: 16.w,
                        right: 16.w,
                      ),
                      child: searchCourse.value == ''
                          ? ListView.builder(
                              itemCount: _courseController.courseListRx.length,
                              itemBuilder: (context, index) {
                                final e = _courseController.courseListRx[index];

                                final startDate = DateFormat('dd MMMM').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                    e.start * 1000,
                                  ),
                                );
                                final endDate = DateFormat('dd MMMM').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                    e.start * 1000,
                                  ),
                                );

                                final sTime = DateFormat('HH:mm').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                    e.start * 1000,
                                  ),
                                );
                                final eTime = DateFormat('HH:mm').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                    e.end * 1000,
                                  ),
                                );

                                final sDay = DateFormat('EEEE').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                    e.start * 1000,
                                  ),
                                );
                                final eDay = DateFormat('EEEE').format(
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
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 16.h),
                                    child: CourseWidget(
                                      imageUrl: e.thumbnail,
                                      category: e.category,
                                      title: e.title,
                                      type: 'Daring',
                                      startDay: sDay,
                                      endDay: eDay,
                                      startDate: startDate,
                                      endDate: endDate,
                                      startTime: sTime,
                                      endTime: eTime,
                                    ),
                                  ),
                                );
                              },
                            )
                          : ListView.builder(
                              itemCount: _courseController.courseListRx
                                  .where(
                                    (p0) =>
                                        p0.title.contains(searchCourse.value),
                                  )
                                  .toList()
                                  .length,
                              itemBuilder: (context, index) {
                                final e = _courseController.courseListRx
                                    .where((p0) =>
                                        p0.title.contains(searchCourse.value))
                                    .toList()[index];

                                final startDate = DateFormat('dd MMMM').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                    e.start * 1000,
                                  ),
                                );
                                final endDate = DateFormat('dd MMMM').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                    e.start * 1000,
                                  ),
                                );

                                final sTime = DateFormat('HH:mm').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                    e.start * 1000,
                                  ),
                                );
                                final eTime = DateFormat('HH:mm').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                    e.end * 1000,
                                  ),
                                );

                                final sDay = DateFormat('EEEE').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                    e.start * 1000,
                                  ),
                                );
                                final eDay = DateFormat('EEEE').format(
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
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 16.h),
                                    child: CourseWidget(
                                      imageUrl: e.thumbnail,
                                      category: e.category,
                                      title: e.title,
                                      type: 'Daring',
                                      startDay: sDay,
                                      endDay: eDay,
                                      startDate: startDate,
                                      endDate: endDate,
                                      startTime: sTime,
                                      endTime: eTime,
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
            );
          },
        ),
      ],
    );
  }
}
