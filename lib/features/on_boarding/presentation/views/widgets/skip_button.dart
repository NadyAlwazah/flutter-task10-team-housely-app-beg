import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onPressed;
  const SkipButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColors.textSecondary.withOpacity(0.3)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      ),
      child: Text(
        "Skip",
        style: Styles.textStyle14W400Inter.copyWith(
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
