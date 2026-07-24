import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class TopLocationItem extends StatelessWidget {
  const TopLocationItem({
    super.key,
    required this.image,
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

  final String image;
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 4.w, right: 8.w, top: 4.h, bottom: 4.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : const Color(0xFFF9F5FF),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: const Color(0xFFD2D6DB)),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset(
                image,
                width: 36.r,
                height: 36.r,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              name,
              style: Styles.textStyle12W600Inter.copyWith(
                color: isSelected
                    ? const Color(0xFFF9F5FF)
                    : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
