import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_clean_base/core/providers/core_providers.dart';
import 'package:riverpod_clean_base/features/favorites/data/datasources/favorites_local_datasource.dart';
import 'package:riverpod_clean_base/features/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:riverpod_clean_base/features/favorites/domain/repositories/favorites_repository.dart';

part 'favorites_providers.g.dart';

@riverpod
FavoritesLocalDatasource favoritesLocalDatasource(
  FavoritesLocalDatasourceRef ref,
) {
  return FavoritesLocalDatasource(ref.watch(sharedPreferencesProvider));
}

@riverpod
FavoritesRepository favoritesRepository(FavoritesRepositoryRef ref) {
  return FavoritesRepositoryImpl(ref.watch(favoritesLocalDatasourceProvider));
}

@riverpod
class FavoritesNotifier extends _$FavoritesNotifier {
  @override
  List<int> build() {
    final repo = ref.watch(favoritesRepositoryProvider);
    return repo.getFavoriteIds().fold((_) => [], (ids) => ids);
  }

  Future<void> toggle(int movieId) async {
    final repo = ref.read(favoritesRepositoryProvider);
    await repo.toggleFavorite(movieId);
    ref.invalidateSelf();
  }

  bool isFavorite(int movieId) => state.contains(movieId);
}
