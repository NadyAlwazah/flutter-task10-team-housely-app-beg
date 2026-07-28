import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
class EmptyNotificationsViewBody extends StatelessWidget {
  const EmptyNotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 60.h, bottom: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SvgPicture.asset(
              AssetsData.iconMailBoxSvg,
            //  width: 274.w,
            //  height: 253.71.h,
            ),

            SizedBox(height: 32.h),

            Text(
              'No notification yet',
              textAlign: TextAlign.center,
              style: Styles.textStyle20W600Inter
            ),

            SizedBox(height: 16.h),

            Text(
              'All notification we send will appear here, so\n you can view them easly anytime.',
              textAlign: TextAlign.center,
              style:Styles.textStyle14W400Inter.copyWith(color: AppColors.textSecondary)
            ),
          ],
        ),
      ),
    );
  }
}