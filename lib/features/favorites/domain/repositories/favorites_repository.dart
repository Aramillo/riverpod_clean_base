import 'package:dartz/dartz.dart';
import 'package:riverpod_clean_base/core/errors/failures.dart';

abstract class FavoritesRepository {
  Either<Failure, List<int>> getFavoriteIds();
  Future<Either<Failure, void>> toggleFavorite(int movieId);
  bool isFavorite(int movieId);
}
