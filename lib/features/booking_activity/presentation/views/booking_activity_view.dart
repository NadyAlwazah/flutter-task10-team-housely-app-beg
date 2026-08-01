import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_app_bar.dart';
import 'package:go_router/go_router.dart';
import 'widgets/booking_activity_view_body.dart';

class BookingActivityView extends StatelessWidget {
  const BookingActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFFCFCFD),
        appBar: CustomAppBar(
          title: 'My Booking',

          onTapLeading: () {
            context.go(AppRouter.kBottomBar);
          },
        ),
        body: const BookingActivityViewBody(),
      ),
    );
  }
}
