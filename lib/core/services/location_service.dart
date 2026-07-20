import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class LocationService {
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

    if (permission ==
        LocationPermission.deniedForever) {
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

    final Uri url = Uri.parse(
      'https://nominatim.openstreetmap.org/reverse'
      '?lat=${position.latitude}'
      '&lon=${position.longitude}'
      '&format=json',
    );

    final response = await http.get(
      url,
      headers: {
        'User-Agent': 'Team-Housely-Flutter-App',
      },
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to get address.',
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