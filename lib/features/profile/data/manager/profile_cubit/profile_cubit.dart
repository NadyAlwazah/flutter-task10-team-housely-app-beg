import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/models/user_model.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  final AuthLocalDataSource _local = getIt<AuthLocalDataSource>();

  Future<void> loadUser() async {
    emit(ProfileLoading());

    final user = await _local.getUser();

    if (user == null) {
      emit(ProfileFailure(message: "No user found"));
    } else {
      emit(ProfileLoaded(user: user));
    }
  }
}
