import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/auth_header.dart';

class SigninViewBody extends StatelessWidget {
  const SigninViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 72),

            AuthHeader(title: "Welcome Back !"),
          ],
        ),
      ),
    );
  }
}
