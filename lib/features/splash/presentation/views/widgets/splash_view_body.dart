import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(AssetsData.iconStrokeSvg),
              SvgPicture.asset(AssetsData.iconLogoSvg),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "HOUSELY",
            style: Styles.textStyle24W800Inter.copyWith(
              letterSpacing: 0.16 * 24,
            ),
          ),
        ],
      ),
    );
  }
}
