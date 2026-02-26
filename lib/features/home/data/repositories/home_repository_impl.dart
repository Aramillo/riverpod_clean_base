import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_clean_base/core/errors/failures.dart';
import 'package:riverpod_clean_base/features/home/data/datasources/home_remote_datasource.dart';
import 'package:riverpod_clean_base/features/home/data/models/movie_model.dart';
import 'package:riverpod_clean_base/features/home/domain/entities/movie.dart';
import 'package:riverpod_clean_base/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource _remoteDatasource;

  HomeRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, List<Movie>>> getTrendingMovies({int page = 1}) async {
    try {
      final data = await _remoteDatasource.getTrendingMovies(page: page);
      final results = (data['results'] as List)
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>).toEntity())
          .toList();
      return Right(results);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies({int page = 1}) async {
    try {
      final data = await _remoteDatasource.getPopularMovies(page: page);
      final results = (data['results'] as List)
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>).toEntity())
          .toList();
      return Right(results);
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
