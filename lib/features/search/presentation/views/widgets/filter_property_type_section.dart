import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/data/manager/filter_cubit/filter_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/presentation/views/widgets/filter_checkbox_item.dart';

class FilterPropertyTypeSection extends StatelessWidget {
  const FilterPropertyTypeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<FilterCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Property Type", style: Styles.textStyle16W600Inter),

        SizedBox(height: 16.h),

        FilterCheckboxItem(
          title: "Apartment",
          value: cubit.propertyTypes.contains("Apartment"),
          onChanged: (_) {
            context.read<FilterCubit>().togglePropertyType("Apartment");
          },
        ),

        FilterCheckboxItem(
          title: "Penthouse",
          value: cubit.propertyTypes.contains("Penthouse"),
          onChanged: (_) {
            context.read<FilterCubit>().togglePropertyType("Penthouse");
          },
        ),

        FilterCheckboxItem(
          title: "Hotel",
          value: cubit.propertyTypes.contains("Hotel"),
          onChanged: (_) {
            context.read<FilterCubit>().togglePropertyType("Hotel");
          },
        ),

        FilterCheckboxItem(
          title: "Villa",
          value: cubit.propertyTypes.contains("Villa"),
          onChanged: (_) {
            context.read<FilterCubit>().togglePropertyType("Villa");
          },
        ),

        SizedBox(height: 4.h),

        GestureDetector(
          onTap: () {},
          child: Text(
            "Show all",
            style: Styles.textStyle12W600Inter.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
