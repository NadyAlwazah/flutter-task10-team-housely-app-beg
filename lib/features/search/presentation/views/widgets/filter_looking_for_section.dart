import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/data/manager/filter_cubit/filter_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/presentation/views/widgets/filter_checkbox_item.dart';

class FilterLookingForSection extends StatelessWidget {
  const FilterLookingForSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<FilterCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Looking for", style: Styles.textStyle16W600Inter),

        SizedBox(height: 16.h),

        FilterCheckboxItem(
          title: "For Rent",
          value: cubit.lookingFor.contains("For Rent"),
          onChanged: (value) {
            context.read<FilterCubit>().toggleLookingFor("For Rent");
          },
        ),

        FilterCheckboxItem(
          title: "For Sale",
          value: cubit.lookingFor.contains("For Sale"),
          onChanged: (value) {
            context.read<FilterCubit>().toggleLookingFor("For Sale");
          },
        ),
      ],
    );
  }
}
