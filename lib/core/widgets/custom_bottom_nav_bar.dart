import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';

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
      padding: const EdgeInsets.only(bottom: 24, left: 40, right: 40),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(Icons.home_filled, 'Home', 0),
          _buildNavItem(Icons.explore_outlined, 'Explore', 1),
          _buildNavItem(Icons.favorite, 'Favorite', 2),
          _buildNavItem(Icons.receipt_long_outlined, 'My Booking', 3),
          _buildNavItem(Icons.person, 'Profile', 4),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
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
            child: Icon(
              icon,
              size: 24.r,
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
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
