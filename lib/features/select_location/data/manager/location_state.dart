import 'package:flutter_task10_team_housely_app_beg/features/explore/presentation/model/place_model.dart';
import 'package:latlong2/latlong.dart';

class LocationState {
  final bool isLoading;

  /// عنوان الموقع الحالي
  final String address;

  /// مركز الخريطة الحالي
  final LatLng center;

  /// الأماكن القريبة (مطاعم، مقاهي...)
  final List<PlaceModel> nearbyPlaces;

  /// يستخدم لمعرفة هل تم اختيار موقع صالح
  final bool hasSelectedLocation;

  /// رسالة خطأ إن وجدت
  final String? errorMessage;

  const LocationState({
    required this.isLoading,
    required this.address,
    required this.center,
    required this.nearbyPlaces,
    required this.hasSelectedLocation,
    this.errorMessage,
  });

  factory LocationState.initial() {
    return const LocationState(
      isLoading: false,
      address: "Getting current location...",
      center: LatLng(-7.7956, 110.3695),
      nearbyPlaces: [],
      hasSelectedLocation: false,
      errorMessage: null,
    );
  }

  LocationState copyWith({
    bool? isLoading,
    String? address,
    LatLng? center,
    List<PlaceModel>? nearbyPlaces,
    bool? hasSelectedLocation,
    String? errorMessage,
  }) {
    return LocationState(
      isLoading: isLoading ?? this.isLoading,
      address: address ?? this.address,
      center: center ?? this.center,
      nearbyPlaces: nearbyPlaces ?? this.nearbyPlaces,
      hasSelectedLocation:
          hasSelectedLocation ?? this.hasSelectedLocation,
      errorMessage: errorMessage,
    );
  }
}