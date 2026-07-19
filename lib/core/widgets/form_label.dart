import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class FormLabel extends StatelessWidget {
  final String text;

  const FormLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Styles.textStyle14W600Inter);
  }
}
