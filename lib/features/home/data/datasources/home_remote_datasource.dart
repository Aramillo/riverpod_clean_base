import 'package:dio/dio.dart';
import 'package:riverpod_clean_base/core/constants/api_constants.dart';

class HomeRemoteDatasource {
  final Dio _dio;

  HomeRemoteDatasource(this._dio);

  Future<Map<String, dynamic>> getTrendingMovies({int page = 1}) async {
    final response = await _dio.get(
      ApiConstants.trending,
      queryParameters: {'page': page},
    );
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getPopularMovies({int page = 1}) async {
    final response = await _dio.get(
      ApiConstants.popular,
      queryParameters: {'page': page},
    );
    return response.data as Map<String, dynamic>;
  }
}
