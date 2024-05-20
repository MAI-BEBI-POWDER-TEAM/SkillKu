part of '../../views.dart';

class ExplorePageViews extends StatefulWidget {
  const ExplorePageViews({super.key});

  @override
  State<ExplorePageViews> createState() => _ExplorePageViewsState();
}

class _ExplorePageViewsState extends State<ExplorePageViews>
    with SingleTickerProviderStateMixin {
  RxString search = ''.obs;

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
              search.value = value;
            },
            onSaved: (value) {
              if (value != null) search.value = value;
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
          () => search.value == ''
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

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return const SizedBox();
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
                  future: _jobController.getJobBySearch(search.value),
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

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return const SizedBox();
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
        // Container(
        //   margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        //   child: TextFormField(
        //     controller: _searchController,
        //     onChanged: (value) {

        //     },
        //     decoration: const InputDecoration(
        //       prefixIcon: Icon(
        //         BoxIcons.bx_search,
        //         color: AppThemeUtils.kColorGrey2,
        //       ),
        //       isDense: true,
        //       hintText: 'Search',
        //       enabledBorder: OutlineInputBorder(
        //         borderSide: BorderSide(color: AppThemeUtils.kColorGrey2),
        //       ),
        //       focusedBorder: OutlineInputBorder(
        //         borderSide: BorderSide(color: AppThemeUtils.kColorGrey2),
        //       ),
        //     ),
        //   ),
        // ),
        ValueListenableBuilder(
          valueListenable: _courseController.courseBox.listenable(),
          builder: (context, courses, __) {
            return Obx(
              () => _courseController.courseListRx.isEmpty
                  ? Center(
                      child: Text(
                        'No courses are found!',
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: AppThemeUtils.kColorPrimary,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        ),
                      ),
                    )
                  : Container(
                      width: 1.sw,
                      height: 500.h,
                      margin: EdgeInsets.only(
                        top: 8.h,
                        left: 16.w,
                        right: 16.w,
                      ),
                      child: ListView.builder(
                        itemCount: _courseController.courseListRx.length,
                        itemBuilder: (context, index) {
                          final startDate = DateFormat('dd MMMM').parse(
                            _courseController.courseListRx[index].start,
                          );
                          final endDate = DateFormat('dd MMMM').parse(
                            _courseController.courseListRx[index].end,
                          );

                          final sTime = DateFormat('dd MMMM yyyy HH:mm').parse(
                            _courseController.courseListRx[index].start,
                          );
                          final eTime = DateFormat('dd MMMM yyyy HH:mm').parse(
                            _courseController.courseListRx[index].end,
                          );

                          return Container(
                            margin: EdgeInsets.only(bottom: 16.h),
                            child: CourseWidget(
                              imageUrl: _courseController
                                  .courseListRx[index].thumbnail,
                              category: _courseController
                                  .courseListRx[index].category,
                              title:
                                  _courseController.courseListRx[index].title,
                              type: 'Daring',
                              startDay: startDate.weekday.toString(),
                              endDay: endDate.weekday.toString(),
                              startDate:
                                  DateFormat('dd MMMM').format(startDate),
                              endDate: DateFormat('dd MMMM').format(endDate),
                              startTime: '${sTime.hour}:${sTime.minute}',
                              endTime: '${eTime.hour}:${eTime.minute}',
                            ),
                          );
                        },
                      ),
                    ),
            );
          },
        ),
        // Container(
        //   width: 1.sw,
        //   height: 300.h,
        //   margin: EdgeInsets.only(top: 8.h, left: 16.w, right: 16.w),
        //   child: ListView.builder(
        //     itemCount: _courseController.courseList.length,
        //     itemBuilder: (context, index) {
        //       final date = _courseController.courseList[index]['date'];

        //       final startDate = DateFormat('dd MMMM').format(date);
        //       final endDate = DateFormat('dd MMMM').format(
        //         date.add(const Duration(days: 2)),
        //       );

        //       final startDay = DateFormat('EEEE').format(date);
        //       final endDay = DateFormat('EEEE').format(
        //         date.add(const Duration(days: 2)),
        //       );

        //       final startTime = DateFormat('HH:mm').format(date);
        //       final endTime = DateFormat('HH:mm').format(
        //         date.add(const Duration(hours: 2)),
        //       );

        //       return Container(
        //         margin: EdgeInsets.only(bottom: 16.h),
        //         child: CourseWidget(
        //           imageUrl: _courseController.courseList[index]['thumbnail'],
        //           category: _courseController.courseList[index]['category'],
        //           title: _courseController.courseList[index]['title'],
        //           type: _courseController.courseList[index]['type'],
        //           startDay: startDay,
        //           endDay: endDay,
        //           startDate: startDate,
        //           endDate: endDate,
        //           startTime: startTime,
        //           endTime: endTime,
        //         ),
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}
