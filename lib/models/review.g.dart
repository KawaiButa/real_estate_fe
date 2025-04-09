// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      propertyId: json['property_id'] as String,
      reviewerId: json['reviewer_id'] as String?,
      rating: (json['rating'] as num).toInt(),
      reviewText: json['review_text'] as String,
      helpfulCount: (json['helpful_count'] as num?)?.toInt() ?? 0,
      featured: json['featured'] as bool? ?? false,
      reviewer: User.fromJson(json['reviewer'] as Map<String, dynamic>),
      responses: (json['responses'] as List<dynamic>?)
              ?.map((e) => ReviewResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      media: (json['media'] as List<dynamic>?)
              ?.map((e) => ReviewMedia.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      helpfulVotes: (json['helpful_votes'] as List<dynamic>?)
              ?.map((e) => HelpfulVote.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'property_id': instance.propertyId,
      'reviewer_id': instance.reviewerId,
      'rating': instance.rating,
      'review_text': instance.reviewText,
      'helpful_count': instance.helpfulCount,
      'featured': instance.featured,
      'reviewer': instance.reviewer,
      'responses': instance.responses,
      'media': instance.media,
      'helpful_votes': instance.helpfulVotes,
    };

_$ReviewMediaImpl _$$ReviewMediaImplFromJson(Map<String, dynamic> json) =>
    _$ReviewMediaImpl(
      reviewId: json['review_id'] as String,
      mediaUrl: json['media_url'] as String,
      mediaType: json['media_type'] as String,
    );

Map<String, dynamic> _$$ReviewMediaImplToJson(_$ReviewMediaImpl instance) =>
    <String, dynamic>{
      'review_id': instance.reviewId,
      'media_url': instance.mediaUrl,
      'media_type': instance.mediaType,
    };

_$ReviewResponseImpl _$$ReviewResponseImplFromJson(Map<String, dynamic> json) =>
    _$ReviewResponseImpl(
      reviewId: json['review_id'] as String,
      responseText: json['response_text'] as String,
    );

Map<String, dynamic> _$$ReviewResponseImplToJson(
        _$ReviewResponseImpl instance) =>
    <String, dynamic>{
      'review_id': instance.reviewId,
      'response_text': instance.responseText,
    };

_$HelpfulVoteImpl _$$HelpfulVoteImplFromJson(Map<String, dynamic> json) =>
    _$HelpfulVoteImpl(
      reviewId: json['review_id'] as String,
      voterId: json['voter_id'] as String,
    );

Map<String, dynamic> _$$HelpfulVoteImplToJson(_$HelpfulVoteImpl instance) =>
    <String, dynamic>{
      'review_id': instance.reviewId,
      'voter_id': instance.voterId,
    };
