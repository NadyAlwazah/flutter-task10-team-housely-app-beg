import 'package:flutter_task10_team_housely_app_beg/core/constant/app_key.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/shared_preferences_helper.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';

class SearchLocalDataSource {
  // بدون تكرار recent حفظ العقار في الـ
  Future<void> saveRecentProperty(PropertyModel property) async {
    final list =
        await SharedPreferencesHelper.getList(AppKey.kRecentProperties) ?? [];

    // منع التكرار
    if (!list.contains(property.id.toString())) {
      list.add(property.id.toString());
      await SharedPreferencesHelper.saveList(AppKey.kRecentProperties, list);
    }
  }

  // IDs  استرجاع قائمة الـ
  Future<List<String>> getRecentPropertyIds() async {
    return await SharedPreferencesHelper.getList(AppKey.kRecentProperties) ??
        [];
  }

  // recent حذف عنصر واحد من  الـ
  Future<void> removeRecentProperty(String propertyId) async {
    final list =
        await SharedPreferencesHelper.getList(AppKey.kRecentProperties) ?? [];

    list.remove(propertyId);

    await SharedPreferencesHelper.saveList(AppKey.kRecentProperties, list);
  }

  // recent حذف الـ
  Future<void> clearRecent() async {
    await SharedPreferencesHelper.remove(AppKey.kRecentProperties);
  }
}
