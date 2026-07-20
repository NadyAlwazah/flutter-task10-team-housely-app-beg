import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';

class ProfileImageWidget extends StatelessWidget {
  final VoidCallback? onCameraTap;

  const ProfileImageWidget({super.key, this.onCameraTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(AssetsData.imageProfilePng),
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
