import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';

class BookingPropertyCardSection extends StatelessWidget {
  final PropertyModel property;

  const BookingPropertyCardSection({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFD2D6DB)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              // استخدام network إذا كانت الصورة رابطاً، أو AssetImage إذا كانت محليّة حسب مصدرها لديك
              property.image,
              width: 70.w,
              height: 70.h,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                AssetsData.imageOnboard1png,
                width: 70.w,
                height: 70.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(property.title, style: Styles.textStyle16W600Inter),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      AssetsData.iconLocationOutlinedSvg,
                      width: 14.w,
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        property.location,
                        style: Styles.textStyle12W400Inter,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${property.pricePerMonth.toStringAsFixed(0)}/month',
                      style: Styles.textStyle14W600Inter,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        SizedBox(width: 2.w),
                        Text(
                          property.rating.toString(),
                          style: Styles.textStyle12W600Inter,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
