
import 'package:flutter_task10_team_housely_app_beg/core/services/shared_preferences_helper.dart';

class SelectLocationDataSource {
  static const String locationKey = 'selected_location';

  Future<void> saveLocation(String location) async {
    await SharedPreferencesHelper.saveString(locationKey, location);
  }

  Future<String?> getSavedLocation() async {
    return await SharedPreferencesHelper.getString(locationKey);
  }
}