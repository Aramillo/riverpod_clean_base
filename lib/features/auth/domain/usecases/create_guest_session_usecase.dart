import 'package:dartz/dartz.dart';
import 'package:riverpod_clean_base/core/errors/failures.dart';
import 'package:riverpod_clean_base/features/auth/domain/repositories/auth_repository.dart';
import 'package:riverpod_clean_base/shared/domain/entities/no_params.dart';
import 'package:riverpod_clean_base/shared/domain/usecase.dart';

class CreateGuestSessionUseCase extends UseCase<String, NoParams> {
  final AuthRepository _repository;

  CreateGuestSessionUseCase(this._repository);

  @override
  Future<Either<Failure, String>> call(NoParams params) {
    return _repository.createGuestSession();
  }
}
