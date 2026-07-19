import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_text_form_field.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/form_label.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';

class EditProfileFormFields extends StatelessWidget {
  const EditProfileFormFields({
    super.key,
    required this.fullNameController,
    required this.emailController,
  });
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FormLabel(text: 'Text Form'),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: fullNameController,
          hintText: 'Brooklyn Simmons',
          textInputType: TextInputType.name,
        ),
        SizedBox(height: 16.h),

        const FormLabel(text: 'Username'),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: fullNameController,
          hintText: 'Brooklynsim',
          textInputType: TextInputType.text,
        ),
        SizedBox(height: 16.h),

        const FormLabel(text: 'Email'),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: emailController,
          hintText: 'brooklynsim@gmail.com',
          textInputType: TextInputType.emailAddress,
        ),
        SizedBox(height: 16.h),

        const FormLabel(text: 'Date of Birth'),
        SizedBox(height: 8.h),
        const CustomTextFormField(
          hintText: 'November/21/1992',
          textInputType: TextInputType.datetime,
          suffixIcon: Icon(
            Icons.calendar_today,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
