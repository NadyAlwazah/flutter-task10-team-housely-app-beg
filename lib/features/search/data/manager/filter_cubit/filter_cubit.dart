import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/data/models/filter_request.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  static const double defaultMinPrice = 300;
  static const double defaultMaxPrice = 1100;

  List<String> lookingFor = [];
  List<String> propertyTypes = [];
  List<String> facilities = [];

  double minPrice = defaultMinPrice;
  double maxPrice = defaultMaxPrice;

  FilterCubit() : super(FilterInitial());

  void toggleLookingFor(String value) {
    final newList = List<String>.from(lookingFor);

    if (newList.contains(value)) {
      newList.remove(value);
    } else {
      newList.add(value);
    }

    lookingFor = newList;
    emit(FilterInitial());
  }

  void togglePropertyType(String value) {
    final newList = List<String>.from(propertyTypes);

    if (newList.contains(value)) {
      newList.remove(value);
    } else {
      newList.add(value);
    }

    propertyTypes = newList;
    emit(FilterInitial());
  }

  void toggleFacility(String value) {
    final newList = List<String>.from(facilities);

    if (newList.contains(value)) {
      newList.remove(value);
    } else {
      newList.add(value);
    }

    facilities = newList;
    emit(FilterInitial());
  }

  void updatePrice(double min, double max) {
    minPrice = min;
    maxPrice = max;

    emit(FilterInitial());
  }

  void reset() {
    lookingFor = [];
    propertyTypes = [];
    facilities = [];

    minPrice = defaultMinPrice;
    maxPrice = defaultMaxPrice;

    emit(FilterInitial());
  }

  Future<void> applyFilters() async {
    emit(FilterLoading());

    try {
      await Future.delayed(const Duration(seconds: 1));

      final request = FilterRequest(
        lookingFor: lookingFor,
        propertyTypes: propertyTypes,
        minPrice: minPrice,
        maxPrice: maxPrice,
        facilities: facilities,
      );

      emit(FilterSuccess(request));
    } catch (e) {
      emit(FilterError(e.toString()));
    }
  }
}
