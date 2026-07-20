import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/location_service.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/select_location/data/manager/location_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/select_location/presentation/views/widgets/custom_app_button.dart';
import 'package:go_router/go_router.dart';

class SelectLocationViewBody extends StatelessWidget {
  SelectLocationViewBody({super.key});

  final LocationService _locationService = getIt<LocationService>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 30.h),

            SvgPicture.asset(AssetsData.selectLocationSvg, height: 220.h),

            SizedBox(height: 30.h),

            Text("Hi, Nice to meet you !", style: Styles.textStyle20W600Inter),

            SizedBox(height: 16.h),

            Text(
              "Choose your location to find property\n around you",
              style: Styles.textStyle14W400Inter,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 104.h),

            CustomAppButton(
              text: "Use current location",
              onPressed: () async {
                try {
                  final String address = await _locationService
                      .getCurrentAddress();

                  if (!context.mounted) return;

                  await context.read<LocationCubit>().updateLocation(address);

                  if (!context.mounted) return;

                  context.go(AppRouter.kBottomBar);
                } catch (e) {
                  if (!context.mounted) return;

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Error: $e")));
                }
              },
              textStyle: Styles.textStyle18W400Inter.copyWith(
                color: Colors.white,
              ),
            ),

            SizedBox(height: 16.h),

            CustomAppButton(
              text: "Select it manually",
              backgroundColor: Colors.white,
              textColor: AppColors.primary,
              onPressed: () => context.push('/map'),
              textStyle: Styles.textStyle18W400Inter,
            ),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
