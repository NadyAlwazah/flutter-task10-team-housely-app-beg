import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/models/user_model.dart';

class LocationCubit extends Cubit<String?> {
  final AuthLocalDataSource _dataSource;
  
  LocationCubit(this._dataSource) : super(null);
Future<void> updateLocation(String newLocation) async {
  try {
    final UserModel? user = await _dataSource.getUser();


    if (user == null) {
      emit(null);
      return;
    }

    final UserModel updatedUser = UserModel(
      fullName: user.fullName,
      email: user.email,
      rememberMe: user.rememberMe,
      dateOfBirth: user.dateOfBirth,
      myLocation: newLocation,
    );

    await _dataSource.saveUser(updatedUser);

    emit(newLocation);
  } catch (e) {
    emit(null);
  }
}
}