import 'package:freezed_annotation/freezed_annotation.dart';
// Assume that the User model and UserSchema are defined in user.dart
import 'user.dart';

part 'review.freezed.dart';
part 'review.g.dart';

/// Represents a Review model.
@freezed
class Review with _$Review {
  const factory Review({
    /// The property id (UUID represented as String).
    required String propertyId,

    /// The reviewer id (UUID represented as String). Nullable.
    String? reviewerId,

    /// Rating between 1 and 5.
    required int rating,

    /// The review text.
    required String reviewText,

    /// The helpful vote count (default 0).
    @Default(0) int helpfulCount,

    /// If the review is featured (default false).
    @Default(false) bool featured,

    /// The reviewer. Replace this with the appropriate User model.
    required User reviewer,

    /// A list of review responses.
    @Default([]) List<ReviewResponse> responses,

    /// A list of review media.
    @Default([]) List<ReviewMedia> media,

    /// A list of helpful votes.
    @Default([]) List<HelpfulVote> helpfulVotes,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

/// Represents media attached to a review.
@freezed
class ReviewMedia with _$ReviewMedia {
  const factory ReviewMedia({
    /// The review id (UUID as String).
    required String reviewId,

    /// The URL for the media.
    required String mediaUrl,

    /// The media type.
    required String mediaType,
  }) = _ReviewMedia;

  factory ReviewMedia.fromJson(Map<String, dynamic> json) =>
      _$ReviewMediaFromJson(json);
}

/// Represents a response to a review.
@freezed
class ReviewResponse with _$ReviewResponse {
  const factory ReviewResponse({
    /// The review id (UUID as String).
    required String reviewId,

    /// The response text.
    required String responseText,
  }) = _ReviewResponse;

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
