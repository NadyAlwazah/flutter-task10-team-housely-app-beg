import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class ReviewImageSection extends StatelessWidget {
  final String? imagePath;

  const ReviewImageSection({super.key, required this.imagePath});

  bool _isFilePath(String path) {
    return path.startsWith('/data/') ||
        path.startsWith('/storage/') ||
        path.startsWith('/var/');
  }

  @override
  Widget build(BuildContext context) {
    // لا يوجد صورة
    if (imagePath == null || imagePath!.isEmpty) {
      return const SizedBox.shrink();
    }

    final isFile = _isFilePath(imagePath!);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Attached Image', style: Styles.textStyle16W600Inter),
        SizedBox(height: 12.h),

        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: isFile
              ? Image.file(
                  File(imagePath!),
                  width: double.infinity,
                  height: 250.h,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  imagePath!,
                  width: double.infinity,
                  height: 250.h,
                  fit: BoxFit.cover,
                ),
        ),
      ],
    );
  }
}
