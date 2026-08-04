import 'package:flutter/material.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_app_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/add_review/presentation/views/widgets/add_review_view_body.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/review_model.dart';

class AddReviewView extends StatelessWidget {
  final PropertyModel? property;
  final Function(ReviewModel newReview)? onReviewAdded;

  const AddReviewView({
    super.key,
     this.property,
    this.onReviewAdded,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Write a review',
        onTapLeading: () => Navigator.pop(context),
      ),
      body: AddReviewViewBody(
        property: property,
        onReviewAdded: onReviewAdded,
      ),
    );
  }
}