import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/features/booking_activity/presentation/views/widgets/empty_booking.dart';
import 'booking_activity_card.dart';

class UpcomingTabContent extends StatelessWidget {
  final List<Map<String, dynamic>> upcomingBookings; // استقبال القائمة الحقيقية

  const UpcomingTabContent({super.key, required this.upcomingBookings});

  @override
  Widget build(BuildContext context) {
    // إذا كانت القائمة فارغة، اعرض واجهة الـ Oops
    if (upcomingBookings.isEmpty) {
      return const EmptyBookingWidget();
    }

    // وإذا وُجدت بيانات، اعرض الكروت
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      itemCount: upcomingBookings.length,
      itemBuilder: (context, index) {
        final item = upcomingBookings[index];
        return Column(
          children: [
            BookingActivityCard(
              title: item['title'],
              location: item['location'],
              image: item['image'],
              dateOrPrice: item['date'],
              statusText: item['status'], // 'Checkin' أو 'Waiting payment'
              statusColor: item['status'] == 'Checkin'
                  ? const Color(0xFFD1FADF)
                  : const Color(0xFFFFE4E6),
              statusTextColor: item['status'] == 'Checkin'
                  ? const Color(0xFF12B76A)
                  : const Color(0xFFF04438),
            ),
          ],
        );
      },
    );
  }
}
