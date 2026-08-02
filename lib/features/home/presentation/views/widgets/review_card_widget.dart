import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/review_model.dart';

class ReviewCardItem extends StatelessWidget {
  final ReviewModel review;

  const ReviewCardItem({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    // فصل صورة المستخدم عن الصورة المرفقة بالتعليق
    final imageParts = review.reviewerImage.split('|');
    final avatarPath = imageParts.first;
    final uploadedImagePath = imageParts.length > 1 ? imageParts[1] : null;

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // صورة المستخدم
              CircleAvatar(
                radius: 20.r,
                backgroundImage: avatarPath.startsWith('assets/')
                    ? AssetImage(avatarPath) as ImageProvider
                    : FileImage(File(avatarPath)),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.reviewerName,
                      style: Styles.textStyle14W600Inter,
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        SizedBox(width: 4.w),
                        Text(
                          review.rating.toString(),
                          style: Styles.textStyle12W400Inter,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),

          // نص التقييم
          Text(
            review.comment,
            style: Styles.textStyle12W400Inter.copyWith(color: Colors.black87),
          ),

          // عرض الصورة المرفقة بالتعليق إن وجدت أسفل التعليق باحترافية
          if (uploadedImagePath != null && File(uploadedImagePath).existsSync()) ...[
            SizedBox(height: 10.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.file(
                File(uploadedImagePath),
                width: double.infinity,
                height: 150.h,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ],
      ),
    );
  }
}