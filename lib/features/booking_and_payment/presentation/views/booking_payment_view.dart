import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_app_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';
import 'package:go_router/go_router.dart';
import 'widgets/booking_payment_view_body.dart';

class BookingPaymentView extends StatelessWidget {
  final PropertyModel property;

  const BookingPaymentView({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: 'Booking', onTapLeading: () => context.pop()),
      body: BookingPaymentViewBody(property: property),
    );
  }
}
