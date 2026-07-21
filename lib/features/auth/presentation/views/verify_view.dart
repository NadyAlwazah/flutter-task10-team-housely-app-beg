import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_app_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/verify_view_body.dart';
import 'package:go_router/go_router.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onTapLeading: () => context.pop()),

      body: const VerifyViewBody(),
    );
  }
}
