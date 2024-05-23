part of '../views.dart';

class SliverDetailCourseHeaderWidget extends StatelessWidget {
  const SliverDetailCourseHeaderWidget({
    super.key,
    required this.courseId,
    required this.courseController,
  });

  final String courseId;
  final CourseController courseController;

  @override
  Widget build(BuildContext context) {
    final filteredList = courseController.courseListRx.firstWhere(
      (e) => e.uuid == courseId,
    );

    return courseController.courseListRx.isNotEmpty
        ? SliverAppBar(
            backgroundColor: AppThemeUtils.kColorPrimary,
            expandedHeight: 160.h,
            pinned: true,
            stretch: true,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 2.5,
              titlePadding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 16.h,
              ),
              title: Text(
                filteredList.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: filteredList.title.length >= 26 ? 14.sp : 18.sp,
                ),
              ),
              background: Opacity(
                opacity: 0.2,
                child: Image.network(
                  filteredList.thumbnail,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        : Container();
  }
}
