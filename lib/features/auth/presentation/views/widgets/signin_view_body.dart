import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/auth_or_text.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/donot_have_an_account_widget.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/forgot_password_text.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/remember_me.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/signin_form_fields.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/social_signin_buttons.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 72),

                const AuthHeader(title: "Welcome Back !"),

                const SizedBox(height: 32),
                SigninFormFields(
                  emailController: emailController,
                  passwordController: passwordController,
                ),

                const SizedBox(height: 16),
                Row(
                  children: [
                    RememberMe(onChanged: (val) {}),
                    const Spacer(),
                    const ForgotPasswordText(),
                  ],
                ),

                const SizedBox(height: 32),
                CustomButton(text: "Sign in", onPressed: () {}),

                const SizedBox(height: 24),
                const AuthOrText(),

                const SizedBox(height: 24),
                const SocialSigninButtons(),

                const SizedBox(height: 32),
                const DonotHaveAnAccountWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
