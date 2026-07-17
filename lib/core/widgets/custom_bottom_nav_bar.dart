import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86.h,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(icon: Icons.home_filled, label: 'Home', index: 0),
          _buildNavItem(
            isSvg: true,
            path: AssetsData.iconExploreSvg,
            label: 'Explore',
            index: 1,
          ),
          _buildNavItem(
            isSvg: true,
            path: AssetsData.iconFavoriteSvg,
            label: 'Favorite',
            index: 2,
          ),
          _buildNavItem(
            isSvg: true,
            path: AssetsData.iconDocumentSvg,
            label: 'My Booking',
            index: 3,
          ),
          _buildNavItem(
            icon: Icons.person_outline_rounded,
            label: 'Profile',
            index: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    bool isSvg = false,
    String? path,
    IconData? icon,
    required String label,
    required int index,
  }) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // الخط فوق العنصر المختار
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 3.h,
            width: 28.w,
            color: isSelected ? AppColors.primary : Colors.transparent,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: isSvg
                ? SvgPicture.asset(path!)
                : Icon(
                    icon,
                    size: 24.r,
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.textSecondary,
                  ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
