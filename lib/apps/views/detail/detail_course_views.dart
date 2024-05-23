part of '../../views.dart';

class DetailCoursePageViews extends StatefulWidget {
  final String courseId;

  const DetailCoursePageViews({
    super.key,
    required this.courseId,
  });

  @override
  State<DetailCoursePageViews> createState() => _DetailCoursePageViewsState();
}

class _DetailCoursePageViewsState extends State<DetailCoursePageViews> {
  final CourseController _courseController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeUtils.kDetailBackground.withOpacity(0.98),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverDetailCourseHeaderWidget(
                courseId: widget.courseId,
                courseController: _courseController,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 24.w,
                            right: 24.w,
                            top: 16.h,
                          ),
                          color: AppThemeUtils.kColorWhite,
                          width: 1.sw,
                          height: 60.h,
                          child: Card(
                            elevation: 0,
                            color: Colors.white,
                            child: InkWell(
                              onTap: () => Get.snackbar(
                                'SkillKu',
                                'This feature is currently preview only!',
                                colorText: AppThemeUtils.kColorWhite,
                                backgroundColor: AppThemeUtils.kColorPrimary,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.r),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Brand(Brands.zoom, size: 40.h),
                                    Text(
                                      'Join with Zoom',
                                      style: TextStyle(
                                        color: AppThemeUtils.kColorGrey1,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                    const Icon(
                                      CupertinoIcons.arrow_right,
                                      color: AppThemeUtils.kColorGrey1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            buildCardTimeComponent(),
                            buildCardLevelComponent(),
                          ],
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          children: [
                            buildCardFeeComponent(),
                            buildCardQuotaComponent(),
                          ],
                        ),
                        SizedBox(height: 24.h),
                        buildDescriptionComponent(),
                        SizedBox(height: 24.h),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16.w),
                          child: ElevatedButton(
                            onPressed: () => Get.snackbar(
                              'SkillKu',
                              'This feature is currently preview only!',
                              colorText: AppThemeUtils.kColorWhite,
                              backgroundColor: AppThemeUtils.kColorPrimary,
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppThemeUtils.kColorPrimary,
                              fixedSize: Size(1.sw, 50.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                            ),
                            child: Text(
                              'Daftar Sekarang',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: AppThemeUtils.kColorWhite,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 48.h),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 42.h, left: 8.w),
            child: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                CupertinoIcons.back,
                color: AppThemeUtils.kColorWhite,
                size: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCardLevelComponent() {
    return Container(
      height: 100.h,
      margin: EdgeInsets.only(left: 24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 80.w,
                  child: Text(
                    'Pemula',
                    softWrap: true,
                    style: TextStyle(
                      color: AppThemeUtils.kColorPrimary,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(
                  Icons.signal_cellular_alt_2_bar,
                  color: AppThemeUtils.kColorYellow,
                  size: 40.r,
                ),
              ],
            ),
            const Spacer(flex: 2),
            Text(
              'Level',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppThemeUtils.kColorGrey2,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCardTimeComponent() {
    final filteredList = _courseController.courseListRx.firstWhere(
      (e) => e.uuid == widget.courseId,
    );

    final date = DateFormat('dd MMMM yyyy').format(
      DateTime.fromMillisecondsSinceEpoch(
        filteredList.start * 1000,
      ),
    );

    final time = DateFormat('HH:mm').format(
      DateTime.fromMillisecondsSinceEpoch(
        filteredList.start * 1000,
      ),
    );

    return Container(
      height: 100.h,
      margin: EdgeInsets.only(left: 24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 80.w,
                  child: Text(
                    date,
                    softWrap: true,
                    style: TextStyle(
                      color: AppThemeUtils.kColorPrimary,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(
                  BoxIcons.bx_time,
                  color: AppThemeUtils.kColorGrey2,
                  size: 40.r,
                ),
              ],
            ),
            SizedBox(
              width: 80.w,
              child: Text(
                '$time WIB',
                softWrap: true,
                style: TextStyle(
                  color: AppThemeUtils.kColorGrey1,
                  fontSize: 12.sp,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'Waktu',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16.sp,
                color: AppThemeUtils.kColorGrey2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCardFeeComponent() {
    return Container(
      height: 100.h,
      margin: EdgeInsets.only(left: 24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 80.w,
                  child: Text(
                    'Gratis',
                    softWrap: true,
                    style: TextStyle(
                      color: AppThemeUtils.kColorPrimary,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(
                  BoxIcons.bxs_badge_dollar,
                  color: AppThemeUtils.kColorGreen,
                  size: 40.r,
                ),
              ],
            ),
            const Spacer(flex: 2),
            Text(
              'Biaya',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppThemeUtils.kColorGrey2,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCardQuotaComponent() {
    return Container(
      height: 100.h,
      margin: EdgeInsets.only(left: 24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 80.w,
                  child: Text(
                    '150 Orang',
                    softWrap: true,
                    style: TextStyle(
                      color: AppThemeUtils.kColorPrimary,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(
                  CupertinoIcons.person_3_fill,
                  color: AppThemeUtils.kColorGrey2,
                  size: 40.r,
                ),
              ],
            ),
            const Spacer(flex: 2),
            Text(
              'Kuota',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppThemeUtils.kColorGrey2,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDescriptionComponent() {
    final filteredList = _courseController.courseListRx.firstWhere(
      (e) => e.uuid == widget.courseId,
    );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deskripsi',
            style: TextStyle(
              color: AppThemeUtils.kColorPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 22.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            filteredList.description,
            style: TextStyle(
              color: AppThemeUtils.kColorPrimary,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
