import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_clean_base/features/movie_detail/domain/entities/cast_member.dart';

part 'cast_model.freezed.dart';
part 'cast_model.g.dart';

@freezed
class CastModel with _$CastModel {
  const CastModel._();

  const factory CastModel({
    required int id,
    required String name,
    String? character,
    @JsonKey(name: 'profile_path') String? profilePath,
  }) = _CastModel;

  factory CastModel.fromJson(Map<String, dynamic> json) =>
      _$CastModelFromJson(json);

  CastMember toEntity() => CastMember(
    id: id,
    name: name,
    character: character,
    profilePath: profilePath,
  );
}
