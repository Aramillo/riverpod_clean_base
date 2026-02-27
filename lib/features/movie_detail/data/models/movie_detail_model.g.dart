// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieDetailModelImpl _$$MovieDetailModelImplFromJson(
  Map<String, dynamic> json,
) => _$MovieDetailModelImpl(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  overview: json['overview'] as String?,
  posterPath: json['poster_path'] as String?,
  backdropPath: json['backdrop_path'] as String?,
  voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
  voteCount: (json['vote_count'] as num?)?.toInt() ?? 0,
  releaseDate: json['release_date'] as String?,
  runtime: (json['runtime'] as num?)?.toInt() ?? 0,
  genres:
      (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  tagline: json['tagline'] as String?,
);

Map<String, dynamic> _$$MovieDetailModelImplToJson(
  _$MovieDetailModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'overview': instance.overview,
  'poster_path': instance.posterPath,
  'backdrop_path': instance.backdropPath,
  'vote_average': instance.voteAverage,
  'vote_count': instance.voteCount,
  'release_date': instance.releaseDate,
  'runtime': instance.runtime,
  'genres': instance.genres,
  'tagline': instance.tagline,
};

_$GenreModelImpl _$$GenreModelImplFromJson(Map<String, dynamic> json) =>
    _$GenreModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$GenreModelImplToJson(_$GenreModelImpl instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
