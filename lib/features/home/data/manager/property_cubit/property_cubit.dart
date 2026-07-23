import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/data_source/favorites_local_data_source.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';

import 'property_state.dart';

class PropertyCubit extends Cubit<PropertyState> {
  PropertyCubit() : super(PropertyInitial());

  final FavoritesLocalDataSource _favoritesLocalDataSource =
      getIt<FavoritesLocalDataSource>();
  List<int> favoriteIds = [];

  void loadData({
    required List<PropertyModel> recommended,
    required List<PropertyModel> popular,
  }) async {
    favoriteIds = await _favoritesLocalDataSource.loadFavorites();

    final updatedRecommended = _applyFavoritesToList(recommended);
    final updatedPopular = _applyFavoritesToList(popular);

    emit(
      PropertyState(recommended: updatedRecommended, popular: updatedPopular),
    );
  }

  List<PropertyModel> _applyFavoritesToList(List<PropertyModel> list) {
    return list.map((property) {
      final isFav = favoriteIds.contains(property.id);
      return property.copyWith(isFavorite: isFav);
    }).toList();
  }

  void toggleFavorite(int id) async {
    if (favoriteIds.contains(id)) {
      favoriteIds.remove(id);
    } else {
      favoriteIds.add(id);
    }

    await _favoritesLocalDataSource.saveFavorites(favoriteIds);

    final updatedRecommended = _applyFavoritesToList(state.recommended);
    final updatedPopular = _applyFavoritesToList(state.popular);

    emit(
      state.copyWith(recommended: updatedRecommended, popular: updatedPopular),
    );
  }
}
