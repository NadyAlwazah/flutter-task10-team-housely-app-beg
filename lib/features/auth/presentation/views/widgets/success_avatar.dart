import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';

class SuccessAvatar extends StatelessWidget {
  const SuccessAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 208.r,
        height: 208.r,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFF4EBFF),
        ),
        child: Center(
          child: Container(
            width: 174.r,
            height: 174.r,
            decoration: const BoxDecoration(
              color: AppColors.backgroundColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.backgroundColor,

                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 24),
                      blurRadius: 48,
                      spreadRadius: -12,
                    ),
                  ],
                ),
                child: SvgPicture.asset(
                  AssetsData.iconShieldDoneSvg,
                  width: 132.r,
                  height: 132.r,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
