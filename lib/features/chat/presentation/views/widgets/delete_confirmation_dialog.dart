import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final VoidCallback onDeleteConfirm;

  const DeleteConfirmationDialog({
    Key? key,
    required this.onDeleteConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 11.h),
          Container(
            width: 42.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.10),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(height: 40.h),
          Container(
            width: 120.r,
            height: 120.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFF4EBFF),
                width: 9.81.r,
              ),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              AssetsData.iconDeleteSvg,
              width: 66.r,
              height: 66.r,
              colorFilter: const ColorFilter.mode(
                AppColors.chatMessageContainer,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'Are you sure you want to\ndelete this message ?',
            textAlign: TextAlign.center,
            style: Styles.textStyle20W600Inter.copyWith(color: AppColors.textPrimary),
          ),
          SizedBox(height: 16.h),
          Text(
            'the message will be deleted from this\ndevice',
            textAlign: TextAlign.center,
            style: Styles.textStyle14W400Inter.copyWith(color: AppColors.textSecondary),
          ),
          SizedBox(height: 40.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _DialogButton(
                text: 'Cancel',
                backgroundColor: AppColors.primary,
                pressedColor: AppColors.primary,
                textColor: Colors.white,
                onTap: () => Navigator.pop(context),
              ),
              SizedBox(width: 16.w),
              _DialogButton(
                text: 'Delete',
                backgroundColor: AppColors.greyDeleteContainer,
                pressedColor: AppColors.primary,
                textColor: Colors.white,
                onTap: () {
                  Navigator.pop(context);
                  onDeleteConfirm();
                },
              ),
            ],
          ),
          SizedBox(height: 60.h),
        ],
      ),
    );
  }
}

class _DialogButton extends StatefulWidget {
  final String text;
  final Color backgroundColor;
  final Color pressedColor;
  final Color textColor;
  final VoidCallback onTap;

  const _DialogButton({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.pressedColor,
    required this.textColor,
    required this.onTap,
  }) : super(key: key);

  @override
  State<_DialogButton> createState() => _DialogButtonState();
}

class _DialogButtonState extends State<_DialogButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: 132.w,
        height: 52.h,
        decoration: BoxDecoration(
          color: _isPressed ? widget.pressedColor : widget.backgroundColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.text,
          style: Styles.textStyle18W400Inter.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}