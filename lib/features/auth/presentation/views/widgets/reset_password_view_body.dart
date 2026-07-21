import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/reset_password_form_fields.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/section_header.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              title: "Create New Password",
              subTitle: "Please enter a new password\nto change",
            ),

            SizedBox(height: 32.h),

            ResetPasswordFormFields(
              newPasswordController: newPasswordController,
              confirmPasswordController: confirmPasswordController,
            ),

            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: SizedBox(height: 315.h),
              ),
            ),

            CustomButton(
              text: "Change password",
              onPressed: () {
                if (!_formKey.currentState!.validate()) {}
              },
            ),
          ],
        ),
      ),
    );
  }
}
