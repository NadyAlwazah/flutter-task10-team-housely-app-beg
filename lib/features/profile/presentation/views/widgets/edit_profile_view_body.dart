import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext, BlocConsumer;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_snack_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_task10_team_housely_app_beg/features/profile/data/manager/profile_cubit/profile_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/profile/presentation/views/widgets/edit_profile_form_fields.dart';
import 'package:flutter_task10_team_housely_app_beg/features/profile/presentation/views/widgets/profile_image_widget.dart';
import 'package:go_router/go_router.dart';

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

      // الآن نضيف الـ listener بعد تحميل البيانات
      usernameController.addListener(_updateFullNameFromUsername);
    }
  }

  void _updateFullNameFromUsername() {
    final fullName = fullNameController.text.trim();

    if (fullName.isEmpty) return;

    final parts = fullName.split(" ");

    // إذا ما في كنية لا تعمل شيء
    if (parts.length < 2) return;

    final lastName = parts.sublist(1).join(" ");
    final newFirstName = usernameController.text.trim();

    fullNameController.text = "$newFirstName $lastName";
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
              SizedBox(height: 32.h),
              const ProfileImageWidget(),

              EditProfileFormFields(
                fullNameController: fullNameController,
                usernameController: usernameController,
                emailController: emailController,
                dateController: dateController,
              ),

              SizedBox(height: 62.h),
              BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state is ProfileLoaded) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      CustomSnackBar(message: "Profile updated successfully"),
                    );
                    context.pop();
                  } else if (state is ProfileFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      CustomSnackBar(message: state.message, isError: true),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ProfileLoading) {
                    return const CustomButton(
                      isLoading: true,
                      loadingColor: Colors.white,
                    );
                  }
                  return CustomButton(
                    text: "Save Change",
                    onPressed: () {
                      context.read<ProfileCubit>().updateUser(
                        fullName: fullNameController.text,
                        email: emailController.text,
                        dateOfBirth: dateController.text,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
