import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/location_service.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_snack_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_task10_team_housely_app_beg/features/select_location/data/manager/location_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/select_location/data/manager/location_state.dart';
import 'package:flutter_task10_team_housely_app_beg/features/select_location/presentation/views/widgets/map_page_body.dart';
import 'package:go_router/go_router.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          LocationCubit(getIt<LocationService>(), getIt<AuthLocalDataSource>())
            ..initialize(),

      child: const _MapPageView(),
    );
  }
}

class _MapPageView extends StatelessWidget {
  const _MapPageView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          final cubit = context.read<LocationCubit>();
          return Stack(
            children: [
              FlutterMap(
                mapController: cubit.mapController,

                options: MapOptions(
                  initialCenter: state.center,
                  initialZoom: 15,
                  onPositionChanged: (camera, hasGesture) {
                    if (hasGesture) {
                      cubit.onMapMoved(camera.center);
                    }
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',

                    userAgentPackageName:
                        'com.example.flutter_task10_team_housely_app_beg',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: state.center,
                        width: 50,
                        height: 50,
                        child: const Icon(Icons.location_on, color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
              MapPageBody(
                address: state.address,
                hideChooseLocationButton: false,
                cardTitle: "Location Details",
                cardIcon: Icons.location_on_outlined,
                onBackPressed: () {
                  context.pop();
                },
                onChooseLocation: () async {
                  if (!state.hasSelectedLocation ||
                      state.address == "Getting current location...") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      CustomSnackBar(
                        message: "Location not ready yet.",

                        isError: true,
                      ),
                    );
                    return;
                  }
                  await cubit.saveSelectedLocation();
                  if (context.mounted) {
                    context.go(AppRouter.kBottomBar);
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
