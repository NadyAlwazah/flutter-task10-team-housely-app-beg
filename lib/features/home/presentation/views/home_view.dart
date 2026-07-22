import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: HomeViewBody());
  }
}
