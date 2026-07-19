import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  const AuthHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Styles.textStyle20W600Inter),
        const SizedBox(height: 8),
        Text(
          "Sign in with your email and password ",
          style: Styles.textStyle14W400Inter,
        ),
        Text("or social media to continue", style: Styles.textStyle14W400Inter),
      ],
    );
  }
}
