import 'package:latlong2/latlong.dart';

class PlaceModel {
  final String id;
  final String name;
  final String type;
  final LatLng location;

  PlaceModel({
    required this.id,
    required this.name,
    required this.type,
    required this.location,
  });
}
