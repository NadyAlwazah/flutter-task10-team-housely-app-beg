import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/review_model.dart';

class PropertyModel {
  final int id;
  final String title;
  final String location;
  final String image;
  final double pricePerMonth;
  final double rating;
  final int bedrooms;
  final int bathrooms;
  final int buildYear;
  final int parking;
  final double area;
  final String status;
  final String description;
  final List<ReviewModel> reviews;
  final bool isFavorite;

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
    this.isFavorite = false,
  });

  PropertyModel copyWith({bool? isFavorite}) {
    return PropertyModel(
      id: id,
      title: title,
      location: location,
      image: image,
      pricePerMonth: pricePerMonth,
      rating: rating,
      bedrooms: bedrooms,
      bathrooms: bathrooms,
      buildYear: buildYear,
      parking: parking,
      area: area,
      status: status,
      description: description,
      reviews: reviews,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
