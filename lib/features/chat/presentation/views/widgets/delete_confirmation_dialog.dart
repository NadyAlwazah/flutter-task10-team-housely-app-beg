import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class DeleteConfirmationDialog extends StatefulWidget {
  final Future<void> Function() onDeleteConfirm;
  final String titleText;
  final String subtitleText;

  const DeleteConfirmationDialog({
    super.key,
    required this.onDeleteConfirm,
    this.titleText = 'Are you sure you want to\ndelete this message ?',

    this.subtitleText = 'the message will be deleted from this\ndevice',
  });

  @override
  State<DeleteConfirmationDialog> createState() =>
      _DeleteConfirmationDialogState();
}

class _DeleteConfirmationDialogState extends State<DeleteConfirmationDialog> {
  bool _isLoading = false;

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
                color: AppColors.lavenderContainer,
                width: 9.81.r,
              ),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              AssetsData.iconDeleteSvg,
              width: 66.r,
              height: 66.r,
              colorFilter: const ColorFilter.mode(
                AppColors.chatPurple,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            widget.titleText,
            textAlign: TextAlign.center,
            style: Styles.textStyle20W600Inter.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            widget.subtitleText,
            textAlign: TextAlign.center,
            style: Styles.textStyle14W400Inter.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 40.h),
          if (_isLoading)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: const CircularProgressIndicator(
                color: AppColors.chatPurple,
              ),
            )
          else
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
                  backgroundColor: AppColors.borderGray,
                  pressedColor: AppColors.primary,
                  textColor: Colors.white,
                  onTap: () async {
                    setState(() {
                      _isLoading = true;
                    });

                    await widget.onDeleteConfirm();
                    if (mounted) {
                      Navigator.pop(context);
                    }
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
