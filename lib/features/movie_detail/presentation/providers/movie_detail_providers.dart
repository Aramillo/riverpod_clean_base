import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_clean_base/core/network/dio_client.dart';
import 'package:riverpod_clean_base/features/home/domain/entities/movie.dart';
import 'package:riverpod_clean_base/features/movie_detail/data/datasources/movie_detail_remote_datasource.dart';
import 'package:riverpod_clean_base/features/movie_detail/data/repositories/movie_detail_repository_impl.dart';
import 'package:riverpod_clean_base/features/movie_detail/domain/entities/cast_member.dart';
import 'package:riverpod_clean_base/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:riverpod_clean_base/features/movie_detail/domain/repositories/movie_detail_repository.dart';
import 'package:riverpod_clean_base/features/movie_detail/domain/usecases/get_movie_credits_usecase.dart';
import 'package:riverpod_clean_base/features/movie_detail/domain/usecases/get_movie_detail_usecase.dart';
import 'package:riverpod_clean_base/features/movie_detail/domain/usecases/get_similar_movies_usecase.dart';

part 'movie_detail_providers.g.dart';

@riverpod
MovieDetailRemoteDatasource movieDetailRemoteDatasource(
  MovieDetailRemoteDatasourceRef ref,
) {
  return MovieDetailRemoteDatasource(ref.watch(dioProvider));
}

@riverpod
MovieDetailRepository movieDetailRepository(MovieDetailRepositoryRef ref) {
  return MovieDetailRepositoryImpl(
    ref.watch(movieDetailRemoteDatasourceProvider),
  );
}

@riverpod
GetMovieDetailUseCase getMovieDetailUseCase(GetMovieDetailUseCaseRef ref) {
  return GetMovieDetailUseCase(ref.watch(movieDetailRepositoryProvider));
}

@riverpod
GetMovieCreditsUseCase getMovieCreditsUseCase(GetMovieCreditsUseCaseRef ref) {
  return GetMovieCreditsUseCase(ref.watch(movieDetailRepositoryProvider));
}

@riverpod
GetSimilarMoviesUseCase getSimilarMoviesUseCase(
  GetSimilarMoviesUseCaseRef ref,
) {
  return GetSimilarMoviesUseCase(ref.watch(movieDetailRepositoryProvider));
}

@riverpod
Future<MovieDetail> movieDetail(MovieDetailRef ref, int movieId) async {
  final useCase = ref.watch(getMovieDetailUseCaseProvider);
  final result = await useCase(movieId);
  return result.fold((failure) => throw failure, (detail) => detail);
}

@riverpod
Future<List<CastMember>> movieCredits(MovieCreditsRef ref, int movieId) async {
  final useCase = ref.watch(getMovieCreditsUseCaseProvider);
  final result = await useCase(movieId);
  return result.fold((failure) => throw failure, (cast) => cast);
}

@riverpod
Future<List<Movie>> similarMovies(SimilarMoviesRef ref, int movieId) async {
  final useCase = ref.watch(getSimilarMoviesUseCaseProvider);
  final result = await useCase(movieId);
  return result.fold((failure) => throw failure, (movies) => movies);
}
