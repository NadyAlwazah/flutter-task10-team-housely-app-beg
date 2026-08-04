import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class BookingActivityCard extends StatelessWidget {
  final String title;
  final String location;
  final String image;
  final String dateOrPrice;
  final String statusText;
  final Color statusColor;
  final Color statusTextColor;

  const BookingActivityCard({
    super.key,
    required this.title,
    required this.location,
    required this.image,
    required this.dateOrPrice,
    required this.statusText,
    required this.statusColor,
    required this.statusTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            children: [
              // صورة العقار
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: image.startsWith('http')
                    ? Image.network(
                        image,
                        width: 85.w,
                        height: 85.h,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        image,
                        width: 85.w,
                        height: 85.h,
                        fit: BoxFit.cover,
                      ),
              ),
              SizedBox(width: 14.w),
              // تفاصيل العقار
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Styles.textStyle16W600Inter.copyWith(
                        fontSize: 17.sp,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AssetsData.iconLocationOutlinedSvg,
                          width: 14.w,
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            location,
                            style: Styles.textStyle12W400Inter,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // تاريخ الحجز
                        Text(
                          dateOrPrice,
                          style: Styles.textStyle10W500Inter.copyWith(
                            fontSize: 13.sp,
                          ),
                        ),
                        // حالة الحجز
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            statusText,
                            style: Styles.textStyle14W400Inter.copyWith(
                              color: statusTextColor,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // خط فاصل تحت العقار بدلاً من المستطيل الخارجي
        const Divider(color: Color(0xFFE5E7EB), thickness: 1, height: 8),
      ],
    );
  }
}
