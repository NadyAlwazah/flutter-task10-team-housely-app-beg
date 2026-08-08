import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/location_service.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_task10_team_housely_app_beg/features/select_location/data/manager/location_cubit.dart';
import 'package:latlong2/latlong.dart';

import 'widgets/explore_view_body.dart';

class ExploreView extends StatefulWidget {
  final LatLng? initialLocation;
  final VoidCallback onBackToHome;

  const ExploreView({
    super.key,
    this.initialLocation,
    required this.onBackToHome,
  });

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> with WidgetsBindingObserver {
  late final LocationCubit _locationCubit;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    _locationCubit = LocationCubit(
      getIt<LocationService>(),
      getIt<AuthLocalDataSource>(),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkLocationService();
    });
  }

  Future<void> _checkLocationService() async {
    final locationService = getIt<LocationService>();

    final enabled = await locationService.isLocationServiceEnabled();

    if (!mounted) return;

    if (enabled) {
      _locationCubit.initialize(loadNearby: true);
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Location Service Disabled'),
          content: const Text(
            'Please enable Location Services (GPS) to view nearby places and properties.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                // العودة إلى الصفحة الرئيسية
                widget.onBackToHome();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(dialogContext);
                await locationService.openLocationSettings();
              },
              child: const Text('Open Settings'),
            ),
          ],
        );
      },
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      final enabled = await getIt<LocationService>().isLocationServiceEnabled();

      if (enabled) {
        _locationCubit.initialize(loadNearby: true);
      } else {
        if (mounted) {
          widget.onBackToHome();
        }
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _locationCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _locationCubit,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: ExploreViewBody(onBackToHome: widget.onBackToHome),
      ),
    );
  }
}
