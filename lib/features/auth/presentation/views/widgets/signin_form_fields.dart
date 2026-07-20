import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/validators.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_text_form_field.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/form_label.dart';

class SigninFormFields extends StatelessWidget {
  const SigninFormFields({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FormLabel(text: "Email"),
        const SizedBox(height: 4),

        CustomTextFormField(
          controller: emailController,
          hintText: "xyz@gmail.com",
          textInputType: TextInputType.emailAddress,
          validator: Validators.validateEmail,
        ),

        const SizedBox(height: 16),

        const FormLabel(text: "Password"),
        const SizedBox(height: 4),

        CustomTextFormField(
          controller: passwordController,
          hintText: "●●●●●●●●",
          hintStyle: Styles.textStyle14W400Inter.copyWith(fontSize: 8),
          textInputType: TextInputType.text,
          obscureText: true,
          validator: Validators.validatePassword,
        ),
      ],
    );
  }
}
