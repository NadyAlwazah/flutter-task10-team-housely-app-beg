import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/booking_activity/presentation/views/booking_activity_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/explore/presentation/views/explore_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/favourite/presentation/views/favourite_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/home_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/profile/presentation/views/profile_view.dart';

class BottomBarLayout extends StatefulWidget {
  const BottomBarLayout({super.key});

  @override
  State<BottomBarLayout> createState() => _BottomBarLayoutState();
}

class _BottomBarLayoutState extends State<BottomBarLayout> {
  int currentIndex = 0;

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
    return Scaffold(
      body: _getPage(currentIndex),

      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
