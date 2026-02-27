import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast_member.freezed.dart';

@freezed
class CastMember with _$CastMember {
  const factory CastMember({
    required int id,
    required String name,
    String? character,
    String? profilePath,
  }) = _CastMember;
}
