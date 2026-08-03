import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';

class CustomCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double sizeContainer;
  final double sizeIcon;

  const CustomCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
    this.sizeContainer = 16,
    this.sizeIcon = 14,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Container(
        width: sizeContainer.r,
        height: sizeContainer.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(width: 1, color: const Color(0xFFC4C3CB)),
          color: value ? AppColors.primary : Colors.transparent,
        ),
        child: Center(
          child: value
              ? SvgPicture.asset(
                  AssetsData.iconCheckSvg,
                  color: Colors.white,
                  width: sizeIcon.r,
                  height: sizeIcon.r,
                )
              : null,
        ),
      ),
    );
  }
}
