import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/presentation/views/widgets/filter_checkbox_item.dart';

class FilterLookingForSection extends StatefulWidget {
  const FilterLookingForSection({super.key});

  @override
  State<FilterLookingForSection> createState() =>
      _FilterLookingForSectionState();
}

class _FilterLookingForSectionState extends State<FilterLookingForSection> {
  bool forRent = true;
  bool forSale = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Looking for", style: Styles.textStyle16W600Inter),

        SizedBox(height: 16.h),
        FilterCheckboxItem(
          title: "For Rent",
          value: forRent,
          onChanged: (val) => setState(() => forRent = val!),
        ),

        FilterCheckboxItem(
          title: "For Sale",
          value: forSale,
          onChanged: (val) => setState(() => forSale = val!),
        ),
      ],
    );
  }
}
