import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_app_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/review_model.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/widgets/review_details_view_body.dart';
import 'package:go_router/go_router.dart';

class ReviewDetailsView extends StatelessWidget {
  const ReviewDetailsView({super.key, required this.review});

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Review Details',
        onTapLeading: () {
          context.pop();
        },
      ),
      body: ReviewDetailsViewBody(review: review),
    );
  }
}
