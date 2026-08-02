import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/booking_activity/presentation/views/booking_activity_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/explore/presentation/views/explore_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/favourite/presentation/views/favourite_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/home_content_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/home_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/popular_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/profile/presentation/views/profile_view.dart';

class BottomBarLayout extends StatefulWidget {
  const BottomBarLayout({super.key});

  @override
  State<BottomBarLayout> createState() => _BottomBarLayoutState();
}

class _BottomBarLayoutState extends State<BottomBarLayout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeContentCubit>(),
      child: BlocBuilder<HomeContentCubit, bool>(
        builder: (context, showPopular) {
          final pages = [
            showPopular
                ? PopularView(
                    onBackToHome: () {
                      context.read<HomeContentCubit>().showHome();
                    },
                  )
                : const HomeView(),

            ExploreView(
              onBackToHome: () => setState(() => currentIndex = 0),
            ),

            FavouriteView(
              onBackToHome: () => setState(() => currentIndex = 0),
            ),

            const BookingActivityView(),
            
            ProfileView(
              onBackToHome: () => setState(() => currentIndex = 0),
            ),
          ];

          return Scaffold(
            body: IndexedStack(
              index: currentIndex,
              children: pages,
            ),

            bottomNavigationBar: currentIndex == 1
                ? null
                : CustomBottomNavBar(
                    currentIndex: currentIndex,
                    onTap: (index) {
                      setState(() => currentIndex = index);
                    },
                  ),
          );
        },
      ),
    );
  }
}