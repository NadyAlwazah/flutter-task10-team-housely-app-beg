import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task10_team_housely_app_beg/core/layout/bottom_nav_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/booking_activity/presentation/views/booking_activity_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/explore/presentation/views/explore_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/favourite/presentation/views/favourite_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/home_content_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/home_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/popular_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/profile/presentation/views/profile_view.dart';

class BottomBarLayout extends StatelessWidget {
  const BottomBarLayout({super.key});

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const ExploreView();
      case 2:
        return const FavouriteView();
      case 3:
        return const BookingActivityView();
      case 4:
        return const ProfileView();
      default:
        return const HomeView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<BottomNavCubit>()),
        BlocProvider(create: (_) => getIt<HomeContentCubit>()),
      ],
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: BlocBuilder<HomeContentCubit, bool>(
              builder: (context, showPopular) {
                if (currentIndex == 0) {
                  return showPopular ? const PopularView() : const HomeView();
                }
                return _getPage(currentIndex);
              },
            ),
            bottomNavigationBar: CustomBottomNavBar(
              currentIndex: currentIndex,
              onTap: (index) {
                context.read<BottomNavCubit>().changeTab(index);
              },
            ),
          );
        },
      ),
    );
  }
}
