import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/features/booking_activity/presentation/views/widgets/empty_booking.dart';
import 'package:flutter_task10_team_housely_app_beg/features/chat/presentation/views/widgets/delete_confirmation_dialog.dart';
import 'package:go_router/go_router.dart';
import 'booking_activity_card.dart';

class UpcomingTabContent extends StatelessWidget {
  final List<Map<String, dynamic>> upcomingBookings; // استقبال القائمة الحقيقية
  final Function(int index) onDeleteBooking;
  const UpcomingTabContent({
    super.key,
    required this.upcomingBookings,
    required this.onDeleteBooking,
  });

  void _showDeleteConfirmationSheet(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return DeleteConfirmationDialog(
          titleText:
              'Are you sure you want to\ndelete this booking?', // النص المخصص للعقار
          subtitleText: 'The booking will be deleted from this device',
          onDeleteConfirm: () async {
            await onDeleteBooking(index); // تنفيذ الحذف
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // إذا كانت القائمة فارغة، اعرض واجهة الـ Oops
    if (upcomingBookings.isEmpty) {
      return const EmptyBookingWidget(tabType: 'upcoming');
    }

    // وإذا وُجدت بيانات، اعرض الكروت
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      itemCount: upcomingBookings.length,
      itemBuilder: (context, index) {
        final item = upcomingBookings[index];
        return GestureDetector(
          onLongPress: () => _showDeleteConfirmationSheet(context, index),
          child: Column(
            children: [
              BookingActivityCard(
                title: item['title'],
                location: item['location'],
                image: item['image'],
                dateOrPrice: item['date'],
                statusText: item['status'], // 'Checkin' أو 'Waiting payment'
                statusColor: item['status'] == 'Checkin'
                    ? AppColors.greenStatusBackground
                    : const Color(0xFFFFE4E6),
                statusTextColor: item['status'] == 'Checkin'
                    ? AppColors.greenTextStatus
                    : AppColors.statusRed,
                onTap: () {
                  final status = (item['status'] ?? '')
                      .toString()
                      .trim()
                      .toLowerCase();

                  // التحقق إذا كانت الحالة هي Waiting payment
                  if (status.contains('waiting')) {
                    // الانتقال لواجهة الدفع مع إرسال التاريخ السابق وحالة الحجز
                    context.push(
                      AppRouter.kBookingPayment,
                      extra: item['property'],
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
