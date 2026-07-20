import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_text_form_field.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/form_label.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileFormFields extends StatelessWidget {
  const EditProfileFormFields({
    super.key,
    required this.fullNameController,
    required this.emailController,
    required this.dateController,
    required this.usernameController,
  });
  final TextEditingController fullNameController;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController dateController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FormLabel(text: 'Text Form'),
        SizedBox(height: 4.h),
        CustomTextFormField(
          controller: fullNameController,
          hintText: 'Brooklyn Simmons',
          textInputType: TextInputType.name,
        ),
        SizedBox(height: 16.h),

        const FormLabel(text: 'Username'),
        SizedBox(height: 4.h),
        CustomTextFormField(
          controller: usernameController,
          hintText: 'Brooklynsim',
          textInputType: TextInputType.text,
        ),
        SizedBox(height: 16.h),

        const FormLabel(text: 'Email'),
        SizedBox(height: 4.h),
        CustomTextFormField(
          controller: emailController,
          hintText: 'brooklynsim@gmail.com',
          textInputType: TextInputType.emailAddress,
        ),
        SizedBox(height: 16.h),

        const FormLabel(text: 'Date of Birth'),
        SizedBox(height: 4.h),
        GestureDetector(
          onTap: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime(1992, 11, 21),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );

            if (pickedDate != null) {
              dateController.text =
                  "${pickedDate.year}/${pickedDate.month}/${pickedDate.day}";
            }
          },
          child: AbsorbPointer(
            child: CustomTextFormField(
              controller: dateController,
              hintText: 'November/21/1992',
              textInputType: TextInputType.datetime,
              suffixIcon: Container(
                padding: EdgeInsets.all(12.r),
                child: SvgPicture.asset(
                  AssetsData.iconCalendarSvg,
                  width: 18.r,
                  height: 18.r,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
