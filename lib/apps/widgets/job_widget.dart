part of '../views.dart';

class JobWidget extends StatelessWidget {
  const JobWidget({
    super.key,
    required this.fee,
    required this.title,
    required this.company,
    required this.imageUrl,
    required this.location,
    required this.description,
  });

  final String? fee;
  final String? title;
  final String? company;
  final String? imageUrl;
  final String? location;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.network(
          imageUrl ??
              'https://www.its.ac.id/tmesin/wp-content/uploads/sites/22/2022/07/no-image.png',
          width: 100.w,
          height: 100.h,
          fit: BoxFit.contain,
        ),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 160.w,
              child: Text(
                title ?? 'Title',
                textAlign: TextAlign.left,
                softWrap: true,
                maxLines: 3,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: AppThemeUtils.kColorPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            SizedBox(
              width: 160.w,
              child: Text(
                company ?? 'Company',
                textAlign: TextAlign.start,
                softWrap: true,
                maxLines: 2,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: AppThemeUtils.kColorPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.sp,
                ),
              ),
            ),
            SizedBox(
              width: 160.w,
              child: Text(
                location ?? 'Location',
                textAlign: TextAlign.start,
                softWrap: true,
                maxLines: 3,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: AppThemeUtils.kColorPrimary,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
