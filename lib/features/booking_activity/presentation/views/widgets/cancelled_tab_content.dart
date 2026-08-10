import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/booking_activity/presentation/views/widgets/empty_booking.dart';
import 'package:go_router/go_router.dart';
import 'booking_activity_card.dart';

class CancelledTabContent extends StatelessWidget {
  final List<Map<String, dynamic>> cancelledBookings;

  const CancelledTabContent({super.key, required this.cancelledBookings});

  @override
  Widget build(BuildContext context) {
    if (cancelledBookings.isEmpty) {
      // الحالة الفارغة مع صورة Oops!
      return const EmptyBookingWidget(tabType: 'cancelled');
    }
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      itemCount: cancelledBookings.length + 1, // +1 for the Call Agent button
      itemBuilder: (context, index) {
        if (index == cancelledBookings.length) {
          // عرض زر Call Agent في نهاية القائمة
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SizedBox(height: 5.h),
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
                        AppColors.chatPurple,
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
              Divider(
                color: AppColors.lightGrayBackground,
                thickness: 1,
                height: 16.h,
              ),
            ],
          );
        }

        final item = cancelledBookings[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: BookingActivityCard(
            title: item['title'] ?? '',
            location: item['location'] ?? '',
            image: item['image'] ?? '',
            dateOrPrice: item['date'] ?? '',
            statusText: item['status'] ?? 'cancelled',
            statusColor: const Color(0xFFFFE4E6),
            statusTextColor: AppColors.statusRed,
          ),
        );
      },
    );
  }
}
