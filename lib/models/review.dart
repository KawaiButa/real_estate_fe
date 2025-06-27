import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:real_estate_fe/models/image.dart';
// Assume that the User model and UserSchema are defined in user.dart
import 'user.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
class Review with _$Review {
  const factory Review({
    required String id,
    required String propertyId,
    required String reviewerId,
    required int rating,
    required String reviewText,
    required DateTime createdAt,
    User? reviewer,
    @Default(false) bool hasVoted,
    @Default(0) int helpfulCount,
    @Default(false) bool featured,
    @Default([]) List<ReviewResponse> responses,
    @Default([]) List<Image> images,
    @Default([]) List<HelpfulVote> helpfulVotes,
    @Default(false) bool isComposingReply,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

@freezed
class ReviewResponse with _$ReviewResponse {
  const factory ReviewResponse(
      {required String id,
      required String reviewId,
      required String responseText,
      required DateTime createdAt}) = _ReviewResponse;

  factory ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseFromJson(json);
}

/// Represents a helpful vote on a review.
@freezed
class HelpfulVote with _$HelpfulVote {
  const factory HelpfulVote({
    /// The review id (UUID as String).
    required String reviewId,

    /// The id of the voter (UUID as String).
    required String voterId,
  }) = _HelpfulVote;

  factory HelpfulVote.fromJson(Map<String, dynamic> json) =>
      _$HelpfulVoteFromJson(json);
}
