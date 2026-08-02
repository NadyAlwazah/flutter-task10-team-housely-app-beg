import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';

class PropertyInfoCard extends StatelessWidget {
  final PropertyModel? property;

  const PropertyInfoCard({
    super.key,
    this.property,
  });

  @override
  Widget build(BuildContext context) {

    final String title = property?.title ?? 'Tropis Homestay';
    final String location = property?.location ?? 'Benhil, Jl. Bendungan Hilir Karet Tengsin,...';
    final String subText = property != null 
        ? '\$${property!.pricePerMonth.toStringAsFixed(0)} / month'
        : '08 Aug - 12 Aug';
    final String? imageUrl = property?.image;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: _buildPropertyImage(imageUrl),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Styles.textStyle16W600Inter.copyWith(
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16.r,
                        color: AppColors.textchatSecondary,
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Text(
                          location,
                          style: Styles.textStyle10W400Inter.copyWith(
                            color: AppColors.textSecondary
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 9.h),
                  Text(
                    subText,
                    style:Styles.textStyle12W500Inter.copyWith(fontSize: 10,color: AppColors.textSecondary)
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        const Divider(
          thickness: 0.5,
          height: 0.5,
          color: AppColors.vectorColor,
        ),
      ],
    );
  }


  Widget _buildPropertyImage(String? imageUrl) {
    if (imageUrl != null && imageUrl.isNotEmpty) {

      if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
        return Image.network(
          imageUrl,
          width: 80.w,
          height: 62.h,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _buildPlaceholderImage(),
        );
      } else {

        return Image.asset(
          imageUrl,
          width: 80.w,
          height: 62.h,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _buildPlaceholderImage(),
        );
      }
    }

    return _buildPlaceholderImage();
  }

  Widget _buildPlaceholderImage() {
    return Image.asset(
      AssetsData.addReviewCardJpg,
      width: 80.w,
      height: 62.h,
      fit: BoxFit.cover,
    );
  }
}