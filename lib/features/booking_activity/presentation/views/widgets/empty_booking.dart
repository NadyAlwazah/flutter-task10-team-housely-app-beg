import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class EmptyBookingWidget extends StatelessWidget {
  const EmptyBookingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //  الصورة التوضيحية الخاصة بالـ Oops
            SizedBox(height: 60.h),
            Image.asset(
              AssetsData.imageMybookingoppsPng,
              height: 220.h,
              fit: BoxFit.contain,
            ),

            SizedBox(height: 36.h),

            //  النص الرئيسي
            Text(
              'You have no upcoming booking',
              style: Styles.textStyle20W600Inter.copyWith(
                color: AppColors.textPrimary,
                fontSize: 22.sp,
              ),
            ),
            SizedBox(height: 12.h),

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ' are you looking for a  ',
                      style: Styles.textStyle14W400Inter.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'completed',
                        style: Styles.textStyle14W400Inter.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    Text(
                      ' or ',
                      style: Styles.textStyle14W400Inter.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'cancelled',
                        style: Styles.textStyle14W400Inter.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  ' booking ?',
                  style: Styles.textStyle14W400Inter.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
