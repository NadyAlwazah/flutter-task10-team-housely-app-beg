import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';

class PropertyState {
  final List<PropertyModel> recommended;
  final List<PropertyModel> popular;
  final List<PropertyModel> nearbyProperties;

  final List<PropertyModel>? filteredProperties;
  final List<PropertyModel>? recentSearches;

  PropertyState({
    required this.recommended,
    required this.popular,
    required this.nearbyProperties,
    this.filteredProperties,
    this.recentSearches,
  });

  PropertyState copyWith({
    List<PropertyModel>? recommended,
    List<PropertyModel>? popular,
    List<PropertyModel>? nearbyProperties,
    List<PropertyModel>? filteredProperties,
    List<PropertyModel>? recentSearches,
  }) {
    return PropertyState(
      recommended: recommended ?? this.recommended,
      popular: popular ?? this.popular,
      nearbyProperties: nearbyProperties ?? this.nearbyProperties,
      filteredProperties: filteredProperties ?? this.filteredProperties,
      recentSearches: recentSearches ?? this.recentSearches,
    );
  }
}

class PropertyInitial extends PropertyState {
  PropertyInitial()
    : super(
        recommended: [],
        popular: [],
        nearbyProperties: [],
        filteredProperties: [],
        recentSearches: [],
      );
}
