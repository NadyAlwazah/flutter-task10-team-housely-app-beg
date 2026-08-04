import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/data_source/favorites_local_data_source.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/review_model.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/data/data_source/search_local_data_source.dart';

import 'property_state.dart';

class PropertyCubit extends Cubit<PropertyState> {
  PropertyCubit() : super(PropertyInitial());

  final FavoritesLocalDataSource _favoritesLocalDataSource =
      getIt<FavoritesLocalDataSource>();
  final SearchLocalDataSource _searchLocalDataSource =
      getIt<SearchLocalDataSource>();

  List<int> favoriteIds = [];

  String currentQuery = "";

  void loadData({
    List<PropertyModel>? recommended,
    List<PropertyModel>? popular,
    List<PropertyModel>? nearbyProperties,
  }) async {
    favoriteIds = await _favoritesLocalDataSource.loadFavorites();

    emit(
      PropertyState(
        recommended: recommended != null
            ? _applyFavoritesToList(recommended)
            : state.recommended,
        popular: popular != null
            ? _applyFavoritesToList(popular)
            : state.popular,
        nearbyProperties: nearbyProperties != null
            ? _applyFavoritesToList(nearbyProperties)
            : state.nearbyProperties,
      ),
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
    final updatedNearbyProperties = _applyFavoritesToList(
      state.nearbyProperties,
    );

    emit(
      state.copyWith(
        recommended: updatedRecommended,
        popular: updatedPopular,
        nearbyProperties: updatedNearbyProperties,
      ),
    );
  }

  //اضافة مراجعه
  void addReview(int propertyId, ReviewModel newReview) {
    List<PropertyModel> updateList(List<PropertyModel> list) {
      return list.map((property) {
        if (property.id == propertyId) {
          final updatedReviews = List<ReviewModel>.from(property.reviews)
            ..insert(0, newReview); // إضافة المراجعة الجديدة في البداية
          return property.copyWith(reviews: updatedReviews);
        }
        return property;
      }).toList();
    }

    emit(
      state.copyWith(
        recommended: updateList(state.recommended),
        popular: updateList(state.popular),
        nearbyProperties: updateList(state.nearbyProperties),
      ),
    );
  }

  Future<void> search(String query) async {
    currentQuery = query;

    if (query.isEmpty) {
      emit(state.copyWith(filteredProperties: []));
      return;
    }

    final recommended = state.recommended;
    final popular = state.popular;
    final nearby = state.nearbyProperties;

    final allProperties = [...recommended, ...popular, ...nearby];

    final results = allProperties.where((property) {
      return property.title.toLowerCase().contains(query.toLowerCase()) ||
          property.location.toLowerCase().contains(query.toLowerCase());
    }).toList();

    final updatedRecent = List<PropertyModel>.from(state.recentSearches ?? []);

    //  منع التكرار
    if (results.isNotEmpty) {
      final firstResult = results.first;

      final alreadyExists = updatedRecent.any((p) => p.id == firstResult.id);

      if (!alreadyExists) {
        updatedRecent.add(firstResult);
        await _searchLocalDataSource.saveRecentProperty(firstResult);
      }
    }

    emit(
      state.copyWith(
        filteredProperties: results,
        recentSearches: updatedRecent,
      ),
    );
  }

  Future<void> loadRecentProperties() async {
    final ids = await _searchLocalDataSource.getRecentPropertyIds();

    final all = [
      ...state.recommended,
      ...state.popular,
      ...state.nearbyProperties,
    ];

    final recent = all.where((p) => ids.contains(p.id.toString())).toList();

    emit(state.copyWith(recentSearches: recent));
  }

  Future<void> removeRecentItem(PropertyModel property) async {
    final updatedRecent = List<PropertyModel>.from(state.recentSearches ?? []);

    updatedRecent.removeWhere((p) => p.id == property.id);

    await _searchLocalDataSource.removeRecentProperty(property.id.toString());

    emit(state.copyWith(recentSearches: updatedRecent));
  }
}
