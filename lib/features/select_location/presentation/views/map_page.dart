import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_task10_team_housely_app_beg/features/select_location/data/location_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/select_location/data/location_search_service.dart';

import 'widgets/map_page_body.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final LocationSearchService _searchService =
      LocationSearchService();

  final MapController _mapController = MapController();

  List<LocationResult> _searchResults = [];

  String _currentAddress = "";

  LatLng _center = const LatLng(
    -7.7956,
    110.3695,
  );

  Timer? _debounceTimer;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  Future<void> _searchLocation(String query) async {
    try {
      final results =
          await _searchService.searchLocation(query);

      if (!mounted) return;

      setState(() {
        _searchResults = results;
      });
    } catch (e) {
      debugPrint('Search error: $e');
    }
  }

  void _selectLocation(LocationResult result) {
    final selectedLocation = LatLng(
      result.latitude,
      result.longitude,
    );

    setState(() {
      _center = selectedLocation;
      _currentAddress = result.displayName;
      _searchResults = [];
    });

    _mapController.move(
      selectedLocation,
      15,
    );
  }

  Future<void> _getAddress(LatLng position) async {
    try {
      final List<Placemark> placemarks =
          await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty && mounted) {
        final Placemark place = placemarks.first;

        setState(() {
          _currentAddress =
              "${place.street ?? ''}, "
              "${place.locality ?? ''}, "
              "${place.country ?? ''}";
        });
      }
    } catch (e) {
      debugPrint('Geocoding error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                if (hasGesture &&
                    position.center != null) {
                  final newCenter =
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
                urlTemplate:
                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
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