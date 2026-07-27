import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/features/booking_and_payment/presentation/views/widgets/booking_reserve_view_body.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';

class BookingReserveView extends StatelessWidget {
  const BookingReserveView({super.key, required this.propertyModel});
  final PropertyModel propertyModel;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: BookingReserveViewBody());
  }
}
