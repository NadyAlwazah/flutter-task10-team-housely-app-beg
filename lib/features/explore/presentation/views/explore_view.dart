import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/location_service.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_task10_team_housely_app_beg/features/select_location/data/manager/location_cubit.dart';
import 'package:latlong2/latlong.dart';
import 'widgets/explore_view_body.dart';

class ExploreView extends StatelessWidget {
  final LatLng? initialLocation;
  final VoidCallback onBackToHome;

  const ExploreView({
    super.key,
    this.initialLocation,
    required this.onBackToHome,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LocationCubit(
        getIt<LocationService>(),
        getIt<AuthLocalDataSource>(),
      )..initialize(loadNearby: true), // جلب الموقع والأماكن المجاورة فور الفتح
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: ExploreViewBody(
          onBackToHome: onBackToHome,
        ),
      ),
    );
  }
}