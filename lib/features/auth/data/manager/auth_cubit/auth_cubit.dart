import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/data_sources/auth_local_data_source.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthLocalDataSource _local = AuthLocalDataSource();

  Future<void> signup({required String fullName, required String email}) async {
    emit(AuthLoading());

    try {
      await _local.saveFullName(fullName);
      await _local.saveEmail(email);

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> signin({required String email}) async {
    emit(AuthLoading());

    try {
      final isCorrect = await _local.isEmailCorrect(email);

      if (isCorrect) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure("Incorrect email. Please try again."));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
