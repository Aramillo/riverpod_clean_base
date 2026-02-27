import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_clean_base/features/movie_detail/domain/entities/movie_detail.dart';

part 'movie_detail_model.freezed.dart';
part 'movie_detail_model.g.dart';

@freezed
class MovieDetailModel with _$MovieDetailModel {
  const MovieDetailModel._();

  const factory MovieDetailModel({
    required int id,
    required String title,
    String? overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'vote_average') @Default(0.0) double voteAverage,
    @JsonKey(name: 'vote_count') @Default(0) int voteCount,
    @JsonKey(name: 'release_date') String? releaseDate,
    @Default(0) int runtime,
    @Default([]) List<GenreModel> genres,
    String? tagline,
  }) = _MovieDetailModel;

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailModelFromJson(json);

  MovieDetail toEntity() => MovieDetail(
    id: id,
    title: title,
    overview: overview,
    posterPath: posterPath,
    backdropPath: backdropPath,
    voteAverage: voteAverage,
    voteCount: voteCount,
    releaseDate: releaseDate,
    runtime: runtime,
    genres: genres.map((g) => g.name).toList(),
    tagline: tagline,
  );
}

@freezed
class GenreModel with _$GenreModel {
  const factory GenreModel({
    required int id,
    required String name,
  }) = _GenreModel;

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);
}
