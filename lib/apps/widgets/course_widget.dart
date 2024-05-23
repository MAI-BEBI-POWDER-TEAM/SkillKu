part of '../views.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.category,
    required this.startDay,
    required this.endDay,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.type,
  });

  final String imageUrl;
  final String title;
  final String category;
  final String startDay;
  final String endDay;
  final String startDate;
  final String endDate;
  final String startTime;
  final String endTime;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          imageUrl,
          width: 140.w,
          height: 75.h,
          fit: BoxFit.fitHeight,
        ),
        SizedBox(width: 8.w),
        Column(
          children: [
            SizedBox(
              width: 140.w,
              child: Text(
                title,
                textAlign: TextAlign.left,
                softWrap: true,
                maxLines: 2,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: AppThemeUtils.kColorPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
            ),
            SizedBox(
              width: 140.w,
              child: Text(
                category,
                textAlign: TextAlign.left,
                softWrap: true,
                maxLines: 2,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: AppThemeUtils.kColorPrimary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            SizedBox(
              width: 140.w,
              child: Row(
                children: [
                  Icon(
                    BoxIcons.bx_calendar,
                    color: AppThemeUtils.kColorPrimary,
                    size: 18.sp,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '$startDate - $endDate',
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 140.w,
              height: 32.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    BoxIcons.bx_time,
                    color: AppThemeUtils.kColorPrimary,
                  ),
                  SizedBox(width: 4.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$startDay - $endDay',
                        style: TextStyle(
                          fontSize: 10.sp,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '$startTime - $endTime',
                        style: TextStyle(
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
