import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_snack_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/booking_activity/presentation/views/widgets/empty_booking.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/agent_model.dart';
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
      itemCount: cancelledBookings.length,
      itemBuilder: (context, index) {
        final item = cancelledBookings[index];

        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookingActivityCard(
                title: item['title'] ?? '',
                location: item['location'] ?? '',
                image: item['image'] ?? '',
                dateOrPrice: item['date'] ?? '',
                statusText: item['status'] ?? 'cancelled',
                statusColor: const Color(0xFFFFE4E6),
                statusTextColor: AppColors.statusRed,
              ),
              SizedBox(height: 12.h),
              GestureDetector(
                onTap: () {
                  final agentData = item['agent'];
                  if (agentData != null) {
                    final agent = AgentModel.fromJson(
                      Map<String, dynamic>.from(agentData),
                    );
                    context.push(
                      AppRouter.kChatDetail,
                      extra: {'agent': agent},
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      CustomSnackBar(
                        message: 'Agent info not available',
                        isError: true,
                      ),
                    );
                  }
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
              SizedBox(height: 12.h),
              Divider(
                color: AppColors.lightGrayBackground,
                thickness: 1,
                height: 1.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
