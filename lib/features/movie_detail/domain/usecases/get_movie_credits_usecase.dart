import 'package:dartz/dartz.dart';
import 'package:riverpod_clean_base/core/errors/failures.dart';
import 'package:riverpod_clean_base/features/movie_detail/domain/entities/cast_member.dart';
import 'package:riverpod_clean_base/features/movie_detail/domain/repositories/movie_detail_repository.dart';
import 'package:riverpod_clean_base/shared/domain/usecase.dart';

class GetMovieCreditsUseCase extends UseCase<List<CastMember>, int> {
  final MovieDetailRepository _repository;

  GetMovieCreditsUseCase(this._repository);

  @override
  Future<Either<Failure, List<CastMember>>> call(int movieId) {
    return _repository.getMovieCredits(movieId);
  }
}
