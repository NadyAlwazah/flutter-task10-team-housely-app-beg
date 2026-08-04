import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'dashed_box.dart';

class UploadMediaSection extends StatelessWidget {
  final String? selectedImagePath;
  final VoidCallback onTapUpload;

  const UploadMediaSection({
    super.key,
    this.selectedImagePath,
    required this.onTapUpload,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add Photo or Video',
          style: Styles.textStyle16W600Inter,
        ),
        SizedBox(height: 16.h),
        GestureDetector(
          onTap: onTapUpload,
          child: DashedBox(
            width: double.infinity,
            height: 140.h,
            borderRadius: 12.r,
            borderWidth: 1,
            color: AppColors.greyDeleteContainer,
            child: selectedImagePath == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AssetsData.iconCloudSvg,
                        width: 48.r,
                        height: 48.r,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Click here to upload',
                        textAlign: TextAlign.center,
                        style: Styles.textStyle12W400Inter.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: _buildSelectedImage(selectedImagePath!),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildSelectedImage(String path) {
    if (path.startsWith('assets/') || path.contains('assets')) {
      return Image.asset(
        path,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    } else {
      return Image.file(
        File(path),
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }
  }
}