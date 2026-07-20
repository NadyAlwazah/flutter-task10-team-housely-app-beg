import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/models/user_model.dart';

class LocationCubit extends Cubit<String?> {
  LocationCubit() : super(null);
  final AuthLocalDataSource _local = getIt<AuthLocalDataSource>();
  Future<void> updateLocation(String newLocation) async {
    try {
      final user = await _local.getUser();

      if (user == null) {
        emit(null);
        return;
      }

      final updatedUser = UserModel(
        fullName: user.fullName,
        email: user.email,
        rememberMe: user.rememberMe,
        dateOfBirth: user.dateOfBirth,
        myLocation: newLocation,
      );

      await _local.saveUser(updatedUser);

      emit(newLocation);
    } catch (e) {
      emit(null);
    }
  }
}
