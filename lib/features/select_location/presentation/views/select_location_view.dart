import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/select_location/data/manager/location_cubit.dart';

import 'package:flutter_task10_team_housely_app_beg/features/select_location/presentation/views/widgets/select_location_view_body.dart';
import 'package:go_router/go_router.dart';

class SelectLocationView extends StatelessWidget {
  const SelectLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LocationCubit>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.w, top: 10.h),
              child: Container(
                height: 35.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(50.w, 35.h),
                  ),
                  onPressed: () {
                    context.go(AppRouter.kBottomBar);
                  },
                  child: Text(
                    "Skip",
                    style: Styles.textStyle12W400Inter.copyWith(
                      color: const Color(0xFF4D5761),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(children: [Expanded(child: SelectLocationViewBody())]),
      ),
    );
  }
}
