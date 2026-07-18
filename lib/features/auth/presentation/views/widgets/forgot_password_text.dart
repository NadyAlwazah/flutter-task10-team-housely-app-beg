import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class ForgotPasswordText extends StatelessWidget {
  final VoidCallback? onTap;

  const ForgotPasswordText({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        "Forgot Password ?",
        style: Styles.textStyle14W400Inter.copyWith(color: AppColors.primary),
      ),
    );
  }
}
