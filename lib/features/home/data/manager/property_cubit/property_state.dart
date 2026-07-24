import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';

class PropertyState {
  final List<PropertyModel> recommended;
  final List<PropertyModel> popular;

  PropertyState({required this.recommended, required this.popular});

  PropertyState copyWith({
    List<PropertyModel>? recommended,
    List<PropertyModel>? popular,
  }) {
    return PropertyState(
      recommended: recommended ?? this.recommended,
      popular: popular ?? this.popular,
    );
  }
}

class PropertyInitial extends PropertyState {
  PropertyInitial() : super(recommended: [], popular: []);
}
