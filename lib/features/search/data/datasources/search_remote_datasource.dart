import 'package:dio/dio.dart';
import 'package:riverpod_clean_base/core/constants/api_constants.dart';

class SearchRemoteDatasource {
  final Dio _dio;

  SearchRemoteDatasource(this._dio);

  Future<Map<String, dynamic>> searchMovies(String query, {int page = 1}) async {
    final response = await _dio.get(
      ApiConstants.searchMovie,
      queryParameters: {'query': query, 'page': page},
    );
    return response.data as Map<String, dynamic>;
  }
}
