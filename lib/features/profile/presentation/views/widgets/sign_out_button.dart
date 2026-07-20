import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:go_router/go_router.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            animType: AnimType.scale,
            title: 'Sign Out',
            desc: 'Are you sure you want to sign out?',
            btnCancelText: 'Cancel',
            btnCancelOnPress: () {},
            btnOkText: 'Sign Out',
            btnOkOnPress: () async {
              final local = getIt<AuthLocalDataSource>();
              final router = GoRouter.of(context);
              // حذف بيانات المستخدم
              await local.clearUserData();

              // الانتقال لصفحة تسجيل الدخول
              router.go(AppRouter.kSignin);
            },
          ).show();
        },
        child: Text(
          'Sign Out',
          style: Styles.textStyle16W500Inter.copyWith(
            color: const Color(0xFFF97066),
          ),
        ),
      ),
    );
  }
}
