import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class OtpFields extends StatefulWidget {
  const OtpFields({super.key, required this.length});
  final int length;

  @override
  State<OtpFields> createState() => OtpFieldsState();
}

class OtpFieldsState extends State<OtpFields> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();

    controllers = List.generate(widget.length, (_) => TextEditingController());
    focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  bool validateOtp() {
    for (var controller in controllers) {
      if (controller.text.trim().isEmpty) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        widget.length,
        (index) => SizedBox(
          width: 60.r,
          height: 60.r,
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            style: Styles.textStyle20W600Inter.copyWith(
              fontWeight: FontWeight.w700,
            ),
            decoration: InputDecoration(
              counterText: '',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: Color(0xFFD2D6DB)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1,
                ),
              ),
            ),

            onChanged: (value) {
              if (value.isNotEmpty) {
                // انتقل للحقل التالي
                if (index < widget.length - 1) {
                  FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                } else {
                  // آخر حقل
                  FocusScope.of(context).unfocus();
                }
              } else {
                // رجوع للحقل السابق عند الحذف
                if (index > 0) {
                  FocusScope.of(context).requestFocus(focusNodes[index - 1]);
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
