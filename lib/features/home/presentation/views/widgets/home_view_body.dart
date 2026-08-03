import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/discount_banner.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/nearby_section.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/popular_section.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/recommended_section.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/search_property_field.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/top_locations_section.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/data/manager/filter_cubit/filter_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/presentation/views/widgets/fillter_bottom_sheet.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  void _showBottomSheet() {
    final propertyCubit = context.read<PropertyCubit>(); // نقرأه من الصفحة الأم

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40.r)),
      ),
      isScrollControlled: true,
      builder: (_) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: propertyCubit), //  نمرّر PropertyCubit
            BlocProvider(create: (_) => getIt<FilterCubit>()),
          ],
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: const FillterBottomSheet(),
          ),
        );
      },
    );
  }

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
              readOnly: true,
              hintText: "Search Property",
              onTap: () {
                context.push(AppRouter.kSearch);
              },
              onTapSuffix: _showBottomSheet,
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
