import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_clean_base/features/movie_detail/domain/entities/review.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
class ReviewModel with _$ReviewModel {
  const ReviewModel._();

  const factory ReviewModel({
    required String id,
    required String author,
    String? content,
    @JsonKey(name: 'author_details') AuthorDetails? authorDetails,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Review toEntity() => Review(
    id: id,
    author: author,
    content: content,
    rating: authorDetails?.rating,
    createdAt: createdAt,
  );
}

@freezed
class AuthorDetails with _$AuthorDetails {
  const factory AuthorDetails({
    double? rating,
  }) = _AuthorDetails;

  factory AuthorDetails.fromJson(Map<String, dynamic> json) =>
      _$AuthorDetailsFromJson(json);
}
