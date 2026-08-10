import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/review_model.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/review_header_section.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/review_image_section.dart';

class ReviewDetailsViewBody extends StatelessWidget {
  const ReviewDetailsViewBody({super.key, required this.review});
  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User information
          ReviewHeaderSection(review: review),

          SizedBox(height: 24.h),

          // Review
          Text('Review', style: Styles.textStyle16W600Inter),

          SizedBox(height: 8.h),

          Text(
            review.comment,
            style: Styles.textStyle14W400Inter.copyWith(height: 1.6),
          ),

          // Review image
          SizedBox(height: 24.h),

          ReviewImageSection(imagePath: review.reviewImage),
        ],
      ),
    );
  }
}
