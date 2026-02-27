import 'package:dartz/dartz.dart';
import 'package:riverpod_clean_base/core/errors/failures.dart';
import 'package:riverpod_clean_base/features/home/domain/entities/movie.dart';
import 'package:riverpod_clean_base/features/movie_detail/domain/repositories/movie_detail_repository.dart';
import 'package:riverpod_clean_base/shared/domain/usecase.dart';

class GetSimilarMoviesUseCase extends UseCase<List<Movie>, int> {
  final MovieDetailRepository _repository;

  GetSimilarMoviesUseCase(this._repository);

  @override
  Future<Either<Failure, List<Movie>>> call(int movieId) {
    return _repository.getSimilarMovies(movieId);
  }
}
