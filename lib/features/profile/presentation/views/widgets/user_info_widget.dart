import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/models/user_model.dart';

class UserInfoWidget extends StatelessWidget {
  final UserModel user;

  const UserInfoWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(user.fullName, style: Styles.textStyle14W600Inter),
        Text(user.email, style: Styles.textStyle12W400Inter),
      ],
    );
  }
}
