import 'package:dartz/dartz.dart';
import 'package:riverpod_clean_base/core/errors/failures.dart';
import 'package:riverpod_clean_base/features/home/domain/entities/movie.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<Movie>>> searchMovies(String query, {int page = 1});
}
