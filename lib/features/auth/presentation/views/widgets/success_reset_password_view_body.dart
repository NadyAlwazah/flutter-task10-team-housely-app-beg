import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/success_avatar.dart';

class SuccessResetPasswordViewBody extends StatelessWidget {
  const SuccessResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: SuccessAvatar())],
    );
  }
}
