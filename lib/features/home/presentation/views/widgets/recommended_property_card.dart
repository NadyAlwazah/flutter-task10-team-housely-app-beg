import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecommendedPropertyCard extends StatelessWidget {
  const RecommendedPropertyCard({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    required this.price,
    this.isFavorite = false,
    this.onTapFavorite,
  });

  final String image;
  final String title;
  final String location;
  final String price;
  final bool isFavorite;
  final VoidCallback? onTapFavorite;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildPropertyImage(),
        _buildPriceTag(),
        _buildBottomDetails(),
      ],
    );
  }

  // صورة العقار
  Widget _buildPropertyImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Image.asset(image, height: 164.h, width: 224.w, fit: BoxFit.cover),
    );
  }

  //  السعر أعلى الصورة
  Widget _buildPriceTag() {
    return Positioned(
      top: 16,
      right: 16,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: price,
                style: Styles.textStyle12W600Inter.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
              TextSpan(text: "/month", style: Styles.textStyle10W400Inter),
            ],
          ),
        ),
      ),
    );
  }

  // التفاصيل + زر المفضلة أسفل الصورة
  Widget _buildBottomDetails() {
    return Positioned(
      bottom: 24.h,
      left: 16.w,
      right: 16.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: _buildTitleAndLocation()),
          _buildFavoriteButton(),
        ],
      ),
    );
  }

  // العنوان + الموقع
  Widget _buildTitleAndLocation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles.textStyle14W600Inter.copyWith(color: Colors.white),
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            SvgPicture.asset(
              AssetsData.iconLocationOutlinedSvg,
              width: 14.r,
              height: 14.r,
              colorFilter: const ColorFilter.mode(
                AppColors.textSecondary,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              location,
              style: Styles.textStyle12W400Inter.copyWith(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  // زر المفضلة
  Widget _buildFavoriteButton() {
    return GestureDetector(
      onTap: onTapFavorite,
      child: Container(
        width: 24.w,
        height: 24.h,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SvgPicture.asset(
            isFavorite
                ? AssetsData.iconFavoriteRedSvg
                : AssetsData.iconFavoriteSvg,
            width: 16.r,
            height: 16.r,
          ),
        ),
      ),
    );
  }
}
