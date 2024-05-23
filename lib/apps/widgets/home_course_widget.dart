part of '../views.dart';

class HomeCourseWidget extends StatelessWidget {
  const HomeCourseWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.category,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
  });

  final String imageUrl;
  final String title;
  final String category;
  final String startDate;
  final String endDate;
  final String startTime;
  final String endTime;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.2,
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: title,
              child: Image.network(
                imageUrl,
                width: 175.w,
                height: 80.h,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 8.h),
            SizedBox(
              width: 175.w,
              child: Text(
                title,
                textAlign: TextAlign.left,
                maxLines: 2,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: AppThemeUtils.kColorPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                ),
              ),
            ),
            Text(
              category,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppThemeUtils.kColorPrimary,
                fontWeight: FontWeight.w700,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              '$startDate - $endDate',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppThemeUtils.kColorPrimary,
                fontWeight: FontWeight.w500,
                fontSize: 10.sp,
              ),
            ),
            Text(
              '$startTime - $endTime WIB',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppThemeUtils.kColorPrimary,
                fontWeight: FontWeight.w500,
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
