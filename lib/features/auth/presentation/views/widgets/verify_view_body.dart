import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/section_header.dart';

class VerifyViewBody extends StatelessWidget {
  const VerifyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SectionHeader(
              title: "Verify your Email",
              subTitle:
                  "Please enter 6 digit verification that have been sent to your email address ",
            ),
          ],
        ),
      ),
    );
  }
}
