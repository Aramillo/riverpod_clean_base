import 'package:dartz/dartz.dart';
import 'package:riverpod_clean_base/core/errors/failures.dart';
import 'package:riverpod_clean_base/features/home/domain/entities/movie.dart';
import 'package:riverpod_clean_base/features/home/domain/repositories/home_repository.dart';
import 'package:riverpod_clean_base/shared/domain/usecase.dart';

class GetPopularMoviesUseCase extends UseCase<List<Movie>, int> {
  final HomeRepository _repository;

  GetPopularMoviesUseCase(this._repository);

  @override
  Future<Either<Failure, List<Movie>>> call(int page) {
    return _repository.getPopularMovies(page: page);
  }
}
