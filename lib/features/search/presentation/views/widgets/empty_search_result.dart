import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class EmptySearchResult extends StatelessWidget {
  const EmptySearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AssetsData.imageSearchResultPng,
          width: 215.w,
          height: 119.h,
        ),
        SizedBox(height: 24.h),
        Text("Search not found", style: Styles.textStyle20W600Inter),
        SizedBox(height: 16.h),
        Text(
          "Please enable your location services for more optimal result",
          textAlign: TextAlign.center,
          style: Styles.textStyle14W400Inter,
        ),
      ],
    );
  }
}
