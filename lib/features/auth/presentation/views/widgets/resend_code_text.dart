import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class ResendCodeText extends StatelessWidget {
  const ResendCodeText({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t receive code?",
          style: Styles.textStyle14W400Inter.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 4.h),
        GestureDetector(
          onTap: onTap,
          child: Text(
            "Resend code",
            style: Styles.textStyle14W400Inter.copyWith(
              color: const Color(0xFFF97066),
            ),
          ),
        ),
      ],
    );
  }
}
