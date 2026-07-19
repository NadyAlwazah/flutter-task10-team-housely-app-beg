import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/styles.dart';

class DonotHaveAnAccountWidget extends StatelessWidget {
  const DonotHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have account ? ",
          style: Styles.textStyle14W400Inter.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kSignup);
          },
          child: Text(
            "Sign up",
            style: Styles.textStyle14W500Inter.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
