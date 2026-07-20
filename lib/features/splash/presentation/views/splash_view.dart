import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/app_initializer.dart';
import 'package:go_router/go_router.dart';
import 'widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToOnBoarding();
  }

  void _navigateToOnBoarding() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      context.go(AppInitializer.nextRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashViewBody());
  }
}
