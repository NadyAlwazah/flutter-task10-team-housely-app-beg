import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_text_form_field.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_cubit.dart';

class SearchPropertyField extends StatelessWidget {
  const SearchPropertyField({
    super.key,
    required this.hintText,
    this.onTap,
    this.onTapSuffix,
    this.suffixIcon,
  });
  final String hintText;
  final VoidCallback? onTap;
  final VoidCallback? onTapSuffix;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onChanged: (value) {
        context.read<PropertyCubit>().search(value);
      },
      hintText: hintText,
      textInputType: TextInputType.text,
      onTap: onTap,
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
        onTap: onTapSuffix,
        child: Padding(
          padding: const EdgeInsets.only(top: 14, bottom: 14, right: 16),
          child: suffixIcon,
        ),
      ),

      hintStyle: Styles.textStyle14W400Inter.copyWith(
        color: AppColors.textSecondary,
      ),
    );
  }
}
