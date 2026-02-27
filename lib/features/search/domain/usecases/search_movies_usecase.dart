import 'package:dartz/dartz.dart';
import 'package:riverpod_clean_base/core/errors/failures.dart';
import 'package:riverpod_clean_base/features/home/domain/entities/movie.dart';
import 'package:riverpod_clean_base/features/search/domain/repositories/search_repository.dart';
import 'package:riverpod_clean_base/shared/domain/usecase.dart';

class SearchMoviesUseCase extends UseCase<List<Movie>, String> {
  final SearchRepository _repository;

  SearchMoviesUseCase(this._repository);

  @override
  Future<Either<Failure, List<Movie>>> call(String query) {
    return _repository.searchMovies(query);
  }
}
