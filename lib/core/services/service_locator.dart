import 'package:flutter_task10_team_housely_app_beg/features/home/data/data_source/favorites_local_data_source.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/home_content_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/profile/data/manager/profile_cubit/profile_cubit.dart';

import 'package:flutter_task10_team_housely_app_beg/core/services/location_service.dart';
import 'package:flutter_task10_team_housely_app_beg/features/select_location/data/manager/location_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/manager/auth_cubit/auth_cubit.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Data Sources
  getIt.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSource());
  getIt.registerLazySingleton<FavoritesLocalDataSource>(
    () => FavoritesLocalDataSource(),
  );

  // Services
  getIt.registerLazySingleton<LocationService>(
    () => LocationService(getIt<AuthLocalDataSource>()),
  );

  // Cubits
  getIt.registerFactory<AuthCubit>(() => AuthCubit());
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit());
  
  // تم تعديل تسجيل LocationCubit لتمرير البرامترين المطلوبين
  getIt.registerFactory<LocationCubit>(
    () => LocationCubit(
      getIt<LocationService>(),
      getIt<AuthLocalDataSource>(),
    ),
  );
  
  getIt.registerFactory<PropertyCubit>(() => PropertyCubit());
  getIt.registerFactory<HomeContentCubit>(() => HomeContentCubit());
}