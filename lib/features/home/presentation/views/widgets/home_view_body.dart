import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/discount_banner.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/nearby_section.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/popular_section.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/recommended_section.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/search_property_field.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/top_locations_section.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverPadding(
          padding: EdgeInsets.only(left: 24, right: 24, top: 16),
          sliver: SliverToBoxAdapter(child: HomeAppBar()),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 32.h)),

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          sliver: SliverToBoxAdapter(
            child: SearchPropertyField(
              hintText: "Search Property",
              onTap: () {
                context.push(AppRouter.kSearch);
              },
              onTapSuffix: () {
                context.push(AppRouter.kFillter);
              },
              suffixIcon: SvgPicture.asset(
                AssetsData.iconFilterSvg,
                width: 24.r,
                height: 24.r,
              ),
            ),
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 22.h)),

        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          sliver: SliverToBoxAdapter(child: DiscountBanner()),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 24.h)),

        const SliverPadding(
          padding: EdgeInsets.only(left: 24),
          sliver: SliverToBoxAdapter(child: RecommendedSection()),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 24.h)),

        const SliverPadding(
          padding: EdgeInsets.only(left: 24),
          sliver: SliverToBoxAdapter(child: NearbySection()),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        const SliverPadding(
          padding: EdgeInsets.only(left: 24),
          sliver: SliverToBoxAdapter(child: TopLocationsSection()),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 24.h)),

        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          sliver: SliverToBoxAdapter(child: PopularSection()),
        ),
      ],
    );
  }
}
