import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class PropertyLocationSection extends StatelessWidget {
  const PropertyLocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),

          child: Text(
            "Location & Public Facilities",
            style: Styles.textStyle16W600Inter,
          ),
        ),
        SizedBox(height: 16.h),

        // المرافق العامة
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFacilityItem(AssetsData.iconHospitalSvg, "Hospital"),
                SizedBox(width: 8.w),
                _buildFacilityItem(AssetsData.iconGasSvg, "Gas stations"),
                SizedBox(width: 8.w),
                _buildFacilityItem(AssetsData.iconBagSvg, "Mall"),
                SizedBox(width: 8.w),
                _buildFacilityItem(AssetsData.iconMosqueSvg, "Mosque"),
              ],
            ),
          ),
        ),

        SizedBox(height: 16.h),

        // الخريطة
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),

          child: _buildMapImage(AssetsData.imageMapPng),
        ),
      ],
    );
  }

  Widget _buildFacilityItem(String icon, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F5FF),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(icon, width: 18.r, height: 18.r),
          SizedBox(width: 4.w),
          Text(label, style: Styles.textStyle12W500Inter),
        ],
      ),
    );
  }

  Widget _buildMapImage(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Image.asset(image, width: 327.w, height: 142.h, fit: BoxFit.cover),
    );
  }
}
