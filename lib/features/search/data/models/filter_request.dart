class FilterRequest {
  final List<String> lookingFor;
  final List<String> propertyTypes;
  final double minPrice;
  final double maxPrice;
  final List<String> facilities;

  FilterRequest({
    required this.lookingFor,
    required this.propertyTypes,
    required this.minPrice,
    required this.maxPrice,
    required this.facilities,
  });
}
