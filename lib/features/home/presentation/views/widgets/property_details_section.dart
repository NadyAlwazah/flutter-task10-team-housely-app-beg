import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/property_description.dart';

class PropertyDetailsSection extends StatelessWidget {
  const PropertyDetailsSection({super.key, required this.property});

  final PropertyModel property;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // اسم العقار والسعر
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  property.title,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle20W600Inter,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '\$${property.pricePerMonth}',
                      style: Styles.textStyle14W700Inter.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    TextSpan(
                      text: '/month',
                      style: Styles.textStyle12W400Inter,
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 4.h),

          // الموقع
          Row(
            children: [
              SvgPicture.asset(
                AssetsData.iconLocationOutlinedSvg,
                width: 24.r,
                height: 24.r,
                colorFilter: const ColorFilter.mode(
                  AppColors.textSecondary,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  property.location,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle14W400Inter,
                ),
              ),
            ],
          ),

          SizedBox(height: 24.h),

          // تفاصيل العقار
          Text("Property Details", style: Styles.textStyle16W600Inter),
          SizedBox(height: 16.h),

          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 2.0,
            children: [
              _buildDetailItem(
                icon: AssetsData.iconBedSvg,
                label: "Bedrooms",
                value: "${property.bedrooms}",
              ),
              _buildDetailItem(
                icon: AssetsData.iconBathubSvg,
                label: "Bathtub",
                value: "${property.bathrooms}",
              ),
              _buildDetailItem(
                icon: AssetsData.iconAreaSvg,
                label: "Area",
                value: "${property.area} sqft",
              ),
              _buildDetailItem(label: "Build", value: "${property.buildYear}"),
              _buildDetailItem(
                label: "Parking",
                value: "${property.parking} Indoor",
              ),
              _buildDetailItem(label: "Status", value: property.status),
            ],
          ),
          SizedBox(height: 24.h),

          // الوصف
          PropertyDescription(text: property.description),
        ],
      ),
    );
  }

  Widget _buildDetailItem({
    String? icon,
    required String label,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Styles.textStyle12W400Inter),
        SizedBox(height: 4.h),
        Row(
          children: [
            if (icon != null) ...[
              SvgPicture.asset(icon, width: 18.r, height: 18.r),
              SizedBox(width: 4.h),
            ],
            Text(value, style: Styles.textStyle12W600Inter),
          ],
        ),
      ],
    );
  }
}
