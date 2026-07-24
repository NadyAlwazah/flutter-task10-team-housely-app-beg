import 'package:flutter_task10_team_housely_app_beg/core/constant/app_key.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/shared_preferences_helper.dart';

class FavoritesLocalDataSource {
  Future<void> saveFavorites(List<int> ids) async {
    final list = ids.map((e) => e.toString()).toList();
    await SharedPreferencesHelper.saveList(AppKey.kFavoriteIds, list);
  }

  Future<List<int>> loadFavorites() async {
    final list =
        await SharedPreferencesHelper.getList(AppKey.kFavoriteIds) ?? [];
    return list.map(int.parse).toList();
  }
}
