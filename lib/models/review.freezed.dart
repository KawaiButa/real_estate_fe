// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
mixin _$Review {
  /// The property id (UUID represented as String).
  String get propertyId => throw _privateConstructorUsedError;

  /// The reviewer id (UUID represented as String). Nullable.
  String? get reviewerId => throw _privateConstructorUsedError;

  /// Rating between 1 and 5.
  int get rating => throw _privateConstructorUsedError;

  /// The review text.
  String get reviewText => throw _privateConstructorUsedError;

  /// The helpful vote count (default 0).
  int get helpfulCount => throw _privateConstructorUsedError;

  /// If the review is featured (default false).
  bool get featured => throw _privateConstructorUsedError;

  /// The reviewer. Replace this with the appropriate User model.
  User get reviewer => throw _privateConstructorUsedError;

  /// A list of review responses.
  List<ReviewResponse> get responses => throw _privateConstructorUsedError;

  /// A list of review media.
  List<ReviewMedia> get media => throw _privateConstructorUsedError;

  /// A list of helpful votes.
  List<HelpfulVote> get helpfulVotes => throw _privateConstructorUsedError;

  /// Serializes this Review to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res, Review>;
  @useResult
  $Res call(
      {String propertyId,
      String? reviewerId,
      int rating,
      String reviewText,
      int helpfulCount,
      bool featured,
      User reviewer,
      List<ReviewResponse> responses,
      List<ReviewMedia> media,
      List<HelpfulVote> helpfulVotes});

  $UserCopyWith<$Res> get reviewer;
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res, $Val extends Review>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyId = null,
    Object? reviewerId = freezed,
    Object? rating = null,
    Object? reviewText = null,
    Object? helpfulCount = null,
    Object? featured = null,
    Object? reviewer = null,
    Object? responses = null,
    Object? media = null,
    Object? helpfulVotes = null,
  }) {
    return _then(_value.copyWith(
      propertyId: null == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String,
      reviewerId: freezed == reviewerId
          ? _value.reviewerId
          : reviewerId // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      reviewText: null == reviewText
          ? _value.reviewText
          : reviewText // ignore: cast_nullable_to_non_nullable
              as String,
      helpfulCount: null == helpfulCount
          ? _value.helpfulCount
          : helpfulCount // ignore: cast_nullable_to_non_nullable
              as int,
      featured: null == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool,
      reviewer: null == reviewer
          ? _value.reviewer
          : reviewer // ignore: cast_nullable_to_non_nullable
              as User,
      responses: null == responses
          ? _value.responses
          : responses // ignore: cast_nullable_to_non_nullable
              as List<ReviewResponse>,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<ReviewMedia>,
      helpfulVotes: null == helpfulVotes
          ? _value.helpfulVotes
          : helpfulVotes // ignore: cast_nullable_to_non_nullable
              as List<HelpfulVote>,
    ) as $Val);
  }

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get reviewer {
    return $UserCopyWith<$Res>(_value.reviewer, (value) {
      return _then(_value.copyWith(reviewer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewImplCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$$ReviewImplCopyWith(
          _$ReviewImpl value, $Res Function(_$ReviewImpl) then) =
      __$$ReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String propertyId,
      String? reviewerId,
      int rating,
      String reviewText,
      int helpfulCount,
      bool featured,
      User reviewer,
      List<ReviewResponse> responses,
      List<ReviewMedia> media,
      List<HelpfulVote> helpfulVotes});

  @override
  $UserCopyWith<$Res> get reviewer;
}

/// @nodoc
class __$$ReviewImplCopyWithImpl<$Res>
    extends _$ReviewCopyWithImpl<$Res, _$ReviewImpl>
    implements _$$ReviewImplCopyWith<$Res> {
  __$$ReviewImplCopyWithImpl(
      _$ReviewImpl _value, $Res Function(_$ReviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyId = null,
    Object? reviewerId = freezed,
    Object? rating = null,
    Object? reviewText = null,
    Object? helpfulCount = null,
    Object? featured = null,
    Object? reviewer = null,
    Object? responses = null,
    Object? media = null,
    Object? helpfulVotes = null,
  }) {
    return _then(_$ReviewImpl(
      propertyId: null == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String,
      reviewerId: freezed == reviewerId
          ? _value.reviewerId
          : reviewerId // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      reviewText: null == reviewText
          ? _value.reviewText
          : reviewText // ignore: cast_nullable_to_non_nullable
              as String,
      helpfulCount: null == helpfulCount
          ? _value.helpfulCount
          : helpfulCount // ignore: cast_nullable_to_non_nullable
              as int,
      featured: null == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool,
      reviewer: null == reviewer
          ? _value.reviewer
          : reviewer // ignore: cast_nullable_to_non_nullable
              as User,
      responses: null == responses
          ? _value._responses
          : responses // ignore: cast_nullable_to_non_nullable
              as List<ReviewResponse>,
      media: null == media
          ? _value._media
          : media // ignore: cast_nullable_to_non_nullable
              as List<ReviewMedia>,
      helpfulVotes: null == helpfulVotes
          ? _value._helpfulVotes
          : helpfulVotes // ignore: cast_nullable_to_non_nullable
              as List<HelpfulVote>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewImpl implements _Review {
  const _$ReviewImpl(
      {required this.propertyId,
      this.reviewerId,
      required this.rating,
      required this.reviewText,
      this.helpfulCount = 0,
      this.featured = false,
      required this.reviewer,
      final List<ReviewResponse> responses = const [],
      final List<ReviewMedia> media = const [],
      final List<HelpfulVote> helpfulVotes = const []})
      : _responses = responses,
        _media = media,
        _helpfulVotes = helpfulVotes;

  factory _$ReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewImplFromJson(json);

  /// The property id (UUID represented as String).
  @override
  final String propertyId;

  /// The reviewer id (UUID represented as String). Nullable.
  @override
  final String? reviewerId;

  /// Rating between 1 and 5.
  @override
  final int rating;

  /// The review text.
  @override
  final String reviewText;

  /// The helpful vote count (default 0).
  @override
  @JsonKey()
  final int helpfulCount;

  /// If the review is featured (default false).
  @override
  @JsonKey()
  final bool featured;

  /// The reviewer. Replace this with the appropriate User model.
  @override
  final User reviewer;

  /// A list of review responses.
  final List<ReviewResponse> _responses;

  /// A list of review responses.
  @override
  @JsonKey()
  List<ReviewResponse> get responses {
    if (_responses is EqualUnmodifiableListView) return _responses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_responses);
  }

  /// A list of review media.
  final List<ReviewMedia> _media;

  /// A list of review media.
  @override
  @JsonKey()
  List<ReviewMedia> get media {
    if (_media is EqualUnmodifiableListView) return _media;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_media);
  }

  /// A list of helpful votes.
  final List<HelpfulVote> _helpfulVotes;

  /// A list of helpful votes.
  @override
  @JsonKey()
  List<HelpfulVote> get helpfulVotes {
    if (_helpfulVotes is EqualUnmodifiableListView) return _helpfulVotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_helpfulVotes);
  }

  @override
  String toString() {
    return 'Review(propertyId: $propertyId, reviewerId: $reviewerId, rating: $rating, reviewText: $reviewText, helpfulCount: $helpfulCount, featured: $featured, reviewer: $reviewer, responses: $responses, media: $media, helpfulVotes: $helpfulVotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewImpl &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId) &&
            (identical(other.reviewerId, reviewerId) ||
                other.reviewerId == reviewerId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewText, reviewText) ||
                other.reviewText == reviewText) &&
            (identical(other.helpfulCount, helpfulCount) ||
                other.helpfulCount == helpfulCount) &&
            (identical(other.featured, featured) ||
                other.featured == featured) &&
            (identical(other.reviewer, reviewer) ||
                other.reviewer == reviewer) &&
            const DeepCollectionEquality()
                .equals(other._responses, _responses) &&
            const DeepCollectionEquality().equals(other._media, _media) &&
            const DeepCollectionEquality()
                .equals(other._helpfulVotes, _helpfulVotes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      propertyId,
      reviewerId,
      rating,
      reviewText,
      helpfulCount,
      featured,
      reviewer,
      const DeepCollectionEquality().hash(_responses),
      const DeepCollectionEquality().hash(_media),
      const DeepCollectionEquality().hash(_helpfulVotes));

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      __$$ReviewImplCopyWithImpl<_$ReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewImplToJson(
      this,
    );
  }
}

abstract class _Review implements Review {
  const factory _Review(
      {required final String propertyId,
      final String? reviewerId,
      required final int rating,
      required final String reviewText,
      final int helpfulCount,
      final bool featured,
      required final User reviewer,
      final List<ReviewResponse> responses,
      final List<ReviewMedia> media,
      final List<HelpfulVote> helpfulVotes}) = _$ReviewImpl;

  factory _Review.fromJson(Map<String, dynamic> json) = _$ReviewImpl.fromJson;

  /// The property id (UUID represented as String).
  @override
  String get propertyId;

  /// The reviewer id (UUID represented as String). Nullable.
  @override
  String? get reviewerId;

  /// Rating between 1 and 5.
  @override
  int get rating;

  /// The review text.
  @override
  String get reviewText;

  /// The helpful vote count (default 0).
  @override
  int get helpfulCount;

  /// If the review is featured (default false).
  @override
  bool get featured;

  /// The reviewer. Replace this with the appropriate User model.
  @override
  User get reviewer;

  /// A list of review responses.
  @override
  List<ReviewResponse> get responses;

  /// A list of review media.
  @override
  List<ReviewMedia> get media;

  /// A list of helpful votes.
  @override
  List<HelpfulVote> get helpfulVotes;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReviewMedia _$ReviewMediaFromJson(Map<String, dynamic> json) {
  return _ReviewMedia.fromJson(json);
}

/// @nodoc
mixin _$ReviewMedia {
  /// The review id (UUID as String).
  String get reviewId => throw _privateConstructorUsedError;

  /// The URL for the media.
  String get mediaUrl => throw _privateConstructorUsedError;

  /// The media type.
  String get mediaType => throw _privateConstructorUsedError;

  /// Serializes this ReviewMedia to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewMediaCopyWith<ReviewMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewMediaCopyWith<$Res> {
  factory $ReviewMediaCopyWith(
          ReviewMedia value, $Res Function(ReviewMedia) then) =
      _$ReviewMediaCopyWithImpl<$Res, ReviewMedia>;
  @useResult
  $Res call({String reviewId, String mediaUrl, String mediaType});
}

/// @nodoc
class _$ReviewMediaCopyWithImpl<$Res, $Val extends ReviewMedia>
    implements $ReviewMediaCopyWith<$Res> {
  _$ReviewMediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = null,
    Object? mediaUrl = null,
    Object? mediaType = null,
  }) {
    return _then(_value.copyWith(
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewMediaImplCopyWith<$Res>
    implements $ReviewMediaCopyWith<$Res> {
  factory _$$ReviewMediaImplCopyWith(
          _$ReviewMediaImpl value, $Res Function(_$ReviewMediaImpl) then) =
      __$$ReviewMediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reviewId, String mediaUrl, String mediaType});
}

/// @nodoc
class __$$ReviewMediaImplCopyWithImpl<$Res>
    extends _$ReviewMediaCopyWithImpl<$Res, _$ReviewMediaImpl>
    implements _$$ReviewMediaImplCopyWith<$Res> {
  __$$ReviewMediaImplCopyWithImpl(
      _$ReviewMediaImpl _value, $Res Function(_$ReviewMediaImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = null,
    Object? mediaUrl = null,
    Object? mediaType = null,
  }) {
    return _then(_$ReviewMediaImpl(
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewMediaImpl implements _ReviewMedia {
  const _$ReviewMediaImpl(
      {required this.reviewId,
      required this.mediaUrl,
      required this.mediaType});

  factory _$ReviewMediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewMediaImplFromJson(json);

  /// The review id (UUID as String).
  @override
  final String reviewId;

  /// The URL for the media.
  @override
  final String mediaUrl;

  /// The media type.
  @override
  final String mediaType;

  @override
  String toString() {
    return 'ReviewMedia(reviewId: $reviewId, mediaUrl: $mediaUrl, mediaType: $mediaType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewMediaImpl &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reviewId, mediaUrl, mediaType);

  /// Create a copy of ReviewMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewMediaImplCopyWith<_$ReviewMediaImpl> get copyWith =>
      __$$ReviewMediaImplCopyWithImpl<_$ReviewMediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewMediaImplToJson(
      this,
    );
  }
}

abstract class _ReviewMedia implements ReviewMedia {
  const factory _ReviewMedia(
      {required final String reviewId,
      required final String mediaUrl,
      required final String mediaType}) = _$ReviewMediaImpl;

  factory _ReviewMedia.fromJson(Map<String, dynamic> json) =
      _$ReviewMediaImpl.fromJson;

  /// The review id (UUID as String).
  @override
  String get reviewId;

  /// The URL for the media.
  @override
  String get mediaUrl;

  /// The media type.
  @override
  String get mediaType;

  /// Create a copy of ReviewMedia
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewMediaImplCopyWith<_$ReviewMediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReviewResponse _$ReviewResponseFromJson(Map<String, dynamic> json) {
  return _ReviewResponse.fromJson(json);
}

/// @nodoc
mixin _$ReviewResponse {
  /// The review id (UUID as String).
  String get reviewId => throw _privateConstructorUsedError;

  /// The response text.
  String get responseText => throw _privateConstructorUsedError;

  /// Serializes this ReviewResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewResponseCopyWith<ReviewResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewResponseCopyWith<$Res> {
  factory $ReviewResponseCopyWith(
          ReviewResponse value, $Res Function(ReviewResponse) then) =
      _$ReviewResponseCopyWithImpl<$Res, ReviewResponse>;
  @useResult
  $Res call({String reviewId, String responseText});
}

/// @nodoc
class _$ReviewResponseCopyWithImpl<$Res, $Val extends ReviewResponse>
    implements $ReviewResponseCopyWith<$Res> {
  _$ReviewResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = null,
    Object? responseText = null,
  }) {
    return _then(_value.copyWith(
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
      responseText: null == responseText
          ? _value.responseText
          : responseText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewResponseImplCopyWith<$Res>
    implements $ReviewResponseCopyWith<$Res> {
  factory _$$ReviewResponseImplCopyWith(_$ReviewResponseImpl value,
          $Res Function(_$ReviewResponseImpl) then) =
      __$$ReviewResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reviewId, String responseText});
}

/// @nodoc
class __$$ReviewResponseImplCopyWithImpl<$Res>
    extends _$ReviewResponseCopyWithImpl<$Res, _$ReviewResponseImpl>
    implements _$$ReviewResponseImplCopyWith<$Res> {
  __$$ReviewResponseImplCopyWithImpl(
      _$ReviewResponseImpl _value, $Res Function(_$ReviewResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = null,
    Object? responseText = null,
  }) {
    return _then(_$ReviewResponseImpl(
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
      responseText: null == responseText
          ? _value.responseText
          : responseText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewResponseImpl implements _ReviewResponse {
  const _$ReviewResponseImpl(
      {required this.reviewId, required this.responseText});

  factory _$ReviewResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewResponseImplFromJson(json);

  /// The review id (UUID as String).
  @override
  final String reviewId;

  /// The response text.
  @override
  final String responseText;

  @override
  String toString() {
    return 'ReviewResponse(reviewId: $reviewId, responseText: $responseText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewResponseImpl &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.responseText, responseText) ||
                other.responseText == responseText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reviewId, responseText);

  /// Create a copy of ReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewResponseImplCopyWith<_$ReviewResponseImpl> get copyWith =>
      __$$ReviewResponseImplCopyWithImpl<_$ReviewResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewResponseImplToJson(
      this,
    );
  }
}

abstract class _ReviewResponse implements ReviewResponse {
  const factory _ReviewResponse(
      {required final String reviewId,
      required final String responseText}) = _$ReviewResponseImpl;

  factory _ReviewResponse.fromJson(Map<String, dynamic> json) =
      _$ReviewResponseImpl.fromJson;

  /// The review id (UUID as String).
  @override
  String get reviewId;

  /// The response text.
  @override
  String get responseText;

  /// Create a copy of ReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewResponseImplCopyWith<_$ReviewResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HelpfulVote _$HelpfulVoteFromJson(Map<String, dynamic> json) {
  return _HelpfulVote.fromJson(json);
}

/// @nodoc
mixin _$HelpfulVote {
  /// The review id (UUID as String).
  String get reviewId => throw _privateConstructorUsedError;

  /// The id of the voter (UUID as String).
  String get voterId => throw _privateConstructorUsedError;

  /// Serializes this HelpfulVote to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HelpfulVote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HelpfulVoteCopyWith<HelpfulVote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HelpfulVoteCopyWith<$Res> {
  factory $HelpfulVoteCopyWith(
          HelpfulVote value, $Res Function(HelpfulVote) then) =
      _$HelpfulVoteCopyWithImpl<$Res, HelpfulVote>;
  @useResult
  $Res call({String reviewId, String voterId});
}

/// @nodoc
class _$HelpfulVoteCopyWithImpl<$Res, $Val extends HelpfulVote>
    implements $HelpfulVoteCopyWith<$Res> {
  _$HelpfulVoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HelpfulVote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = null,
    Object? voterId = null,
  }) {
    return _then(_value.copyWith(
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
      voterId: null == voterId
          ? _value.voterId
          : voterId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HelpfulVoteImplCopyWith<$Res>
    implements $HelpfulVoteCopyWith<$Res> {
  factory _$$HelpfulVoteImplCopyWith(
          _$HelpfulVoteImpl value, $Res Function(_$HelpfulVoteImpl) then) =
      __$$HelpfulVoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reviewId, String voterId});
}

/// @nodoc
class __$$HelpfulVoteImplCopyWithImpl<$Res>
    extends _$HelpfulVoteCopyWithImpl<$Res, _$HelpfulVoteImpl>
    implements _$$HelpfulVoteImplCopyWith<$Res> {
  __$$HelpfulVoteImplCopyWithImpl(
      _$HelpfulVoteImpl _value, $Res Function(_$HelpfulVoteImpl) _then)
      : super(_value, _then);

  /// Create a copy of HelpfulVote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = null,
    Object? voterId = null,
  }) {
    return _then(_$HelpfulVoteImpl(
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
      voterId: null == voterId
          ? _value.voterId
          : voterId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HelpfulVoteImpl implements _HelpfulVote {
  const _$HelpfulVoteImpl({required this.reviewId, required this.voterId});

  factory _$HelpfulVoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$HelpfulVoteImplFromJson(json);

  /// The review id (UUID as String).
  @override
  final String reviewId;

  /// The id of the voter (UUID as String).
  @override
  final String voterId;

  @override
  String toString() {
    return 'HelpfulVote(reviewId: $reviewId, voterId: $voterId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HelpfulVoteImpl &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.voterId, voterId) || other.voterId == voterId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reviewId, voterId);

  /// Create a copy of HelpfulVote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HelpfulVoteImplCopyWith<_$HelpfulVoteImpl> get copyWith =>
      __$$HelpfulVoteImplCopyWithImpl<_$HelpfulVoteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HelpfulVoteImplToJson(
      this,
    );
  }
}

abstract class _HelpfulVote implements HelpfulVote {
  const factory _HelpfulVote(
      {required final String reviewId,
      required final String voterId}) = _$HelpfulVoteImpl;

  factory _HelpfulVote.fromJson(Map<String, dynamic> json) =
      _$HelpfulVoteImpl.fromJson;

  /// The review id (UUID as String).
  @override
  String get reviewId;

  /// The id of the voter (UUID as String).
  @override
  String get voterId;

  /// Create a copy of HelpfulVote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HelpfulVoteImplCopyWith<_$HelpfulVoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
