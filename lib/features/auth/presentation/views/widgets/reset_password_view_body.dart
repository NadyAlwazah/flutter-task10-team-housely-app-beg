import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/contact_option_card.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/section_header.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SectionHeader(
            title: "Forgot Password",
            subTitle:
                "Select which contact details should we use to reset your password ",
          ),

          const SizedBox(height: 32),
          ContactOptionCard(
            icon: SvgPicture.asset(AssetsData.iconCallSvg),
            title: 'Via phone',
            value: '+62 85 -5***488-65',
            isSelected: selectedIndex == 0,
            onTap: () => setState(() => selectedIndex = 0),
          ),

          SizedBox(height: 16.h),

          ContactOptionCard(
            icon: SvgPicture.asset(
              AssetsData.iconEmailSvg,
              width: 24.r,
              height: 24.r,
            ),
            title: 'Via email',
            value: 'mu***@gmail.com',
            isSelected: selectedIndex == 1,
            onTap: () => setState(() => selectedIndex = 1),
          ),

          const Spacer(),

          CustomButton(text: "Continue", onPressed: () {}),
          SizedBox(height: 48.h),
        ],
      ),
    );
  }
}
