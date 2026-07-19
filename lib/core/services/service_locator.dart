import 'package:flutter_task10_team_housely_app_beg/features/profile/data/manager/profile_cubit/profile_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/manager/auth_cubit/auth_cubit.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Data Sources
  getIt.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSource());

  // Cubits
  getIt.registerFactory<AuthCubit>(() => AuthCubit());
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit());
}
