import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_task10_team_housely_app_beg/features/select_location/data/manager/location_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/select_location/data/location_search_service.dart';

import 'widgets/map_page_body.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final LocationSearchService _searchService = LocationSearchService();

  final MapController _mapController = MapController();

  List<LocationResult> _searchResults = [];

  String _currentAddress = 'Getting current location...';

  LatLng _center = const LatLng(-7.7956, 110.3695);

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
      final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        debugPrint('Location service is disabled');

        if (mounted) {
          setState(() {
            _currentAddress = 'Location service is disabled';
          });
        }

        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          debugPrint('Location permission denied');

          if (mounted) {
            setState(() {
              _currentAddress = 'Location permission denied';
            });
          }

          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        debugPrint('Location permission permanently denied');

        if (mounted) {
          setState(() {
            _currentAddress = 'Location permission permanently denied';
          });
        }

        return;
      }

      final Position position = await Geolocator.getCurrentPosition(
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

      _mapController.move(currentLocation, 15);

      await _getAddress(currentLocation);
    } catch (e, stackTrace) {
      debugPrint('Current location error: $e');

      debugPrint(stackTrace.toString());

      if (mounted) {
        setState(() {
          _currentAddress = 'Unable to get current location';
        });
      }
    }
  }

  Future<void> _searchLocation(String query) async {
    if (query.trim().isEmpty) return;

    try {
      final List<LocationResult> results = await _searchService.searchLocation(
        query.trim(),
      );

      if (!mounted) return;

      setState(() {
        _searchResults = results;
      });
    } catch (e) {
      debugPrint('Search error: $e');
    }
  }

  void _selectLocation(LocationResult result) {
    final LatLng selectedLocation = LatLng(result.latitude, result.longitude);

    setState(() {
      _center = selectedLocation;

      _currentAddress = result.displayName;

      _searchResults = [];
    });

    _mapController.move(selectedLocation, 15);
  }

  Future<void> _getAddress(LatLng position) async {
    try {
      final url = Uri.parse(
        'https://nominatim.openstreetmap.org/reverse'
        '?lat=${position.latitude}'
        '&lon=${position.longitude}'
        '&format=json'
        '&addressdetails=1',
      );

      final response = await http.get(
        url,
        headers: {'User-Agent': 'Team-Housely-Flutter-App'},
      );

      if (response.statusCode != 200) {
        debugPrint('Reverse geocoding failed: ${response.statusCode}');
        return;
      }

      final data = jsonDecode(response.body);

      final String? displayName = data['display_name'];

      if (displayName != null && displayName.isNotEmpty && mounted) {
        setState(() {
          _currentAddress = displayName;
        });

        debugPrint('Current address: $_currentAddress');
      }
    } catch (e) {
      debugPrint('Reverse geocoding error: $e');

      if (mounted) {
        setState(() {
          _currentAddress = 'Unable to get address';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LocationCubit>(),
      child: Scaffold(
        extendBodyBehindAppBar: true,

        body: Stack(
          children: [
            FlutterMap(
              mapController: _mapController,

              options: MapOptions(
                initialCenter: _center,
                initialZoom: 15,

                onPositionChanged: (position, hasGesture) {
                  if (hasGesture && position.center != null) {
                    final LatLng newCenter = position.center!;

                    setState(() {
                      _center = newCenter;
                    });

                    _debounceTimer?.cancel();

                    _debounceTimer = Timer(
                      const Duration(milliseconds: 700),
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

              searchResults: _searchResults,

              onSearch: _searchLocation,

              onLocationSelected: _selectLocation,

              onChooseLocation: () async {
                if (_currentAddress.isEmpty) {
                  return;
                }

                await context.read<LocationCubit>().updateLocation(
                  _currentAddress,
                );

                if (context.mounted) {
                  context.go(AppRouter.kBottomBar);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
