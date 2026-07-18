import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/auth_header.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(children: [AuthHeader(title: "Register Account")]),
      ),
    );
  }
}
