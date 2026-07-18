import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class AuthOrText extends StatelessWidget {
  const AuthOrText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Or",
        style: Styles.textStyle14W400Inter.copyWith(
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
