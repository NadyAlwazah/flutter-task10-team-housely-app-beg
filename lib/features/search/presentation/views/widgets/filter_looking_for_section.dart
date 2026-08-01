import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_check_box.dart';

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

        _buildCheckboxItem(
          title: "For Rent",
          value: forRent,
          onChanged: (val) => setState(() => forRent = val!),
        ),

        _buildCheckboxItem(
          title: "For Sale",
          value: forSale,
          onChanged: (val) => setState(() => forSale = val!),
        ),
      ],
    );
  }

  Widget _buildCheckboxItem({
    required String title,
    required bool value,
    required ValueChanged<bool?> onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Styles.textStyle12W500Inter),

          CustomCheckBox(
            value: value,
            onChanged: onChanged,
            sizeContainer: 21,
            sizeIcon: 18,
          ),
        ],
      ),
    );
  }
}
