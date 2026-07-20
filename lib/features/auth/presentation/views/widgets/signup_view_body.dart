import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_snack_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/auth_or_text.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/have_an_account_widget.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/signup_form_fields.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/social_buttons.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'package:go_router/go_router.dart';

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

  bool isTermsAccepted = false;

  void _showTermsError() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        content: Text(
          "Please accept the Terms and Conditions to continue",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  void _onRegister() {
    if (!_formKey.currentState!.validate()) return;

    if (!isTermsAccepted) {
      _showTermsError();
      return;
    }

    context.read<AuthCubit>().signup(
      fullName: fullNameController.text.trim(),
      email: emailController.text.trim(),
    );
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
              TermsAndConditions(
                onChanged: (value) {
                  isTermsAccepted = value;
                },
              ),

              const SizedBox(height: 32),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    context.pop();
                  } else if (state is AuthFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      CustomSnackBar(message: state.message, isError: true),
                    );
                  }
                },
                buildWhen: (previous, current) =>
                    current is AuthLoading ||
                    current is AuthFailure ||
                    current is AuthSuccess,
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const CustomButton(
                      isLoading: true,
                      loadingColor: Colors.white,
                    );
                  }
                  return CustomButton(text: "Sign up", onPressed: _onRegister);
                },
              ),

              const SizedBox(height: 24),
              const AuthOrText(),

              const SizedBox(height: 24),
              const SocialButtons(),

              const SizedBox(height: 32),
              const HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
