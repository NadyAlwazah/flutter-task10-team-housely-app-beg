import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/shared_preferences_helper.dart';
import 'package:flutter_task10_team_housely_app_beg/features/select_location/data/location_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/select_location/presentation/views/widgets/app_bottom_indicator.dart';

import 'package:flutter_task10_team_housely_app_beg/features/select_location/presentation/views/widgets/select_location_view_body.dart';

class SelectLocationView extends StatelessWidget {
  const SelectLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LocationCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
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
                  onPressed: () async {
                    await SharedPreferencesHelper.saveBool(
                      'hasSkippedLocation',
                      true,
                    );
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(child: SelectLocationViewBody()),
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: const AppBottomIndicator(opacity: 0.1),
            ),
          ],
        ),
      ),
    );
  }
}
