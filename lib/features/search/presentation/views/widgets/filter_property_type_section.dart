import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/presentation/views/widgets/filter_checkbox_item.dart';

class FilterPropertyTypeSection extends StatefulWidget {
  const FilterPropertyTypeSection({super.key});

  @override
  State<FilterPropertyTypeSection> createState() =>
      _FilterPropertyTypeSectionState();
}

class _FilterPropertyTypeSectionState extends State<FilterPropertyTypeSection> {
  bool apartment = true;
  bool penthouse = false;
  bool hotel = true;
  bool villa = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // العنوان
        Text("Property Type", style: Styles.textStyle16W600Inter),
        SizedBox(height: 16.h),

        FilterCheckboxItem(
          title: "Apartment",
          value: apartment,
          onChanged: (val) => setState(() => apartment = val!),
        ),

        FilterCheckboxItem(
          title: "Penthouse",
          value: penthouse,
          onChanged: (val) => setState(() => penthouse = val!),
        ),

        FilterCheckboxItem(
          title: "Hotel",
          value: hotel,
          onChanged: (val) => setState(() => hotel = val!),
        ),

        FilterCheckboxItem(
          title: "Villa",
          value: villa,
          onChanged: (val) => setState(() => villa = val!),
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
