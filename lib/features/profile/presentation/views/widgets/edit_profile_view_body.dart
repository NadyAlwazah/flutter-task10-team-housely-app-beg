import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/data_sources/auth_local_data_source.dart';
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
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final local = getIt<AuthLocalDataSource>();
    final user = await local.getUser();

    if (user != null) {
      setState(() {
        fullNameController.text = user.fullName;
        emailController.text = user.email;
        dateController.text = user.dateOfBirth ?? "";

        // استخراج الاسم الأول فقط
        final firstName = user.fullName.split(" ").first;
        usernameController.text = firstName;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    dateController.dispose();
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
                usernameController: usernameController,
                emailController: emailController,
                dateController: dateController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
