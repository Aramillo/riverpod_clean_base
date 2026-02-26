import 'package:dio/dio.dart';
import 'package:riverpod_clean_base/core/constants/api_constants.dart';

class AuthRemoteDatasource {
  final Dio _dio;

  AuthRemoteDatasource(this._dio);

  Future<Map<String, dynamic>> createGuestSession() async {
    final response = await _dio.get(ApiConstants.guestSession);
    return response.data as Map<String, dynamic>;
  }
}
