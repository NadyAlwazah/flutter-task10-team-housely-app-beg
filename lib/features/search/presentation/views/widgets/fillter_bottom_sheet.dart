import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/presentation/views/widgets/filter_looking_for_section.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/presentation/views/widgets/filter_price_range_section.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/presentation/views/widgets/filter_property_type_section.dart';

class FillterBottomSheet extends StatelessWidget {
  const FillterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 762.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40.r)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: 39.h),
            Center(child: Text("Fillter", style: Styles.textStyle16W600Inter)),

            SizedBox(height: 16.h),

            const FilterLookingForSection(),

            SizedBox(height: 24.h),

            const FilterPropertyTypeSection(),

            SizedBox(height: 24.h),

            const FilterPriceRangeSection(),
          ],
        ),
      ),
    );
  }
}
