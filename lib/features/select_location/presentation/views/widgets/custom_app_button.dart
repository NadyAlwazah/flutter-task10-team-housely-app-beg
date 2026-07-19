import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';

class CustomAppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final bool isOutlined;
  final double borderRadius;
  final TextStyle textStyle;

  const CustomAppButton({super.key, 
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.primary, 
    this.textColor = Colors.white,
    this.isOutlined = false,
    this.borderRadius = 8.0,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined ? Colors.transparent : backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
        
          side: const BorderSide(
            color: AppColors.primary, 
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
        ),
        onPressed: onPressed,
        child: Text(text,
        style: textStyle,),
      ),
    );
  }
}