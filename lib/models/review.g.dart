// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      id: json['id'] as String,
      propertyId: json['property_id'] as String,
      reviewerId: json['reviewer_id'] as String,
      rating: (json['rating'] as num).toInt(),
      reviewText: json['review_text'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      reviewer: json['reviewer'] == null
          ? null
          : User.fromJson(json['reviewer'] as Map<String, dynamic>),
      hasVoted: json['has_voted'] as bool? ?? false,
      helpfulCount: (json['helpful_count'] as num?)?.toInt() ?? 0,
      featured: json['featured'] as bool? ?? false,
      responses: (json['responses'] as List<dynamic>?)
              ?.map((e) => ReviewResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      helpfulVotes: (json['helpful_votes'] as List<dynamic>?)
              ?.map((e) => HelpfulVote.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isComposingReply: json['is_composing_reply'] as bool? ?? false,
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'property_id': instance.propertyId,
      'reviewer_id': instance.reviewerId,
      'rating': instance.rating,
      'review_text': instance.reviewText,
      'created_at': instance.createdAt.toIso8601String(),
      'reviewer': instance.reviewer,
      'has_voted': instance.hasVoted,
      'helpful_count': instance.helpfulCount,
      'featured': instance.featured,
      'responses': instance.responses,
      'images': instance.images,
      'helpful_votes': instance.helpfulVotes,
      'is_composing_reply': instance.isComposingReply,
    };

_$ReviewResponseImpl _$$ReviewResponseImplFromJson(Map<String, dynamic> json) =>
    _$ReviewResponseImpl(
      id: json['id'] as String,
      reviewId: json['review_id'] as String,
      responseText: json['response_text'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$ReviewResponseImplToJson(
        _$ReviewResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'review_id': instance.reviewId,
      'response_text': instance.responseText,
      'created_at': instance.createdAt.toIso8601String(),
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
