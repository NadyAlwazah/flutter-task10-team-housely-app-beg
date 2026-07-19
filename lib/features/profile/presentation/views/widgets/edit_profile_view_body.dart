import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/features/profile/presentation/views/widgets/profile_image_widget.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(children: [SizedBox(height: 32), ProfileImageWidget()]),
      ),
    );
  }
}
