import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/data/manager/filter_cubit/filter_cubit.dart';

class FilterPriceRangeSection extends StatefulWidget {
  const FilterPriceRangeSection({super.key});

  @override
  State<FilterPriceRangeSection> createState() =>
      _FilterPriceRangeSectionState();
}

class _FilterPriceRangeSectionState extends State<FilterPriceRangeSection> {
  RangeValues rangeValues = const RangeValues(300, 1100);

  double get minPrice => rangeValues.start;
  double get maxPrice => rangeValues.end;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Price Range", style: Styles.textStyle16W600Inter),

        SizedBox(height: 12.h),

        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 2,
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 5,
              elevation: 0,
              pressedElevation: 0,
            ),
            overlayShape: SliderComponentShape.noOverlay,
            activeTrackColor: AppColors.primary,
            inactiveTrackColor: const Color(0xffD9D9D9),
            rangeThumbShape: const RoundRangeSliderThumbShape(
              enabledThumbRadius: 5,
              elevation: 0,
              pressedElevation: 0,
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            child: RangeSlider(
              values: rangeValues,
              min: 0,
              max: 1500,
              onChanged: (values) {
                setState(() {
                  rangeValues = values;
                  context.read<FilterCubit>().updatePrice(
                    values.start,
                    values.end,
                  );
                });
              },
            ),
          ),
        ),

        SizedBox(height: 8.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${rangeValues.start.toInt()}",
              style: Styles.textStyle12W500Inter.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            Text(
              "\$${rangeValues.end.toInt()}",
              style: Styles.textStyle12W500Inter.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
