import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/auth_or_text.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/signup_form_fields.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/social_buttons.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/terms_and_conditions.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const AuthHeader(title: "Register Account"),

              const SizedBox(height: 32),
              SignupFormFields(
                fullNameController: fullNameController,
                emailController: emailController,
                passwordController: passwordController,
              ),

              const SizedBox(height: 16),
              TermsAndConditions(onChanged: (val) {}),

              const SizedBox(height: 32),
              CustomButton(text: "Sign up", onPressed: () {}),

              const SizedBox(height: 24),
              const AuthOrText(),

              const SizedBox(height: 24),
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
