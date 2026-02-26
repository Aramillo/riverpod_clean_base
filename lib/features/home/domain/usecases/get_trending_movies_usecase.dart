import 'package:dartz/dartz.dart';
import 'package:riverpod_clean_base/core/errors/failures.dart';
import 'package:riverpod_clean_base/features/home/domain/entities/movie.dart';
import 'package:riverpod_clean_base/features/home/domain/repositories/home_repository.dart';
import 'package:riverpod_clean_base/shared/domain/entities/no_params.dart';
import 'package:riverpod_clean_base/shared/domain/usecase.dart';

class GetTrendingMoviesUseCase extends UseCase<List<Movie>, NoParams> {
  final HomeRepository _repository;

  GetTrendingMoviesUseCase(this._repository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) {
    return _repository.getTrendingMovies();
  }
}
