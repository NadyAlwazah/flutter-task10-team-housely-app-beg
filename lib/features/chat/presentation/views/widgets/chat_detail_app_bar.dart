import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/chat/presentation/model/user_chat_model.dart';

class ChatDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final UserChatModel user;

  const ChatDetailAppBar({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,

      leadingWidth: 48.w,

      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back,
          color: AppColors.textPrimary,
          size: 24.r,
        ),
      ),

      titleSpacing: 0,

      title: Row(
        children: [
          Container(
            width: 44.r,
            height: 44.r,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              user.image,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.person,
                  size: 28.r,
                );
              },
            ),
          ),

          SizedBox(width: 8.w),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle12W600Inter,
                ),

                SizedBox(height: 2.h),

                Row(
                  children: [
                    Container(
                      width: 8.r,
                      height: 8.r,
                      decoration: const BoxDecoration(
                        color: AppColors.greenOnlineContainer,
                        shape: BoxShape.circle,
                      ),
                    ),

                    SizedBox(width: 4.w),

                    Text(
                      user.isOnline ? 'Online' : 'Offline',
                      style: Styles.textStyle10W400Inter.copyWith(
                        color: AppColors.textchatSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

      actions: [
        _buildIconButton(
          iconPath: AssetsData.iconCallSvg,
          onTap: () {},
        ),

        SizedBox(width: 8.w),

        _buildIconButton(
          iconPath: AssetsData.iconVideoSvg,
          onTap: () {},
        ),

        SizedBox(width: 24.w),
      ],
    );
  }

  Widget _buildIconButton({
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36.r,
        height: 36.r,
        decoration: const BoxDecoration(
          color: AppColors.callContainer,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          iconPath,
          width: 24.r,
          height: 24.r,
          colorFilter: const ColorFilter.mode(
            AppColors.chatMessageContainer,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}