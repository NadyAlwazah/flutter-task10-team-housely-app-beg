import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/data/manager/filter_cubit/filter_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/presentation/views/widgets/filter_checkbox_item.dart';

class FilterPropertyTypeSection extends StatefulWidget {
  const FilterPropertyTypeSection({super.key});

  @override
  State<FilterPropertyTypeSection> createState() =>
      _FilterPropertyTypeSectionState();
}

class _FilterPropertyTypeSectionState extends State<FilterPropertyTypeSection> {
  List<String> propertyTypes = [];

  void _toggle(String value, bool isSelected) {
    setState(() {
      if (isSelected) {
        propertyTypes.add(value);
      } else {
        propertyTypes.remove(value);
      }
    });

    // FilterCubit نرسل التغيير إلى
    context.read<FilterCubit>().togglePropertyType(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Property Type", style: Styles.textStyle16W600Inter),
        SizedBox(height: 16.h),

        FilterCheckboxItem(
          title: "Apartment",
          value: propertyTypes.contains("Apartment"),
          onChanged: (val) => _toggle("Apartment", val!),
        ),

        FilterCheckboxItem(
          title: "Penthouse",
          value: propertyTypes.contains("Penthouse"),
          onChanged: (val) => _toggle("Penthouse", val!),
        ),

        FilterCheckboxItem(
          title: "Hotel",
          value: propertyTypes.contains("Hotel"),
          onChanged: (val) => _toggle("Hotel", val!),
        ),

        FilterCheckboxItem(
          title: "Villa",
          value: propertyTypes.contains("Villa"),
          onChanged: (val) => _toggle("Villa", val!),
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
