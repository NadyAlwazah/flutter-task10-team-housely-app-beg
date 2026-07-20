import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/validators.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_text_form_field.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/form_label.dart';

class SignupFormFields extends StatelessWidget {
  const SignupFormFields({
    super.key,
    required this.fullNameController,
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController fullNameController;
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

        const FormLabel(text: "Username"),
        const SizedBox(height: 4),

        CustomTextFormField(
          controller: fullNameController,
          hintText: "Username",
          textInputType: TextInputType.text,
          validator: Validators.validateFullName,
        ),

        const SizedBox(height: 16),

        const FormLabel(text: "Password"),
        const SizedBox(height: 4),

        CustomTextFormField(
          controller: passwordController,
          hintText: "Password",
          textInputType: TextInputType.text,
          obscureText: true,
          validator: Validators.validatePassword,
        ),
      ],
    );
  }
}
