import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_clean_base/core/network/dio_client.dart';
import 'package:riverpod_clean_base/core/providers/core_providers.dart';
import 'package:riverpod_clean_base/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:riverpod_clean_base/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:riverpod_clean_base/features/auth/domain/repositories/auth_repository.dart';
import 'package:riverpod_clean_base/shared/domain/entities/no_params.dart';
import 'package:riverpod_clean_base/features/auth/domain/usecases/create_guest_session_usecase.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
AuthRemoteDatasource authRemoteDatasource(AuthRemoteDatasourceRef ref) {
  return AuthRemoteDatasource(ref.watch(dioProvider));
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(
    ref.watch(authRemoteDatasourceProvider),
    ref.watch(sharedPreferencesProvider),
  );
}

@Riverpod(keepAlive: true)
CreateGuestSessionUseCase createGuestSessionUseCase(
  CreateGuestSessionUseCaseRef ref,
) {
  return CreateGuestSessionUseCase(ref.watch(authRepositoryProvider));
}

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  Future<bool> build() async {
    final repo = ref.watch(authRepositoryProvider);
    return repo.hasValidSession();
  }

  Future<void> createGuestSession() async {
    state = const AsyncLoading();
    final useCase = ref.read(createGuestSessionUseCaseProvider);
    final result = await useCase(const NoParams());
    state = result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      (_) => const AsyncData(true),
    );
  }

  Future<void> logout() async {
    final repo = ref.read(authRepositoryProvider);
    await repo.clearSession();
    state = const AsyncData(false);
  }
}
