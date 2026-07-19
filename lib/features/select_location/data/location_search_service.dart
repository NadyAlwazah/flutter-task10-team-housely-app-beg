import 'dart:convert';
import 'package:http/http.dart' as http;

class LocationResult {
  final String displayName;
  final double latitude;
  final double longitude;

  LocationResult({
    required this.displayName,
    required this.latitude,
    required this.longitude,
  });
}

class LocationSearchService {
  Future<List<LocationResult>> searchLocation(
    String query,
  ) async {
    final url = Uri.parse(
      'https://nominatim.openstreetmap.org/search'
      '?q=${Uri.encodeQueryComponent(query)}'
      '&format=json'
      '&limit=5',
    );

    final response = await http.get(
      url,
      headers: {
        'User-Agent': 'Team-Housely-Flutter-App',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Search failed');
    }

    final List data = jsonDecode(response.body);

    return data.map((item) {
      return LocationResult(
        displayName: item['display_name'],
        latitude: double.parse(item['lat']),
        longitude: double.parse(item['lon']),
      );
    }).toList();
  }

  Future<String> getAddressFromCoordinates(
    double latitude,
    double longitude,
  ) async {
    final url = Uri.parse(
      'https://nominatim.openstreetmap.org/reverse'
      '?lat=$latitude'
      '&lon=$longitude'
      '&format=json',
    );

    final response = await http.get(
      url,
      headers: {
        'User-Agent': 'Team-Housely-Flutter-App',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Reverse geocoding failed');
    }

    final data = jsonDecode(response.body);

    return data['display_name'] ?? 'Unknown location';
  }
}