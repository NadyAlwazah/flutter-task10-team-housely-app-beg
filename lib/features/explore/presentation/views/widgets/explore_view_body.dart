import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/features/select_location/data/manager/location_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/select_location/data/manager/location_state.dart';
import 'package:flutter_task10_team_housely_app_beg/features/select_location/presentation/views/widgets/map_page_body.dart';

class ExploreViewBody extends StatelessWidget {
  final VoidCallback onBackToHome;

  const ExploreViewBody({super.key, required this.onBackToHome});

  IconData _getIconForType(String type) {
    switch (type.toLowerCase()) {
      case 'restaurant':
      case 'fast_food':
        return Icons.restaurant;
      case 'cafe':
        return Icons.local_cafe;
      case 'hospital':
        return Icons.local_hospital;
      case 'stadium':
        return Icons.sports_soccer;
      case 'shop':
        return Icons.shopping_bag;
      default:
        return Icons.place;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LocationCubit>();

    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        return Stack(
          children: [
            FlutterMap(
              mapController: cubit.mapController,
              options: MapOptions(
                initialCenter: state.center,
                initialZoom: 15.0,
                onPositionChanged: (position, hasGesture) {
                  if (hasGesture) {
                    cubit.onMapMoved(position.center, loadNearby: true);
                  }
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName:
                      'com.example.flutter_task10_team_housely_app_beg',
                ),

                MarkerLayer(
                  markers: [
                    Marker(
                      point: cubit.currentUserLocation ?? state.center,
                      width: 40.r,
                      height: 40.r,
                      child: Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 38.r,
                      ),
                    ),

                    ...state.nearbyPlaces.map((place) {
                      return Marker(
                        point: place.location,
                        width: 100.w,
                        height: 60.h,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6.w,
                                vertical: 2.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.r),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: Text(
                                place.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Icon(
                              _getIconForType(place.type),
                              color: AppColors.primary,
                              size: 22.r,
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),

            MapPageBody(
              address: state.address,
              hideChooseLocationButton: true,
              cardTitle: "Explore Area",
              cardIcon: Icons.explore,
              onBackPressed: onBackToHome,
            ),
            
          ],
        );
      },
    );
  }
}
