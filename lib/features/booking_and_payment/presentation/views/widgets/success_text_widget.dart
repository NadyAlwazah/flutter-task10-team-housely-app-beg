import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class SuccessTextWidget extends StatelessWidget {
  const SuccessTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Yey, your booking success',
          style: Styles.textStyle20W600Inter,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 12.h),
        Text(
          'you have successfully booked a property,\nenjoy your property',
          style: Styles.textStyle14W400Inter,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
