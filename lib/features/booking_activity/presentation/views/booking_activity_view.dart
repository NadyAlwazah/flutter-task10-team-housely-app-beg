import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/features/booking_activity/presentation/views/widgets/booking_activity_view_body.dart';

class BookingActivityView extends StatelessWidget {
  const BookingActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [BookingActivityViewBody()]);
  }
}
