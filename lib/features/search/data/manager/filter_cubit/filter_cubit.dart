import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/data/models/filter_request.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  List<String> lookingFor = [];
  List<String> propertyTypes = [];
  double minPrice = 0;
  double maxPrice = 100000;
  List<String> facilities = [];

  FilterCubit() : super(FilterInitial());

  // تحديث القيم
  void toggleLookingFor(String value) {
    lookingFor.contains(value)
        ? lookingFor.remove(value)
        : lookingFor.add(value);
  }

  void togglePropertyType(String value) {
    propertyTypes.contains(value)
        ? propertyTypes.remove(value)
        : propertyTypes.add(value);
  }

  void updatePrice(double min, double max) {
    minPrice = min;
    maxPrice = max;
  }

  void toggleFacility(String value) {
    facilities.contains(value)
        ? facilities.remove(value)
        : facilities.add(value);
  }

  // Apply زر
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

  // Reset زر
  void reset() {
    lookingFor = [];
    propertyTypes = [];
    minPrice = 0;
    maxPrice = 100000;
    facilities = [];

    emit(FilterInitial());
  }
}
