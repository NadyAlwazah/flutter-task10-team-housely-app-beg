import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/review_model.dart';

class PropertyModel {
  final String id;
  final String title;
  final String location;
  final String image;
  final double pricePerMonth;
  final double rating;
  final int bedrooms;
  final int bathrooms;
  final int buildYear;
  final String parking;
  final String area;
  final String status;
  final String description;
  final List<ReviewModel> reviews;

  PropertyModel({
    required this.id,
    required this.title,
    required this.location,
    required this.image,
    required this.pricePerMonth,
    required this.rating,
    required this.bedrooms,
    required this.bathrooms,
    required this.buildYear,
    required this.parking,
    required this.area,
    required this.status,
    required this.description,
    required this.reviews,
  });
}
