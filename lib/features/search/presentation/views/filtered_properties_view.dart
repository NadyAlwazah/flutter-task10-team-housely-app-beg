import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';

class FilteredPropertiesView extends StatelessWidget {
  final double minPrice;
  final double maxPrice;
  final List<String> facilities;
  final List<String> lookingFor;
  final List<String> propertyTypes;

  const FilteredPropertiesView({
    super.key,
    required this.minPrice,
    required this.maxPrice,
    required this.facilities,
    required this.lookingFor,
    required this.propertyTypes,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PropertyCubit>();

    final List<PropertyModel> allProperties = [
      ...cubit.state.recommended,
      ...cubit.state.popular,
      ...cubit.state.nearbyProperties,
    ];

    final List<PropertyModel> filtered = allProperties.where((property) {
      // السعر
      final priceOk =
          property.pricePerMonth >= minPrice &&
          property.pricePerMonth <= maxPrice;

      // للبيع أو للإيجار
      final lookingForOk =
          lookingFor.isEmpty || lookingFor.contains(property.status);

      // نوع العقار
      final propertyTypeOk =
          propertyTypes.isEmpty ||
          propertyTypes.any(
            (type) =>
                type.toLowerCase().trim() == property.type.toLowerCase().trim(),
          );

      // المرافق
      final facilitiesOk =
          facilities.isEmpty ||
          facilities.every((facility) {
            switch (facility.toLowerCase()) {
              case "bed room":
                return property.bedrooms > 0;

              case "bathtub":
                return property.bathrooms > 0;

              case "ac":
                return property.hasAc;

              case "wifi":
                return property.hasWifi;

              default:
                return true;
            }
          });

      return priceOk && lookingForOk && propertyTypeOk && facilitiesOk;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Filtered Properties")),
      body: filtered.isEmpty
          ? const Center(child: Text("No properties match your filters."))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final property = filtered[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text(property.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(property.location),
                        Text(property.type),
                        Text(property.status),
                        Text("hasAc:${property.hasAc}"),
                        Text("hasAc:${property.hasWifi}"),
                      ],
                    ),
                    trailing: Text("\$${property.pricePerMonth.toInt()}"),
                  ),
                );
              },
            ),
    );
  }
}
