import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/data/manager/filter_cubit/filter_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/presentation/views/widgets/filter_checkbox_item.dart';

class FilterLookingForSection extends StatefulWidget {
  const FilterLookingForSection({super.key});

  @override
  State<FilterLookingForSection> createState() =>
      _FilterLookingForSectionState();
}

class _FilterLookingForSectionState extends State<FilterLookingForSection> {
  List<String> lookingFor = [];

  void _toggle(String value, bool isSelected) {
    setState(() {
      if (isSelected) {
        lookingFor.add(value);
      } else {
        lookingFor.remove(value);
      }
    });

    //  FilterCubit  نرسل التغيير إلى
    context.read<FilterCubit>().toggleLookingFor(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Looking for", style: Styles.textStyle16W600Inter),
        SizedBox(height: 16.h),

        FilterCheckboxItem(
          title: "For Rent",
          value: lookingFor.contains("For Rent"),
          onChanged: (val) => _toggle("For Rent", val!),
        ),

        FilterCheckboxItem(
          title: "For Sale",
          value: lookingFor.contains("For Sale"),
          onChanged: (val) => _toggle("For Sale", val!),
        ),
      ],
    );
  }
}
