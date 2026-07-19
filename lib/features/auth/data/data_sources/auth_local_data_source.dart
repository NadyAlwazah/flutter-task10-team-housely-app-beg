import 'package:flutter_task10_team_housely_app_beg/core/constant/app_key.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/shared_preferences_helper.dart';

class AuthLocalDataSource {
  // حفظ الاسم
  Future<void> saveFullName(String fullName) async {
    await SharedPreferencesHelper.saveString(AppKey.keyFullName, fullName);
  }

  // قراءة الاسم
  Future<String?> getFullName() async {
    return await SharedPreferencesHelper.getString(AppKey.keyFullName);
  }

  // حفظ الإيميل
  Future<void> saveEmail(String email) async {
    await SharedPreferencesHelper.saveString(AppKey.keyEmail, email);
  }

  // قراءة الإيميل
  Future<String?> getEmail() async {
    return await SharedPreferencesHelper.getString(AppKey.keyEmail);
  }

  // حذف البيانات
  Future<void> clearUserData() async {
    await SharedPreferencesHelper.remove(AppKey.keyFullName);
    await SharedPreferencesHelper.remove(AppKey.keyEmail);
  }

  Future<bool> isEmailCorrect(String email) async {
    final savedEmail = await getEmail();
    return savedEmail != null && savedEmail == email;
  }

  Future<void> saveRememberMe(bool value) async {
    await SharedPreferencesHelper.saveBool(AppKey.keyRememberMe, value);
  }

  Future<bool?> getRememberMe() async {
    return await SharedPreferencesHelper.getBool(AppKey.keyRememberMe);
  }
}
