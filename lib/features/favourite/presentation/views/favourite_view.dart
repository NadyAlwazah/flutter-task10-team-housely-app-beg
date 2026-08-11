import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/features/favourite/presentation/views/widgets/favourite_view_body.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key, required this.onBackToHome});
  final VoidCallback onBackToHome;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: FavouriteViewBody(onBackToHome: onBackToHome));
  }
}
