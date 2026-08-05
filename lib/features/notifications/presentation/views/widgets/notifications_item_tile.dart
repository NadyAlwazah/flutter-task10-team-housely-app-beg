import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';

Widget buildDivider() {
  return Padding(
    padding: EdgeInsets.only(top: 12.h, left: 48.w),
    child: Container(
      width: double.infinity,
      height: 2.h,
      margin: EdgeInsets.only(top: 12.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(color: AppColors.lightGrayBackground, width: 0.5.w),
      ),
    ),
  );
}

Widget buildNotificationBellIcon({required String assetPath}) {
  return Container(
    width: 36.w,
    height: 36.h,
    decoration: const BoxDecoration(
      color: AppColors.iconContainerBackground,
      shape: BoxShape.circle,
    ),
    child: Stack(
      children: [
        Positioned(
          top: 6.h,
          left: 6.w,
          child: SvgPicture.asset(
            assetPath,
            colorFilter: const ColorFilter.mode(
              AppColors.chatPurple,
              BlendMode.srcIn,
            ),
            width: 24.w,
            height: 24.h,
          ),
        ),
        Positioned(
          top: 4.h,
          left: 23.w,
          child: Container(
            width: 4.w,
            height: 4.h,
            decoration: const BoxDecoration(
              color: AppColors.statusRed,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    ),
  );
}

enum NotificationImageType { svg, png }

class NotificationItemTile extends StatelessWidget {
  final String imagePath;
  final NotificationImageType imageType;
  final bool hasRedDot;
  final InlineSpan textSpan;

  const NotificationItemTile({
    super.key,
    required this.imagePath,
    required this.textSpan,
    this.imageType = NotificationImageType.svg,
    this.hasRedDot = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (hasRedDot && imageType == NotificationImageType.svg)
              buildNotificationBellIcon(assetPath: imagePath)
            else if (imageType == NotificationImageType.png)
              Container(
                width: 36.w,
                height: 36.h,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.r),
                  child: Image.asset(
                    imagePath,
                    width: 36.w,
                    height: 36.h,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
              Container(
                width: 36.w,
                height: 36.h,
                decoration: const BoxDecoration(
                  color: AppColors.iconContainerBackground,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    imagePath,
                    width: 24.w,
                    height: 24.h,
                    colorFilter: const ColorFilter.mode(
                      AppColors.chatPurple,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),

            SizedBox(width: 12.w),

            Expanded(child: RichText(text: textSpan)),
          ],
        ),
        buildDivider(),
        SizedBox(height: 12.h),
      ],
    );
  }
}
