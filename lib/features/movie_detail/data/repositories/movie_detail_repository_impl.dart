import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_clean_base/core/errors/failures.dart';
import 'package:riverpod_clean_base/features/home/data/models/movie_model.dart';
import 'package:riverpod_clean_base/features/home/domain/entities/movie.dart';
import 'package:riverpod_clean_base/features/movie_detail/data/datasources/movie_detail_remote_datasource.dart';
import 'package:riverpod_clean_base/features/movie_detail/data/models/cast_model.dart';
import 'package:riverpod_clean_base/features/movie_detail/data/models/movie_detail_model.dart';
import 'package:riverpod_clean_base/features/movie_detail/domain/entities/cast_member.dart';
import 'package:riverpod_clean_base/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:riverpod_clean_base/features/movie_detail/domain/repositories/movie_detail_repository.dart';

class MovieDetailRepositoryImpl implements MovieDetailRepository {
  final MovieDetailRemoteDatasource _remoteDatasource;

  MovieDetailRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetail(int movieId) async {
    try {
      final data = await _remoteDatasource.getMovieDetail(movieId);
      final model = MovieDetailModel.fromJson(data);
      return Right(model.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CastMember>>> getMovieCredits(int movieId) async {
    try {
      final data = await _remoteDatasource.getMovieCredits(movieId);
      final cast = (data['cast'] as List)
          .map((e) => CastModel.fromJson(e as Map<String, dynamic>).toEntity())
          .toList();
      return Right(cast);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getSimilarMovies(int movieId) async {
    try {
      final data = await _remoteDatasource.getSimilarMovies(movieId);
      final movies = (data['results'] as List)
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>).toEntity())
          .toList();
      return Right(movies);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  Failure _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout) {
      return const Failure.network();
    }
    return Failure.server(
      message: e.response?.data?['status_message'] ?? 'Server error',
      statusCode: e.response?.statusCode,
    );
  }
}
