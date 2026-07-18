import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';

class SocialSigninButtons extends StatelessWidget {
  const SocialSigninButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(AssetsData.iconFacebookSvg),
        const SizedBox(width: 16),
        _buildSocialButton(AssetsData.iconGoogleSvg),
      ],
    );
  }

  Widget _buildSocialButton(String assetPath) {
    return Container(
      width: 46.r,
      height: 46.r,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFE5E7EB),
      ),
      child: Center(
        child: SvgPicture.asset(assetPath, width: 24.r, height: 24.r),
      ),
    );
  }
}
