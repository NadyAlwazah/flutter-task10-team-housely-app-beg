import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onTapLeading;
  final Widget? leadingSvg;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.title,
    this.onTapLeading,
    this.leadingSvg,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,

      elevation: 0,

      // leading
      leading: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: GestureDetector(
          onTap: onTapLeading,
          child: const Icon(
            Icons.arrow_back_rounded,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      centerTitle: true,

      //title
      title: Text(title ?? '', style: Styles.textStyle16W600Inter),

      //actions
      actions: actions != null
          ? actions!.map((widget) {
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: widget,
              );
            }).toList()
          : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
