import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_snack_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/auth_or_text.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/donot_have_an_account_widget.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/forgot_password_text.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/remember_me.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/signin_form_fields.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/social_buttons.dart';
import 'package:go_router/go_router.dart';

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

  bool rememberMeValue = false;
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
                    RememberMe(
                      onChanged: (value) {
                        rememberMeValue = value;
                      },
                    ),
                    const Spacer(),
                    ForgotPasswordText(
                      onTap: () => context.push(AppRouter.kForgotPassword),
                    ),
                  ],
                ),

                const SizedBox(height: 32),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) async {
                    if (state is AuthSuccess) {
                      final local = getIt<AuthLocalDataSource>();
                      final user = await local.getUser();

                      // التحقق من وجود الموقع
                      final hasLocation =
                          user?.myLocation != null &&
                          user!.myLocation!.isNotEmpty;

                      if (hasLocation) {
                        context.go(AppRouter.kBottomBar);
                      } else {
                        context.go(AppRouter.kSelectLocation);
                      }
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
                    return CustomButton(
                      text: "Sign in",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().signin(
                            email: emailController.text,
                            rememberMe: rememberMeValue,
                          );
                        }
                      },
                    );
                  },
                ),

                const SizedBox(height: 24),
                const AuthOrText(),

                const SizedBox(height: 24),
                const SocialButtons(),

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
