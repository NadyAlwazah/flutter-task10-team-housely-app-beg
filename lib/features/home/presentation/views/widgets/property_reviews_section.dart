import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';

class PropertyReviewsSection extends StatelessWidget {
  const PropertyReviewsSection({super.key, required this.property});

  final PropertyModel property;

  @override
  Widget build(BuildContext context) {
    final reviews = property.reviews;

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
                  child: _buildReviewCard(
                    image: review.reviewerImage,
                    name: review.reviewerName,
                    rating: review.rating,
                    comment: review.comment,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewCard({
    required String image,
    required String name,
    required double rating,
    required String comment,
  }) {
    return Container(
      width: 268.w,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: const Color(0xFFE5E5E5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40.r),
                child: Image.asset(image, width: 40.r, height: 40.r),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(name, style: Styles.textStyle14W600Inter),

                        RatingBarIndicator(
                          rating: rating,
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
                    Text(
                      comment,
                      style: Styles.textStyle12W400Inter.copyWith(height: 1.6),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
