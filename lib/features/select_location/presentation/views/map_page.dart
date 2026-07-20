import 'dart:async';
import 'dart:convert';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_task10_team_housely_app_beg/features/select_location/data/manager/location_cubit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';


import 'widgets/map_page_body.dart';
class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LocationCubit(
        AuthLocalDataSource(),
      ),
      child: const _MapPageView(),
    );
  }
}

class _MapPageView extends StatefulWidget {
  const _MapPageView();

  @override
  State<_MapPageView> createState() => _MapPageViewState();
}

class _MapPageViewState extends State<_MapPageView> {
  final MapController _mapController = MapController();

  String _currentAddress = 'Getting current location...';

  LatLng _center = const LatLng(
    -7.7956,
    110.3695,
  );

  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getCurrentLocation();
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    try {
      final bool serviceEnabled =
          await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        _updateAddress(
          'Location service is disabled',
        );
        return;
      }

      LocationPermission permission =
          await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission =
            await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        _updateAddress(
          'Location permission denied',
        );
        return;
      }

      if (permission ==
          LocationPermission.deniedForever) {
        _updateAddress(
          'Location permission permanently denied',
        );
        return;
      }

      final Position position =
          await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      final LatLng currentLocation = LatLng(
        position.latitude,
        position.longitude,
      );

      debugPrint(
        'Current coordinates: '
        '${position.latitude}, ${position.longitude}',
      );

      if (!mounted) return;

      setState(() {
        _center = currentLocation;
      });

      _mapController.move(
        currentLocation,
        15,
      );

      await _getAddress(currentLocation);
    } catch (e) {
      debugPrint(
        'Current location error: $e',
      );

      _updateAddress(
        'Unable to get current location',
      );
    }
  }

  Future<void> _getAddress(
    LatLng position,
  ) async {
    try {
      final Uri url = Uri.parse(
        'https://nominatim.openstreetmap.org/reverse'
        '?lat=${position.latitude}'
        '&lon=${position.longitude}'
        '&format=json'
        '&addressdetails=1',
      );

      final response = await http.get(
        url,
        headers: {
          'User-Agent': 'Team-Housely-Flutter-App',
        },
      );

      if (response.statusCode != 200) {
        _updateAddress(
          'Unable to get address',
        );
        return;
      }

      final Map<String, dynamic> data =
          jsonDecode(response.body);

      final String? displayName =
          data['display_name'];

      if (displayName != null &&
          displayName.isNotEmpty) {
        _updateAddress(displayName);

        debugPrint(
          'Current address: $displayName',
        );
      } else {
        _updateAddress(
          'Address not found',
        );
      }
    } catch (e) {
      debugPrint(
        'Reverse geocoding error: $e',
      );

      _updateAddress(
        'Unable to get address',
      );
    }
  }

  void _updateAddress(String address) {
    if (!mounted) return;

    setState(() {
      _currentAddress = address;
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,

            options: MapOptions(
              initialCenter: _center,
              initialZoom: 15,

              onPositionChanged: (
                position,
                hasGesture,
              ) {
                if (
                    hasGesture &&
                    position.center != null) {
                  final LatLng newCenter =
                      position.center!;

                  setState(() {
                    _center = newCenter;
                  });

                  _debounceTimer?.cancel();

                  _debounceTimer = Timer(
                    const Duration(
                      milliseconds: 700,
                    ),
                    () {
                      _getAddress(newCenter);
                    },
                  );
                }
              },
            ),

            children: [
            TileLayer(
               urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
               userAgentPackageName: 'com.example.flutter_task10_team_housely_app_beg',
               ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: _center,

                    child: const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),

          MapPageBody(
            address: _currentAddress,

            onChooseLocation: () async {
              if (
                  _currentAddress.isEmpty ||
                  _currentAddress ==
                      'Getting current location...' ||
                  _currentAddress ==
                      'Unable to get current location') {
                return;
              }

              await context
                  .read<LocationCubit>()
                  .updateLocation(
                    _currentAddress,
                  );

              if (context.mounted) {
                context.go('/home');
              }
            },
          ),
        ],
      ),
    );
  }
}