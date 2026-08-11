import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_state.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/review_model.dart';
import 'package:go_router/go_router.dart';

class PropertyReviewsSection extends StatelessWidget {
  const PropertyReviewsSection({super.key, required this.property});

  final PropertyModel property;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyCubit, PropertyState>(
      builder: (context, state) {
        final updateProperty = [
          ...state.recommended,
          ...state.popular,
          ...state.nearbyProperties,
        ].firstWhere((e) => e.id == property.id);

        final reviews = updateProperty.reviews;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Reviews ${reviews.length}",
                    style: Styles.textStyle16W600Inter,
                  ),
                  Text(
                    "See all",
                    style: Styles.textStyle12W500Inter.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // بطاقات المراجعات
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: reviews.map((review) {
                    return Padding(
                      padding: EdgeInsets.only(right: 12.w),
                      child: GestureDetector(
                        onTap: () {
                          context.push(AppRouter.kReviewDetails, extra: review);
                        },
                        child: _buildReviewCard(review: review),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildReviewCard({required ReviewModel review}) {
    final bool isFileImage = review.reviewerImage.startsWith('/data');

    return Container(
      width: 268.w,
      height: 104.h,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: const Color(0xFFE5E5E5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: isFileImage
                ? FileImage(File(review.reviewerImage))
                : AssetImage(review.reviewerImage) as ImageProvider,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        review.reviewerName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle14W600Inter,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    RatingBarIndicator(
                      rating: review.rating,
                      itemBuilder: (context, index) =>
                          SvgPicture.asset(AssetsData.iconStarSvg),
                      itemCount: 5,
                      itemSize: 14.r,
                      unratedColor: const Color(0xFFE0E0E0),
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Flexible(
                  child: Text(
                    review.comment,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle12W400Inter,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
