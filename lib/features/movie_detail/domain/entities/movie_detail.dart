import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_detail.freezed.dart';

@freezed
class MovieDetail with _$MovieDetail {
  const factory MovieDetail({
    required int id,
    required String title,
    String? overview,
    String? posterPath,
    String? backdropPath,
    @Default(0.0) double voteAverage,
    @Default(0) int voteCount,
    String? releaseDate,
    @Default(0) int runtime,
    @Default([]) List<String> genres,
    String? tagline,
  }) = _MovieDetail;
}
