import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:go_router/go_router.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  String _formatLocation(String? raw) {
    if (raw == null || raw.isEmpty) return "Set location";

    final parts = raw.split(",");
    if (parts.length < 2) return raw;

    final country = parts.last.trim();
    String governorate = parts[parts.length - 2].trim();

    governorate = governorate.replaceAll("Governorate", "").trim();

    return "$governorate, $country";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getIt<AuthLocalDataSource>().getUser(),
      builder: (context, snapshot) {
        final user = snapshot.data;
        final location = _formatLocation(user?.myLocation);

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // LOCATION
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Location",
                          style: Styles.textStyle12W500Inter.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 16.r,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AssetsData.iconLocationSvg,
                          width: 24.r,
                          height: 24.r,
                        ),
                        SizedBox(width: 8.w),
                        GestureDetector(
                          onTap: () {
                            if (location == "Set location") {
                              context.go(AppRouter.kSelectLocation);
                            }
                          },
                          child: Text(
                            location,
                            style: Styles.textStyle16W600Inter,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            // NOTIFICATIONS + CHAT
            Row(
              children: [
                _CircleIconButton(
                  icon: AssetsData.iconNotificationSvg,
                  showDot: true,
                  onTap: () => context.push(AppRouter.kNotifications),
                ),
                SizedBox(width: 8.w),
                _CircleIconButton(
                  icon: AssetsData.iconChatSvg,
                  onTap: () => context.push(AppRouter.kChatList),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final String icon;
  final bool showDot;
  final VoidCallback? onTap;

  const _CircleIconButton({
    required this.icon,
    this.showDot = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 44.r,
            height: 44.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFD2D6DB)),
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: 24.r,
                height: 24.r,
                colorFilter: const ColorFilter.mode(
                  AppColors.textPrimary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
        if (showDot)
          Positioned(
            top: 6,
            right: 7,
            child: Container(
              width: 8.r,
              height: 8.r,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}
