import 'package:dartz/dartz.dart';
import 'package:riverpod_clean_base/core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> createGuestSession();
  Future<bool> hasValidSession();
  Future<void> clearSession();
}
