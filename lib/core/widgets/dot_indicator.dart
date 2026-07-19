import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';

class DotIndicator extends StatelessWidget {
  final bool isActive;
  const DotIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 10,
      width: isActive ? 28 : 10,
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.primary
            : AppColors.textSecondary.withOpacity(0.5),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
