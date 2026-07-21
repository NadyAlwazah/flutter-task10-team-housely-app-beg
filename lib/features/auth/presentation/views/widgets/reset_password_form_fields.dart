import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/validators.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/form_label.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_text_form_field.dart';

class ResetPasswordFormFields extends StatelessWidget {
  const ResetPasswordFormFields({
    super.key,
    required this.newPasswordController,
    required this.confirmPasswordController,
  });
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // New Password
        const FormLabel(text: "New Password"),
        SizedBox(height: 4.h),
        CustomTextFormField(
          controller: newPasswordController,
          hintText: "Enter new password",
          textInputType: TextInputType.visiblePassword,
          obscureText: true,
          validator: (value) => Validators.validatePassword(
            value,
            message: "Use upper/lowercase, number, and symbol.",
          ),
        ),

        SizedBox(height: 16.h),

        // Confirm Password
        const FormLabel(text: "Confirm Password"),
        SizedBox(height: 4.h),
        CustomTextFormField(
          controller: confirmPasswordController,
          hintText: "Re-enter password",
          textInputType: TextInputType.visiblePassword,
          obscureText: true,
          validator: (value) => Validators.validateConfirmPassword(
            value,
            newPasswordController.text,
            message: "Use upper/lowercase, number, and symbol.",
          ),
        ),
      ],
    );
  }
}
