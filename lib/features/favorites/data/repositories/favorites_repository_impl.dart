import 'package:dartz/dartz.dart';
import 'package:riverpod_clean_base/core/errors/failures.dart';
import 'package:riverpod_clean_base/features/favorites/data/datasources/favorites_local_datasource.dart';
import 'package:riverpod_clean_base/features/favorites/domain/repositories/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesLocalDatasource _localDatasource;

  FavoritesRepositoryImpl(this._localDatasource);

  @override
  Either<Failure, List<int>> getFavoriteIds() {
    try {
      return Right(_localDatasource.getFavoriteIds());
    } catch (e) {
      return Left(Failure.cache(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> toggleFavorite(int movieId) async {
    try {
      await _localDatasource.toggleFavorite(movieId);
      return const Right(null);
    } catch (e) {
      return Left(Failure.cache(message: e.toString()));
    }
  }

  @override
  bool isFavorite(int movieId) => _localDatasource.isFavorite(movieId);
}
