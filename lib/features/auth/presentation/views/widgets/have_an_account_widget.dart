import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:go_router/go_router.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account ? ",
          style: Styles.textStyle14W400Inter.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Text(
            "Sign in",
            style: Styles.textStyle14W500Inter.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
