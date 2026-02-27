import 'package:dartz/dartz.dart';
import 'package:riverpod_clean_base/core/errors/failures.dart';
import 'package:riverpod_clean_base/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:riverpod_clean_base/shared/domain/entities/no_params.dart';
import 'package:riverpod_clean_base/shared/domain/usecase.dart';

class GetFavoritesUseCase extends UseCase<List<int>, NoParams> {
  final FavoritesRepository _repository;

  GetFavoritesUseCase(this._repository);

  @override
  Future<Either<Failure, List<int>>> call(NoParams params) async {
    return _repository.getFavoriteIds();
  }
}
