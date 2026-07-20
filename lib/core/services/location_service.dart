import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_task10_team_housely_app_beg/features/auth/data/data_sources/auth_local_data_source.dart';

class LocationService {
  final AuthLocalDataSource _authLocalDataSource;

  LocationService(this._authLocalDataSource);

  Future<String> getCurrentAddress() async {
    final bool serviceEnabled =
        await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw Exception(
        'Location services are disabled.',
      );
    }

    LocationPermission permission =
        await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission =
          await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      throw Exception(
        'Location permission denied.',
      );
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
        'Location permission permanently denied.',
      );
    }

    final Position position =
        await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );

    final user =
        await _authLocalDataSource.getUser();

    final String userEmail =
        user?.email ?? 'unknown@example.com';

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
        'User-Agent':
            'TeamHouselyFlutterApp/1.0 ($userEmail)',
        'Accept-Language': 'en',
      },
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to get address: ${response.statusCode}',
      );
    }

    final Map<String, dynamic> data =
        jsonDecode(response.body);

    final String? displayName =
        data['display_name'];

    if (displayName == null ||
        displayName.isEmpty) {
      throw Exception(
        'Address not found.',
      );
    }

    return displayName;
  }
}