import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/data/manager/filter_cubit/filter_cubit.dart';

class FilterBottomButtonsSection extends StatefulWidget {
  const FilterBottomButtonsSection({super.key});

  @override
  State<FilterBottomButtonsSection> createState() =>
      _FilterBottomButtonsSectionState();
}

class _FilterBottomButtonsSectionState
    extends State<FilterBottomButtonsSection> {
  bool isResetActive = false;
  bool isApplyActive = true;

  void _onResetPressed() {
    setState(() {
      isResetActive = true;
      isApplyActive = false;
    });

    context.read<FilterCubit>().reset();
  }

  void _onApplyPressed() {
    setState(() {
      isApplyActive = true;
      isResetActive = false;
    });

    context.read<FilterCubit>().applyFilters();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Reset Button
        ElevatedButton(
          onPressed: _onResetPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: isResetActive ? AppColors.primary : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 55.w, vertical: 12.5.h),
            elevation: 0,
          ),
          child: Text(
            "Reset",
            style: Styles.textStyle18W600Inter.copyWith(
              color: isResetActive ? Colors.white : AppColors.textSecondary,
            ),
          ),
        ),

        // Apply Button
        ElevatedButton(
          onPressed: _onApplyPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: isApplyActive ? AppColors.primary : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 55.w, vertical: 12.5.h),
            elevation: 0,
          ),
          child: Text(
            "Apply",
            style: Styles.textStyle18W600Inter.copyWith(
              color: isApplyActive ? Colors.white : AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
