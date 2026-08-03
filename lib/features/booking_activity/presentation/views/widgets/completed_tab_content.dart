import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:go_router/go_router.dart';
import 'booking_activity_card.dart';

class CompletedTabContent extends StatelessWidget {
  const CompletedTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة العقارات المكتملة
    final List<Map<String, dynamic>> completedBookings = [
      {
        'title': 'Takatea Homestay',
        'location': 'Benhil, Jl. Bendungan Hilir Karet Tengsin,...',
        'image': AssetsData.imageRecommendedImage2Png,
        'date': '08 Aug - 12 Aug',
        'status': 'Completed',
      },
    ];
    if (completedBookings.isEmpty) {
      // الحالة الفارغة مع صورة Oops!
      return SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Column(
          children: [
            SizedBox(height: 60.h),
            Image.asset(
              AssetsData.imageMybookingoppsPng,
              height: 220.h,
              fit: BoxFit.contain,
            ),

            SizedBox(height: 36.h),

            //  النص الرئيسي
            Text(
              'You have no completed booking',
              style: Styles.textStyle20W600Inter.copyWith(
                color: AppColors.textPrimary,
                fontSize: 22.sp,
              ),
            ),
            SizedBox(height: 12.h),

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ' are you looking for a  ',
                      style: Styles.textStyle14W400Inter.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'upcoming',
                        style: Styles.textStyle14W400Inter.copyWith(
                          color: AppColors.primary, // لون بنفسجي
                        ),
                      ),
                    ),
                    Text(
                      ' or ',
                      style: Styles.textStyle14W400Inter.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'cancelled',
                        style: Styles.textStyle14W400Inter.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  ' booking ?',
                  style: Styles.textStyle14W400Inter.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      itemCount: completedBookings.length,
      itemBuilder: (context, index) {
        final item = completedBookings[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // كارت العقار
            BookingActivityCard(
              title: item['title'],
              location: item['location'],
              image: item['image'],
              dateOrPrice: item['date'],
              statusText: item['status'],
              statusColor: const Color(0xFFD1FADF),
              statusTextColor: const Color(0xFF12B76A),
            ),
            SizedBox(height: 5.h),

            // زر Write review (أيقونة بنفسجي ونصوص رمادية)
            GestureDetector(
              onTap: () {
                context.push(AppRouter.kAddReview);
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    AssetsData.iconChatbookingSvg,
                    width: 24.w,
                    colorFilter: const ColorFilter.mode(
                      AppColors.chatMessageContainer,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    'Write review',
                    style: Styles.textStyle12W400Inter.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 5.h),
            // خط فاصل بين Write review و Call Agent
            Divider(color: const Color(0xFFE5E7EB), thickness: 1, height: 4.h),
            SizedBox(height: 5.h),

            // زر Call Agent (أيقونة هاتف بنفسجي ونصوص رمادية)
            GestureDetector(
              onTap: () {
                context.push(AppRouter.kChatDetail);
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    AssetsData.iconCallSvg,
                    width: 24.w,
                    colorFilter: const ColorFilter.mode(
                      AppColors.chatMessageContainer,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    'Call Agent',
                    style: Styles.textStyle12W400Inter.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 3.h),
            // خط فاصل نهائي تحت هذا العنصر ليفصله عن العقار التالي
            Divider(color: const Color(0xFFE5E7EB), thickness: 1, height: 16.h),
          ],
        );
      },
    );
  }
}
