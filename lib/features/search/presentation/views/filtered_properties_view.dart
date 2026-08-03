import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_app_bar.dart';

import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

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
      appBar: CustomAppBar(
        title: "Filtered Properties",
        onTapLeading: () => context.pop(),
      ),
      body: filtered.isEmpty
          ? const Center(child: Text("No properties match your filters."))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final property = filtered[index];

                return GestureDetector(
                  onTap: () {
                    context.push(
                      AppRouter.kDetails,
                      extra: {
                        'property': property,
                        'cubit': context.read<PropertyCubit>(),
                      },
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 15,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // صورة العقار
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.r),
                          ),
                          child: Image.asset(
                            property.image,
                            height: 180.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // العنوان + السعر
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      property.title,
                                      style: Styles.textStyle18W600Inter,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    "\$${property.pricePerMonth.toInt()}",
                                    style: Styles.textStyle18W600Inter.copyWith(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 6.h),

                              // الموقع
                              Row(
                                children: [
                                  SvgPicture.asset(AssetsData.iconLocationSvg),

                                  SizedBox(width: 4.w),
                                  Expanded(
                                    child: Text(
                                      property.location,
                                      style: Styles.textStyle14W400Inter,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 12.h),

                              // نوع العقار + الحالة
                              Row(
                                children: [
                                  _buildTag(property.type),
                                  SizedBox(width: 8.w),
                                  _buildTag(property.status),
                                ],
                              ),

                              SizedBox(height: 12.h),

                              // غرف النوم + الحمامات + المكيف + الانترنيت
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _buildIconText(
                                        const Icon(
                                          Icons.bed,
                                          color: AppColors.primary,
                                        ),
                                        "${property.bedrooms} Beds",
                                      ),
                                      _buildIconText(
                                        SvgPicture.asset(
                                          AssetsData.iconBathubSvg,
                                        ),
                                        "${property.bathrooms} Baths",
                                      ),
                                      _buildIconText(
                                        SvgPicture.asset(
                                          AssetsData.iconAcSvg,
                                          height: 18,
                                          width: 18,
                                        ),
                                        property.hasAc
                                            ? "AC Available"
                                            : "No AC",
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4.h),
                                  _buildIconText(
                                    FaIcon(
                                      FontAwesomeIcons.wifi,
                                      color: AppColors.primary,
                                      size: 18.r,
                                    ),
                                    property.hasAc
                                        ? "wifi Available"
                                        : "No wifi",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        text,
        style: Styles.textStyle12W600Inter.copyWith(color: Colors.blue),
      ),
    );
  }

  Widget _buildIconText(Widget icon, String text) {
    return Row(
      children: [
        icon,
        SizedBox(width: 4.w),
        Text(
          text,
          style: Styles.textStyle14W400Inter.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
