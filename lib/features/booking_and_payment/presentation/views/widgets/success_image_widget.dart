import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';

class SuccessImageWidget extends StatelessWidget {
  const SuccessImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 208.w,
      height: 208.h,
      decoration: BoxDecoration(
        color: AppColors.Secondary.withOpacity(
          0.25,
        ), // لون الخلفية الدائرية الفاتح
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: SvgPicture.asset(
            AssetsData.iconReservesuccessSvg,
            height: 127.h,
            width: 124.w,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
