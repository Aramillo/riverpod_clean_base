import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_clean_base/core/errors/failures.dart';
import 'package:riverpod_clean_base/features/home/data/models/movie_model.dart';
import 'package:riverpod_clean_base/features/home/domain/entities/movie.dart';
import 'package:riverpod_clean_base/features/search/data/datasources/search_remote_datasource.dart';
import 'package:riverpod_clean_base/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDatasource _remoteDatasource;

  SearchRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String query, {int page = 1}) async {
    try {
      final data = await _remoteDatasource.searchMovies(query, page: page);
      final results = (data['results'] as List)
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>).toEntity())
          .toList();
      return Right(results);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        return const Left(Failure.network());
      }
      return Left(Failure.server(
        message: e.response?.data?['status_message'] ?? 'Server error',
        statusCode: e.response?.statusCode,
      ));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }
}
