import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/data/manager/filter_cubit/filter_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterFacilitiesSection extends StatefulWidget {
  const FilterFacilitiesSection({super.key});

  @override
  State<FilterFacilitiesSection> createState() =>
      _FilterFacilitiesSectionState();
}

class _FilterFacilitiesSectionState extends State<FilterFacilitiesSection> {
  List<String> facilities = ["Bed room"];

  void _toggle(String value) {
    setState(() {
      if (facilities.contains(value)) {
        facilities.remove(value);
      } else {
        facilities.add(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
              isSelected: facilities.contains("Bed room"),
              onTap: () {
                _toggle("Bed room");

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
              isSelected: facilities.contains("Bathtub"),

              onTap: () {
                _toggle("Bathtub");
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
              isSelected: facilities.contains("AC"),
              onTap: () {
                _toggle("AC");
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
              isSelected: facilities.contains("WIFI"),
              onTap: () {
                _toggle("WIFI");
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
          color: isSelected ? const Color(0xFFE9D7FE) : Colors.white,
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
