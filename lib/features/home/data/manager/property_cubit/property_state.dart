import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';

class PropertyState {
  final List<PropertyModel> recommended;
  final List<PropertyModel> popular;
  final List<PropertyModel> nearbyProperties;

  PropertyState({
    required this.recommended,
    required this.popular,
    required this.nearbyProperties,
  });

  PropertyState copyWith({
    List<PropertyModel>? recommended,
    List<PropertyModel>? popular,
    List<PropertyModel>? nearbyProperties,
  }) {
    return PropertyState(
      recommended: recommended ?? this.recommended,
      popular: popular ?? this.popular,
      nearbyProperties: nearbyProperties ?? this.nearbyProperties,
    );
  }
}

class PropertyInitial extends PropertyState {
  PropertyInitial() : super(recommended: [], popular: [], nearbyProperties: []);
}
