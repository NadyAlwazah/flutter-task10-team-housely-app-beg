import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/widgets/custom_check_box.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomCheckBox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value;
              widget.onChanged(value);
            });
          },
        ),
        const SizedBox(width: 8),
        Text(
          "Remember me",
          style: Styles.textStyle14W400Inter.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
