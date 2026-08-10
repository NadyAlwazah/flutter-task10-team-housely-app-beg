import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_app_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/profile/data/manager/profile_cubit/profile_cubit.dart';
import 'widgets/booking_activity_view_body.dart';

class BookingActivityView extends StatelessWidget {
  const BookingActivityView({super.key, required this.onBackToHome});
  final VoidCallback onBackToHome;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: CustomAppBar(title: 'My Booking', onTapLeading: onBackToHome),
        body: BlocProvider(
          create: (context) => getIt<ProfileCubit>(),
          child: const BookingActivityViewBody(),
        ),
      ),
    );
  }
}