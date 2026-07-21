import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_app_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/forgot_password_view_body.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onTapLeading: () => context.pop()),
      body: const ForgotPasswordViewBody(),
    );
  }
}
