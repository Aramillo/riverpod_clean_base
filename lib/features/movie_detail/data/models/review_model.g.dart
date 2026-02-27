// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewModelImpl _$$ReviewModelImplFromJson(Map<String, dynamic> json) =>
    _$ReviewModelImpl(
      id: json['id'] as String,
      author: json['author'] as String,
      content: json['content'] as String?,
      authorDetails: json['author_details'] == null
          ? null
          : AuthorDetails.fromJson(
              json['author_details'] as Map<String, dynamic>,
            ),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$ReviewModelImplToJson(_$ReviewModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'content': instance.content,
      'author_details': instance.authorDetails,
      'created_at': instance.createdAt,
    };

_$AuthorDetailsImpl _$$AuthorDetailsImplFromJson(Map<String, dynamic> json) =>
    _$AuthorDetailsImpl(rating: (json['rating'] as num?)?.toDouble());

Map<String, dynamic> _$$AuthorDetailsImplToJson(_$AuthorDetailsImpl instance) =>
    <String, dynamic>{'rating': instance.rating};
