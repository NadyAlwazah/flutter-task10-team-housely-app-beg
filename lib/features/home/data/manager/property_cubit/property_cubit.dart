import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/data_source/favorites_local_data_source.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/review_model.dart';

import 'property_state.dart';

class PropertyCubit extends Cubit<PropertyState> {
  PropertyCubit() : super(PropertyInitial());

  final FavoritesLocalDataSource _favoritesLocalDataSource =
      getIt<FavoritesLocalDataSource>();
  List<int> favoriteIds = [];

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
// أضف هذه الدالة داخل كلاس PropertyCubit في ملف property_cubit.dart

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
}