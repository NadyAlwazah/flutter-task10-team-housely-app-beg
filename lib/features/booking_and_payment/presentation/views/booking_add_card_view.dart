import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_app_bar.dart';
import 'widgets/booking_add_card_view_body.dart';

class BookingAddCardView extends StatelessWidget {
  final Map<String, dynamic>? extraData;

  const BookingAddCardView({super.key, this.extraData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: 'Add Card',

        onTapLeading: () => context.pop(),
      ),
      body: BookingAddCardViewBody(
        initialName: extraData?['initialName'],
        initialCardNumber: extraData?['initialCardNumber'],
        initialExpiry: extraData?['initialExpiry'],
        initialCvv: extraData?['initialCvv'],
      ),
    );
  }
}
