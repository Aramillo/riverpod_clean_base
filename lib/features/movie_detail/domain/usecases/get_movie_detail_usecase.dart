import 'package:dartz/dartz.dart';
import 'package:riverpod_clean_base/core/errors/failures.dart';
import 'package:riverpod_clean_base/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:riverpod_clean_base/features/movie_detail/domain/repositories/movie_detail_repository.dart';
import 'package:riverpod_clean_base/shared/domain/usecase.dart';

class GetMovieDetailUseCase extends UseCase<MovieDetail, int> {
  final MovieDetailRepository _repository;

  GetMovieDetailUseCase(this._repository);

  @override
  Future<Either<Failure, MovieDetail>> call(int movieId) {
    return _repository.getMovieDetail(movieId);
  }
}
