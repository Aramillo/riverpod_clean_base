import 'package:dartz/dartz.dart';
import 'package:riverpod_clean_base/core/errors/failures.dart';
import 'package:riverpod_clean_base/features/home/domain/entities/movie.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Movie>>> getTrendingMovies({int page = 1});
  Future<Either<Failure, List<Movie>>> getPopularMovies({int page = 1});
}
