import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class EmptyBookingWidget extends StatelessWidget {
  //  إضافة متغير لتحديد نوع التبويب (قيمته الافتراضية 'upcoming')
  final String tabType;

  const EmptyBookingWidget({super.key, this.tabType = 'upcoming'});

  @override
  Widget build(BuildContext context) {
    // 1. تحديد النصوص ديناميكياً بناءً على نوع التبويب
    String mainText;
    String firstOption;
    String secondOption;

    if (tabType == 'completed') {
      mainText = 'You have no completed booking';
      firstOption = 'upcoming';
      secondOption = 'cancelled';
    } else if (tabType == 'cancelled') {
      mainText = 'You have no cancelled booking';
      firstOption = 'upcoming';
      secondOption = 'completed';
    } else {
      mainText = 'You have no upcoming booking';
      firstOption = 'completed';
      secondOption = 'cancelled';
    }

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 60.h),
            Image.asset(
              AssetsData.imageMybookingoppsPng,
              height: 220.h,
              fit: BoxFit.contain,
            ),

            SizedBox(height: 36.h),

            // النص الرئيسي المتغير
            Text(mainText, style: Styles.textStyle20W600Inter),
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
                        firstOption, //  الخيار الأول المتغير
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
                        secondOption, //  الخيار الثاني المتغير
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
