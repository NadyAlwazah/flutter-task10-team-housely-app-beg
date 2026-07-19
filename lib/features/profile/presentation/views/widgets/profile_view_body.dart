import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/features/profile/presentation/views/widgets/profile_image_widget.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(children: [SizedBox(height: 56), ProfileImageWidget()]),
    );
  }
}
