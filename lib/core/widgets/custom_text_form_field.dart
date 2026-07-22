import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.controller,
    this.hintStyle,
    this.prefixIcon,
    this.onTap,
  });
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final TextInputType textInputType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextStyle? hintStyle;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isObscured;

  @override
  void initState() {
    super.initState();
    isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: isObscured,
      onTap: widget.onTap,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  isObscured ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.textSecondary,
                ),
                onPressed: () {
                  setState(() {
                    isObscured = !isObscured;
                  });
                },
              )
            : widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ?? Styles.textStyle14W400Inter,
        filled: true,
        fillColor: Colors.white,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(borderColor: AppColors.primary),
      ),
    );
  }

  OutlineInputBorder buildBorder({
    Color borderColor = const Color(0xFFD2D6DB),
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(width: 1, color: borderColor),
    );
  }
}
