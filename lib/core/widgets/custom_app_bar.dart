import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? action;
  final VoidCallback? onTapAction;
  final VoidCallback? onTapLeading;
  final bool isActionIcon;
  final Widget? leadingSvg;

  const CustomAppBar({
    super.key,
    this.title,
    this.action,
    this.onTapAction,
    this.isActionIcon = true,
    this.onTapLeading,
    this.leadingSvg,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,

      elevation: 0,

      // leading
      leading: GestureDetector(
        onTap: onTapLeading,
        child: const Icon(
          Icons.arrow_back_rounded,
          color: AppColors.textPrimary,
        ),
      ),
      centerTitle: true,

      //title
      title: Text(title ?? '', style: Styles.textStyle16W600Inter),

      //actions
      actions: [
        if (action != null)
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: GestureDetector(
              onTap: onTapAction,
              child: isActionIcon
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(33.r),
                        border: Border.all(
                          color: const Color(0xFFD2D6DB),
                          width: 1,
                        ),
                        color: Colors.white,
                      ),
                      child: action,
                    )
                  : action,
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
