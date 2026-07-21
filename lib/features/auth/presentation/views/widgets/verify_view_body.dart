import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_snack_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/otp_fields.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/resend_code_text.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/section_header.dart';
import 'package:go_router/go_router.dart';

class VerifyViewBody extends StatefulWidget {
  const VerifyViewBody({super.key});

  @override
  State<VerifyViewBody> createState() => _VerifyViewBodyState();
}

class _VerifyViewBodyState extends State<VerifyViewBody> {
  final GlobalKey<OtpFieldsState> otpKey = GlobalKey<OtpFieldsState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SectionHeader(
            title: "Verify your Email",
            subTitle:
                "Please enter 4 digit verification that have been sent to your email address ",
          ),

          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: SizedBox(height: 148.h),
            ),
          ),

          OtpFields(key: otpKey, length: 4),

          SizedBox(height: 48.h),

          ResendCodeText(onTap: () {}),

          const Spacer(),

          CustomButton(
            text: "Verify",
            onPressed: () {
              if (otpKey.currentState!.validateOtp()) {
                context.push(AppRouter.kResetPassword);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  CustomSnackBar(
                    message: "Please fill all OTP fields",
                    isError: true,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
