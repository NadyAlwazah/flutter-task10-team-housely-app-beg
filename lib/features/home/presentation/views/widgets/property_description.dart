import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:readmore/readmore.dart';

class PropertyDescription extends StatelessWidget {
  const PropertyDescription({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Description", style: Styles.textStyle16W600Inter),

        SizedBox(height: 16.h),

        ReadMoreText(
          text,
          trimLines: 3,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Read more',
          trimExpandedText: 'Read less',
          style: Styles.textStyle12W400Inter.copyWith(height: 1.8),
          moreStyle: Styles.textStyle12W500Inter.copyWith(
            color: AppColors.primary,
          ),
          lessStyle: Styles.textStyle12W500Inter.copyWith(
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
