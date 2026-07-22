import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AssetsData.imageBannerPng),

        // النصوص
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "GET YOUR 20%",
                style: Styles.textStyle16W600Inter.copyWith(
                  color: Colors.white,
                ),
              ),
              Text(
                "CASHBACK",
                style: Styles.textStyle16W600Inter.copyWith(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "*Expired 25 Aug 2022",
                style: Styles.textStyle12W400Inter.copyWith(
                  color: const Color(0xFFE5E7EB),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
