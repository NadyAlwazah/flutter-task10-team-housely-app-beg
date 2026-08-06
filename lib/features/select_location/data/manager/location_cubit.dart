import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/location_data.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/location_service.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/models/user_model.dart';
import 'package:flutter_task10_team_housely_app_beg/features/select_location/data/manager/location_state.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationService _locationService;
  final AuthLocalDataSource _authLocalDataSource;

  final MapController mapController = MapController();
  LatLng? currentUserLocation;
  Timer? _debounceTimer;

  LocationCubit(this._locationService, this._authLocalDataSource)
    : super(LocationState.initial());

  Future<void> initialize({bool loadNearby = false}) async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      final LocationData location = await _locationService.getCurrentLocation();

      currentUserLocation = location.location;

      emit(
        state.copyWith(
          isLoading: false,
          address: location.address,
          center: location.location,
          hasSelectedLocation: true,
        ),
      );

      mapController.move(location.location, 15);

      if (loadNearby) {
        await loadNearbyPlaces(location.location);
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> useCurrentLocation() async {
    await initialize();
  }

  Future<bool> checkLocationEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  void onMapMoved(LatLng newCenter, {bool loadNearby = false}) {
    emit(state.copyWith(center: newCenter));

    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 700), () async {
      await updateAddress(newCenter);

      if (loadNearby) {
        await loadNearbyPlaces(newCenter);
      }
    });
  }

  Future<void> updateAddress(LatLng location) async {
    try {
      final String address = await _locationService.getAddressFromLatLng(
        location,
      );

      emit(state.copyWith(address: address));
    } catch (e) {
      emit(state.copyWith(address: "Unable to get address"));
    }
  }

  Future<void> loadNearbyPlaces(LatLng location) async {
    try {
      final places = await _locationService.getNearbyPlaces(location);

      emit(state.copyWith(nearbyPlaces: places));
    } catch (e) {
      emit(state.copyWith(nearbyPlaces: []));
    }
  }

  Future<void> saveSelectedLocation() async {
    try {
      final UserModel? user = await _authLocalDataSource.getUser();

      if (user == null) {
        return;
      }

      final UserModel updatedUser = UserModel(
        fullName: user.fullName,
        email: user.email,
        rememberMe: user.rememberMe,
        dateOfBirth: user.dateOfBirth,
        myLocation: state.address,
      );

      await _authLocalDataSource.saveUser(updatedUser);

      emit(state.copyWith(hasSelectedLocation: true));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  void moveMap(LatLng location) {
    mapController.move(location, 15);

    emit(state.copyWith(center: location));
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    mapController.dispose();
    return super.close();
  }
}
