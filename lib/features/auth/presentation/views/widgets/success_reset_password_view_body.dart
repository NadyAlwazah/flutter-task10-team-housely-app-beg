import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/success_avatar.dart';
import 'package:go_router/go_router.dart';

class SuccessResetPasswordViewBody extends StatelessWidget {
  const SuccessResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 192.h),
          const Center(child: SuccessAvatar()),

          SizedBox(height: 48.h),
          Text("Success!", style: Styles.textStyle20W600Inter),

          SizedBox(height: 16.h),
          Text(
            "You password has been changed. Please",
            style: Styles.textStyle14W400Inter,
          ),
          Text(
            "log in again with a new password.",
            style: Styles.textStyle14W400Inter,
          ),

          SizedBox(height: 108.h),
          CustomButton(
            text: "Continue",
            onPressed: () {
              context.go(AppRouter.kSignin);
            },
          ),
        ],
      ),
    );
  }
}
