import 'dart:convert';

import 'package:flutter_task10_team_housely_app_beg/core/constant/app_key.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/shared_preferences_helper.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/models/user_model.dart';

class AuthLocalDataSource {
  // JSON حفظ المستخدم كامل كـ
  Future<void> saveUser(UserModel user) async {
    final jsonString = jsonEncode(user.toMap());
    await SharedPreferencesHelper.saveString(AppKey.keyUserModel, jsonString);
  }

  // قراءة المستخدم كامل
  Future<UserModel?> getUser() async {
    final jsonString = await SharedPreferencesHelper.getString(
      AppKey.keyUserModel,
    );

    if (jsonString == null) return null;

    final map = jsonDecode(jsonString);
    return UserModel.fromMap(map);
  }

  // حذف بيانات المستخدم بالكامل
  Future<void> clearUserData() async {
    await SharedPreferencesHelper.remove(AppKey.keyUserModel);
  }
}
