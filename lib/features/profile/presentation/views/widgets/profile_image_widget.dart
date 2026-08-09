import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';

class ProfileImageWidget extends StatelessWidget {
  final VoidCallback? onCameraTap;
  final String profileImage;
  const ProfileImageWidget({
    super.key,
    this.onCameraTap,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    final bool isFileImage = profileImage.startsWith('/data');
    return Stack(
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundImage: isFileImage
              ? FileImage(File(profileImage))
              : AssetImage(profileImage) as ImageProvider,
        ),
        Positioned(
          bottom: 0,
          right: 6,
          child: GestureDetector(
            onTap: onCameraTap,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(6),
              child: SvgPicture.asset(AssetsData.iconCameraSvg),
            ),
          ),
        ),
      ],
    );
  }
}
