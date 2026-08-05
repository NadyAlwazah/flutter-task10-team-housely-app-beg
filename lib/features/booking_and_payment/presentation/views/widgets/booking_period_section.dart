import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class BookingPeriodSection extends StatelessWidget {
  final String selectedDate;
  final VoidCallback onTap;

  const BookingPeriodSection({
    super.key,
    required this.selectedDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // 1أيقونة الروزنامة
              //
              Container(
                width: 36.w,
                height: 36.h,
                decoration: BoxDecoration(
                  color: AppColors.primary200.withOpacity(0.1), // لون فاتح
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AssetsData.iconCalendarSvg,
                    width: 18.w,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date',
                    style: Styles.textStyle12W400Inter.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    selectedDate,
                    style: Styles.textStyle14W600Inter.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 15.5.r,
                color: AppColors.textSecondary,
              ),
            ],
          ),
          SizedBox(height: 5.h),
          const Divider(color: AppColors.lightGrayBackground, thickness: 1),
          SizedBox(height: 5.h),
          Text(
            'Make sure to check your date before making any\n  sort of payments',
            style: Styles.textStyle12W400Inter.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
