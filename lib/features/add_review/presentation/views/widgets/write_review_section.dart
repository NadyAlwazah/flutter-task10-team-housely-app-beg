import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'dashed_box.dart';
import 'package:flutter/material.dart';

class WriteReviewSection extends StatefulWidget {
  final TextEditingController controller;
  final int maxCharacters;

  const WriteReviewSection({
    super.key,
    required this.controller,
    this.maxCharacters = 350,
  });

  @override
  State<WriteReviewSection> createState() => _WriteReviewSectionState();
}

class _WriteReviewSectionState extends State<WriteReviewSection> {
  late int _remainingCharacters;

  @override
  void initState() {
    super.initState();

    _remainingCharacters = widget.maxCharacters - widget.controller.text.length;

    widget.controller.addListener(_updateRemainingCharacters);
  }

  void _updateRemainingCharacters() {
    setState(() {
      _remainingCharacters =
          widget.maxCharacters - widget.controller.text.length;
      if (_remainingCharacters < 0) {
        _remainingCharacters = 0;
      }
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateRemainingCharacters);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Write your review', style: Styles.textStyle16W600Inter),
        SizedBox(height: 16.h),

        DashedBox(
          width: double.infinity,
          height: 140.h,
          borderRadius: 12.r,
          borderWidth: 1,
          color: AppColors.borderGray,
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: TextField(
              controller: widget.controller,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              inputFormatters: [
                LengthLimitingTextInputFormatter(widget.maxCharacters),
              ],
              decoration: InputDecoration(
                hintText:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard',
                hintStyle: Styles.textStyle12W400Inter.copyWith(
                  color: AppColors.textSecondary,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),

        SizedBox(height: 8.h),

        Align(
          alignment: Alignment.centerRight,
          child: Text(
            '$_remainingCharacters characters remaining',
            style: Styles.textStyle12W400Inter.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
