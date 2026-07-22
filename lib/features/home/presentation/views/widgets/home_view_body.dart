import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/home_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 24, right: 24, top: 16),
      child: CustomScrollView(
        slivers: [SliverToBoxAdapter(child: HomeAppBar())],
      ),
    );
  }
}
