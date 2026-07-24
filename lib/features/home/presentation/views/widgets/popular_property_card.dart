import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';

class PopularPropertyCard extends StatelessWidget {
  const PopularPropertyCard({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
    this.isFavorite = false,
    this.onTapFavorite,
    required this.width,
    required this.height,
    this.padding,
    this.showIconFavorite = true,
  });

  final String image;
  final String title;
  final String location;
  final String price;
  final double rating;
  final bool isFavorite;
  final VoidCallback? onTapFavorite;

  final double width;
  final double height;
  final EdgeInsetsGeometry? padding;
  final bool showIconFavorite;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      child: Row(
        children: [
          _buildImage(),
          SizedBox(width: 12.w),
          Expanded(child: _buildDetails()),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.r),
      child: Image.asset(image, width: 80.w, height: 62.h, fit: BoxFit.cover),
    );
  }

  Widget _buildDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 3.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: Styles.textStyle14W600Inter,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (showIconFavorite) _buildFavoriteButton(),
          ],
        ),
        SizedBox(height: 2.h),
        Row(
          children: [
            SvgPicture.asset(
              AssetsData.iconLocationOutlinedSvg,
              width: 16.r,
              height: 16.r,
              colorFilter: const ColorFilter.mode(
                AppColors.textSecondary,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: Text(
                location,
                style: Styles.textStyle12W400Inter.copyWith(
                  color: AppColors.textSecondary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            Text("$price/month", style: Styles.textStyle10W600Inter),
            const Spacer(),
            Container(
              width: 47.w,
              height: 26.h,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),

              decoration: BoxDecoration(
                color: const Color(0xFFFFFAEB),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AssetsData.iconStarSvg,
                    width: 12.r,
                    height: 12.r,
                  ),
                  Text(
                    rating.toString(),
                    style: Styles.textStyle10W700Inter.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFavoriteButton() {
    return GestureDetector(
      onTap: onTapFavorite,
      child: SvgPicture.asset(
        isFavorite ? AssetsData.iconFavoriteRedSvg : AssetsData.iconFavoriteSvg,
        width: 20.r,
        height: 20.r,
        colorFilter: const ColorFilter.mode(Color(0xFFF97066), BlendMode.srcIn),
      ),
    );
  }
}
