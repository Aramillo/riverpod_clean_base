import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesLocalDatasource {
  final SharedPreferences _prefs;
  static const _key = 'favorite_movie_ids';

  FavoritesLocalDatasource(this._prefs);

  List<int> getFavoriteIds() {
    final json = _prefs.getString(_key);
    if (json == null) return [];
    final list = jsonDecode(json) as List;
    return list.cast<int>();
  }

  Future<void> saveFavoriteIds(List<int> ids) async {
    await _prefs.setString(_key, jsonEncode(ids));
  }

  bool isFavorite(int movieId) {
    return getFavoriteIds().contains(movieId);
  }

  Future<void> toggleFavorite(int movieId) async {
    final ids = getFavoriteIds();
    if (ids.contains(movieId)) {
      ids.remove(movieId);
    } else {
      ids.add(movieId);
    }
    await saveFavoriteIds(ids);
  }
}
