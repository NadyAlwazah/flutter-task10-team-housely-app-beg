import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';
import 'package:go_router/go_router.dart';

class PopularPropertyCard extends StatelessWidget {
  const PopularPropertyCard({
    super.key,
    this.onTapFavorite,
    required this.width,
    required this.height,
    this.padding,
    this.showIconFavorite = true,
    required this.propertyModel,
    this.margin,
  });
  final PropertyModel propertyModel;
  final VoidCallback? onTapFavorite;
  final double width;
  final double height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool showIconFavorite;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          AppRouter.kDetails,
          extra: {
            'property': propertyModel,
            'cubit': context.read<PropertyCubit>(),
          },
        );
      },
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.textSecondary, width: 0.5.w),
          ),
        ),
        child: Row(
          children: [
            Column(children: [_buildImage()]),
            SizedBox(width: 12.w),
            Expanded(child: _buildDetails()),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.r),
      child: Image.asset(
        propertyModel.image,
        width: 80.w,
        height: 62.h,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                propertyModel.title,
                style: Styles.textStyle14W700Inter,
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
                propertyModel.location,
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
            Text(
              "${propertyModel.pricePerMonth}/month",
              style: Styles.textStyle10W700Inter,
            ),
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
                    propertyModel.rating.toString(),
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
        propertyModel.isFavorite
            ? AssetsData.iconFavoriteRedSvg
            : AssetsData.iconFavoriteSvg,
        width: 20.r,
        height: 20.r,
        colorFilter: const ColorFilter.mode(AppColors.textRed, BlendMode.srcIn),
      ),
    );
  }
}
