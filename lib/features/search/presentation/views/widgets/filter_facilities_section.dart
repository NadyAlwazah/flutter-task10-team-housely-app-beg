import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/data/manager/filter_cubit/filter_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterFacilitiesSection extends StatelessWidget {
  const FilterFacilitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<FilterCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Facilities", style: Styles.textStyle16W600Inter),

        SizedBox(height: 16.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildFacilityItem(
              icon: const Icon(Icons.bed_outlined, color: AppColors.primary),
              title: "Bed room",
              isSelected: cubit.facilities.contains("Bed room"),
              onTap: () {
                context.read<FilterCubit>().toggleFacility("Bed room");
              },
            ),

            _buildFacilityItem(
              icon: SvgPicture.asset(
                AssetsData.iconBathubSvg,
                width: 20.r,
                height: 20.r,
              ),
              title: "Bathtub",
              isSelected: cubit.facilities.contains("Bathtub"),
              onTap: () {
                context.read<FilterCubit>().toggleFacility("Bathtub");
              },
            ),

            _buildFacilityItem(
              icon: SvgPicture.asset(
                AssetsData.iconAcSvg,
                width: 21.r,
                height: 21.r,
              ),
              title: "AC",
              isSelected: cubit.facilities.contains("AC"),
              onTap: () {
                context.read<FilterCubit>().toggleFacility("AC");
              },
            ),

            _buildFacilityItem(
              icon: FaIcon(
                FontAwesomeIcons.wifi,
                color: AppColors.primary,
                size: 18.r,
              ),
              title: "WIFI",
              isSelected: cubit.facilities.contains("WIFI"),
              onTap: () {
                context.read<FilterCubit>().toggleFacility("WIFI");
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFacilityItem({
    required Widget icon,
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 76.w,
        height: 64.h,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary200 : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.primary, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,

            SizedBox(height: 4.h),

            Text(
              title,
              style: Styles.textStyle12W500Inter.copyWith(
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
