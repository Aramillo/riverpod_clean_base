import 'package:dartz/dartz.dart';
import 'package:riverpod_clean_base/core/errors/failures.dart';
import 'package:riverpod_clean_base/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:riverpod_clean_base/shared/domain/usecase.dart';

class ToggleFavoriteUseCase extends UseCase<void, int> {
  final FavoritesRepository _repository;

  ToggleFavoriteUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(int movieId) {
    return _repository.toggleFavorite(movieId);
  }
}
