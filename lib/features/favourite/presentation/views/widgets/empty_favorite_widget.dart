import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class EmptyFavoriteWidget extends StatelessWidget {
  const EmptyFavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsData.iconFavoriteSvg,
              width: 64.r,
              height: 64.r,
              colorFilter: ColorFilter.mode(
                AppColors.textUnselected.withOpacity(0.4),
                BlendMode.srcIn,
              ),
            ),
            SizedBox(height: 16.h),
            Text('No favorites yet', style: Styles.textStyle16W600Inter),
            SizedBox(height: 8.h),
            Text(
              'Properties you like will appear here',
              style: Styles.textStyle12W400Inter.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
