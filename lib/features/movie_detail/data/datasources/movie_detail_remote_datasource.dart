import 'package:dio/dio.dart';
import 'package:riverpod_clean_base/core/constants/api_constants.dart';

class MovieDetailRemoteDatasource {
  final Dio _dio;

  MovieDetailRemoteDatasource(this._dio);

  Future<Map<String, dynamic>> getMovieDetail(int movieId) async {
    final response = await _dio.get(ApiConstants.movieDetail(movieId));
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getMovieCredits(int movieId) async {
    final response = await _dio.get(ApiConstants.movieCredits(movieId));
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getSimilarMovies(int movieId) async {
    final response = await _dio.get(ApiConstants.similarMovies(movieId));
    return response.data as Map<String, dynamic>;
  }
}
