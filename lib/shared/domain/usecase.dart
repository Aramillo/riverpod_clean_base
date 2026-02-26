import 'package:dartz/dartz.dart';
import 'package:riverpod_clean_base/core/errors/failures.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}
