import 'package:dartz/dartz.dart';
import 'package:riverpod_clean_base/core/errors/failures.dart';
import 'package:riverpod_clean_base/features/home/domain/entities/movie.dart';
import 'package:riverpod_clean_base/features/movie_detail/domain/entities/cast_member.dart';
import 'package:riverpod_clean_base/features/movie_detail/domain/entities/movie_detail.dart';

abstract class MovieDetailRepository {
  Future<Either<Failure, MovieDetail>> getMovieDetail(int movieId);
  Future<Either<Failure, List<CastMember>>> getMovieCredits(int movieId);
  Future<Either<Failure, List<Movie>>> getSimilarMovies(int movieId);
}
