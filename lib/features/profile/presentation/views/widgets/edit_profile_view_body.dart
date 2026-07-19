import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/features/profile/presentation/views/widgets/edit_profile_form_fields.dart';
import 'package:flutter_task10_team_housely_app_beg/features/profile/presentation/views/widgets/profile_image_widget.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 32),
              const ProfileImageWidget(),

              EditProfileFormFields(
                fullNameController: fullNameController,
                emailController: emailController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
