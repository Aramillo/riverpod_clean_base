import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.server({required String message, int? statusCode}) =
      ServerFailure;
  const factory Failure.network({String? message}) = NetworkFailure;
  const factory Failure.cache({String? message}) = CacheFailure;
  const factory Failure.validation({required String message}) =
      ValidationFailure;
  const factory Failure.unknown({String? message}) = UnknownFailure;
}

extension FailureX on Failure {
  String get displayMessage => when(
    server: (message, _) => message,
    network: (message) => message ?? 'No internet connection',
    cache: (message) => message ?? 'Cache error',
    validation: (message) => message,
    unknown: (message) => message ?? 'Something went wrong',
  );
}
