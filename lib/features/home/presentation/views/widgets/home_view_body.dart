import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/discount_banner.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/search_property_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: HomeAppBar()),
          SliverToBoxAdapter(child: SizedBox(height: 32.h)),
          const SliverToBoxAdapter(child: SearchPropertyField()),

          SliverToBoxAdapter(child: SizedBox(height: 22.h)),
          const SliverToBoxAdapter(child: DiscountBanner()),
        ],
      ),
    );
  }
}
