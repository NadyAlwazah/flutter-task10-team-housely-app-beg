import 'package:latlong2/latlong.dart';

class LocationData {
  final String address;

  /// إحداثيات الموقع
  final LatLng location;

  const LocationData({
    required this.address,
    required this.location,
  });
}