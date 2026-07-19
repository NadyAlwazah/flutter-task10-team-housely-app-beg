import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthLocalDataSource _local = getIt<AuthLocalDataSource>();

  Future<void> signup({required String fullName, required String email}) async {
    emit(AuthLoading());

    try {
      await _local.saveUser(UserModel(fullName: fullName, email: email));
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> signin({required String email, required bool rememberMe}) async {
    emit(AuthLoading());

    try {
      // قراءة المستخدم المخزن
      final user = await _local.getUser();

      if (user == null) {
        emit(AuthFailure("No user found. Please sign up first."));
        return;
      }

      // التحقق من الإيميل
      if (user.email != email) {
        emit(AuthFailure("Incorrect email. Please try again."));
        return;
      }

      // تحديث قيمة rememberMe داخل UserModel
      final updatedUser = UserModel(
        fullName: user.fullName,
        email: user.email,
        rememberMe: rememberMe,
        dateOfBirth: user.dateOfBirth,
        myLocation: user.myLocation,
      );

      // إعادة تخزين المستخدم بعد التعديل
      await _local.saveUser(updatedUser);

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
