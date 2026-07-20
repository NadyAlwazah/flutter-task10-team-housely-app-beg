import 'package:flutter_task10_team_housely_app_beg/core/services/location_service.dart';
import 'package:flutter_task10_team_housely_app_beg/features/select_location/data/manager/location_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/manager/auth_cubit/auth_cubit.dart';

final getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(),
  );

  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(),
  );

  getIt.registerFactory<LocationCubit>(
    () => LocationCubit(
      getIt<AuthLocalDataSource>(),
    ),
  );

  getIt.registerLazySingleton<LocationService>(
    () => LocationService(
      getIt<AuthLocalDataSource>(),
    ),
  );
}