import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/review_model.dart';

class ReviewHeaderSection extends StatelessWidget {
  final ReviewModel review;

  const ReviewHeaderSection({super.key, required this.review});

  bool _isFilePath(String path) {
    return path.startsWith('/data/') ||
        path.startsWith('/storage/') ||
        path.startsWith('/var/');
  }

  @override
  Widget build(BuildContext context) {
    final reviewerImageIsFile = _isFilePath(review.reviewerImage);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Reviewer Info
        Row(
          children: [
            CircleAvatar(
              radius: 28.r,
              backgroundImage: reviewerImageIsFile
                  ? FileImage(File(review.reviewerImage))
                  : AssetImage(review.reviewerImage),
            ),

            SizedBox(width: 12.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(review.reviewerName, style: Styles.textStyle16W600Inter),

                  SizedBox(height: 4.h),

                  Text(
                    review.reviewerEmail,
                    style: Styles.textStyle12W400Inter.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 24.h),

        // Rating
        Row(
          children: [
            Text(review.rating.toString(), style: Styles.textStyle16W600Inter),

            SizedBox(width: 6.w),

            const Icon(Icons.star, color: Colors.amber, size: 20),
          ],
        ),
      ],
    );
  }
}
