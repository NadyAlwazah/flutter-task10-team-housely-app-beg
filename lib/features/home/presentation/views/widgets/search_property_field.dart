import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_text_form_field.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';

class SearchPropertyField extends StatelessWidget {
  const SearchPropertyField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "Search Property",
      textInputType: TextInputType.text,
      onTap: () {
        context.push(AppRouter.kSearch);
      },

      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 16, right: 8, top: 14, bottom: 14),
        child: SvgPicture.asset(
          AssetsData.searchSvg,
          width: 24.r,
          height: 24.r,
        ),
      ),

      suffixIcon: GestureDetector(
        //! منشان  خلّي المنطقة كلها تستقبل الضغط
        behavior: HitTestBehavior.translucent,
        onTap: () {
          context.push(AppRouter.kFillter);
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 14, bottom: 14, right: 16),
          child: SvgPicture.asset(
            AssetsData.iconFilterSvg,
            width: 24.r,
            height: 24.r,
          ),
        ),
      ),

      hintStyle: Styles.textStyle14W400Inter.copyWith(
        color: AppColors.textSecondary,
      ),
    );
  }
}
