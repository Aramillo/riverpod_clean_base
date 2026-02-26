import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_clean_base/core/errors/failures.dart';
import 'package:riverpod_clean_base/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:riverpod_clean_base/features/auth/domain/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;
  final SharedPreferences _prefs;

  static const _sessionKey = 'guest_session_id';
  static const _expiresKey = 'guest_session_expires';

  AuthRepositoryImpl(this._remoteDatasource, this._prefs);

  @override
  Future<Either<Failure, String>> createGuestSession() async {
    try {
      final data = await _remoteDatasource.createGuestSession();
      final sessionId = data['guest_session_id'] as String;
      final expiresAt = data['expires_at'] as String;

      await _prefs.setString(_sessionKey, sessionId);
      await _prefs.setString(_expiresKey, expiresAt);

      return Right(sessionId);
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

  @override
  Future<bool> hasValidSession() async {
    final sessionId = _prefs.getString(_sessionKey);
    final expiresAt = _prefs.getString(_expiresKey);

    if (sessionId == null || expiresAt == null) return false;

    try {
      final expiry = DateTime.parse(expiresAt.replaceAll(' UTC', 'Z'));
      return expiry.isAfter(DateTime.now());
    } catch (_) {
      return false;
    }
  }

  @override
  Future<void> clearSession() async {
    await _prefs.remove(_sessionKey);
    await _prefs.remove(_expiresKey);
  }
}
