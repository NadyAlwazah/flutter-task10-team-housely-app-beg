import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/location_data.dart';
import 'package:flutter_task10_team_housely_app_beg/features/explore/data/model/place_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class LocationService {
  /// جلب الموقع الحالي للمستخدم
  Future<LocationData> getCurrentLocation() async {
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      throw Exception('Location permission denied.');
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permission denied forever.');
    }

    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final LatLng location = LatLng(position.latitude, position.longitude);
    final String address = await getAddressFromLatLng(location);

    return LocationData(address: address, location: location);
  }

  /// تحويل الإحداثيات إلى عنوان نصي
  Future<String> getAddressFromLatLng(LatLng location) async {
    try {
      final String url =
          'https://nominatim.openstreetmap.org/reverse?format=json&lat=${location.latitude}&lon=${location.longitude}';

      final response = await http.get(
        Uri.parse(url),
        headers: {'User-Agent': 'com.example.housely_app'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data['display_name'] ?? 'Unknown location';
      }
    } catch (_) {}
    return 'Failed to get address';
  }

  Future<List<PlaceModel>> getNearbyPlaces(LatLng center) async {
    final List<String> overpassEndpoints = [
      'https://overpass-api.de/api/interpreter',
      'https://overpass.private.coffee/api/interpreter',
      'https://overpass.kumi.systems/api/interpreter',
    ];

    final String query =
        'data=[out:json][timeout:25];'
        '(node["amenity"](around:3000,${center.latitude},${center.longitude});'
        'node["shop"](around:3000,${center.latitude},${center.longitude}););'
        'out 30;';

    for (final endpoint in overpassEndpoints) {
      try {
        debugPrint('🔍 Fetching places via: $endpoint');

        final response = await http
            .post(
              Uri.parse(endpoint),
              headers: {
                'User-Agent': 'HouselyApp/1.0 (com.housely.app)',
                'Content-Type': 'application/x-www-form-urlencoded',
              },
              body: query,
            )
            .timeout(const Duration(seconds: 20));

        if (response.statusCode == 200) {
          final Map<String, dynamic> data = jsonDecode(response.body);
          final List elements = data['elements'] ?? [];

          final List<PlaceModel> places = [];

          for (final element in elements) {
            final tags = element['tags'] ?? {};
            final double? lat = element['lat']?.toDouble();
            final double? lon = element['lon']?.toDouble();

            if (lat == null || lon == null) continue;

            final String name =
                tags['name'] ??
                tags['brand'] ??
                tags['amenity'] ??
                tags['shop'] ??
                'Nearby Place';
            final String type = tags['amenity'] ?? tags['shop'] ?? 'place';

            places.add(
              PlaceModel(
                id: element['id'].toString(),
                name: name,
                type: type,
                location: LatLng(lat, lon),
              ),
            );
          }

          debugPrint('Fetched ${places.length} places successfully!');
          return places;
        } else {
          debugPrint(' Endpoint $endpoint status code: ${response.statusCode}');
        }
      } catch (e) {
        debugPrint('Endpoint $endpoint failed: $e');
      }
    }

    return [];
  }
}
