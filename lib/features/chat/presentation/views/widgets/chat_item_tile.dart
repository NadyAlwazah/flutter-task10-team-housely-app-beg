import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class ChatItemTile extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String image;
  final VoidCallback? onTap; 
  final VoidCallback onDeletePressed;

  const ChatItemTile({
    Key? key,
    required this.name,
    required this.message,
    required this.time,
    required this.image,
    this.onTap,
    required this.onDeletePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(name),
      endActionPane: ActionPane(
        extentRatio: 110 / 375, 
        motion: const ScrollMotion(),
        children: [
          const SizedBox(width: 4),
          CustomSlidableAction(
            onPressed: (_) {},
            padding: EdgeInsets.zero,
            backgroundColor: AppColors.greyDeleteContainer,
            child: const _SlidableActionButton(
              iconPath: AssetsData.iconMoreSvg,
              label: 'More',
              iconColor: Colors.white,
            ),
          ),
          CustomSlidableAction(
            onPressed: (_) {
              onDeletePressed();
            },
            padding: EdgeInsets.zero,
            backgroundColor: AppColors.chatMessageContainer,
            child: const _SlidableActionButton(
              iconPath: AssetsData.iconDeleteOutlineSvg,
              label: 'Delete',
              iconColor: Colors.white,
            ),
          ),
        ],
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            behavior: HitTestBehavior.opaque, 
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 44.r,
                    height: 44.r,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.person, size: 28.r),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              name,
                              style: Styles.textStyle14W600Inter.copyWith(color: AppColors.textPrimary),
                            ),
                            Text(
                              time,
                              style: Styles.textStyle12W500Inter.copyWith(
                                fontSize: 10.sp, color: AppColors.textSecondary),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          message,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle12W400Inter.copyWith(color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Center(
            child: Container(
              width: 271.w,
              height: 0.5.h,
              color: AppColors.chatMessage2Container,
            ),
          ),
        ],
      ),
    );
  }
}

class _SlidableActionButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final Color iconColor;

  const _SlidableActionButton({
    Key? key,
    required this.iconPath,
    required this.label,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55.w,
      height: 72.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 20.r,
            height: 20.r,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: Styles.textStyle10W400Inter.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}