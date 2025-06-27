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
  String get id => throw _privateConstructorUsedError;
  String get propertyId => throw _privateConstructorUsedError;
  String get reviewerId => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  String get reviewText => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  User? get reviewer => throw _privateConstructorUsedError;
  bool get hasVoted => throw _privateConstructorUsedError;
  int get helpfulCount => throw _privateConstructorUsedError;
  bool get featured => throw _privateConstructorUsedError;
  List<ReviewResponse> get responses => throw _privateConstructorUsedError;
  List<Image> get images => throw _privateConstructorUsedError;
  List<HelpfulVote> get helpfulVotes => throw _privateConstructorUsedError;
  bool get isComposingReply => throw _privateConstructorUsedError;

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
      {String id,
      String propertyId,
      String reviewerId,
      int rating,
      String reviewText,
      DateTime createdAt,
      User? reviewer,
      bool hasVoted,
      int helpfulCount,
      bool featured,
      List<ReviewResponse> responses,
      List<Image> images,
      List<HelpfulVote> helpfulVotes,
      bool isComposingReply});

  $UserCopyWith<$Res>? get reviewer;
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
    Object? id = null,
    Object? propertyId = null,
    Object? reviewerId = null,
    Object? rating = null,
    Object? reviewText = null,
    Object? createdAt = null,
    Object? reviewer = freezed,
    Object? hasVoted = null,
    Object? helpfulCount = null,
    Object? featured = null,
    Object? responses = null,
    Object? images = null,
    Object? helpfulVotes = null,
    Object? isComposingReply = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      propertyId: null == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String,
      reviewerId: null == reviewerId
          ? _value.reviewerId
          : reviewerId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      reviewText: null == reviewText
          ? _value.reviewText
          : reviewText // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reviewer: freezed == reviewer
          ? _value.reviewer
          : reviewer // ignore: cast_nullable_to_non_nullable
              as User?,
      hasVoted: null == hasVoted
          ? _value.hasVoted
          : hasVoted // ignore: cast_nullable_to_non_nullable
              as bool,
      helpfulCount: null == helpfulCount
          ? _value.helpfulCount
          : helpfulCount // ignore: cast_nullable_to_non_nullable
              as int,
      featured: null == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool,
      responses: null == responses
          ? _value.responses
          : responses // ignore: cast_nullable_to_non_nullable
              as List<ReviewResponse>,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>,
      helpfulVotes: null == helpfulVotes
          ? _value.helpfulVotes
          : helpfulVotes // ignore: cast_nullable_to_non_nullable
              as List<HelpfulVote>,
      isComposingReply: null == isComposingReply
          ? _value.isComposingReply
          : isComposingReply // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get reviewer {
    if (_value.reviewer == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.reviewer!, (value) {
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
      {String id,
      String propertyId,
      String reviewerId,
      int rating,
      String reviewText,
      DateTime createdAt,
      User? reviewer,
      bool hasVoted,
      int helpfulCount,
      bool featured,
      List<ReviewResponse> responses,
      List<Image> images,
      List<HelpfulVote> helpfulVotes,
      bool isComposingReply});

  @override
  $UserCopyWith<$Res>? get reviewer;
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
    Object? id = null,
    Object? propertyId = null,
    Object? reviewerId = null,
    Object? rating = null,
    Object? reviewText = null,
    Object? createdAt = null,
    Object? reviewer = freezed,
    Object? hasVoted = null,
    Object? helpfulCount = null,
    Object? featured = null,
    Object? responses = null,
    Object? images = null,
    Object? helpfulVotes = null,
    Object? isComposingReply = null,
  }) {
    return _then(_$ReviewImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      propertyId: null == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String,
      reviewerId: null == reviewerId
          ? _value.reviewerId
          : reviewerId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      reviewText: null == reviewText
          ? _value.reviewText
          : reviewText // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reviewer: freezed == reviewer
          ? _value.reviewer
          : reviewer // ignore: cast_nullable_to_non_nullable
              as User?,
      hasVoted: null == hasVoted
          ? _value.hasVoted
          : hasVoted // ignore: cast_nullable_to_non_nullable
              as bool,
      helpfulCount: null == helpfulCount
          ? _value.helpfulCount
          : helpfulCount // ignore: cast_nullable_to_non_nullable
              as int,
      featured: null == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool,
      responses: null == responses
          ? _value._responses
          : responses // ignore: cast_nullable_to_non_nullable
              as List<ReviewResponse>,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>,
      helpfulVotes: null == helpfulVotes
          ? _value._helpfulVotes
          : helpfulVotes // ignore: cast_nullable_to_non_nullable
              as List<HelpfulVote>,
      isComposingReply: null == isComposingReply
          ? _value.isComposingReply
          : isComposingReply // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewImpl implements _Review {
  const _$ReviewImpl(
      {required this.id,
      required this.propertyId,
      required this.reviewerId,
      required this.rating,
      required this.reviewText,
      required this.createdAt,
      this.reviewer,
      this.hasVoted = false,
      this.helpfulCount = 0,
      this.featured = false,
      final List<ReviewResponse> responses = const [],
      final List<Image> images = const [],
      final List<HelpfulVote> helpfulVotes = const [],
      this.isComposingReply = false})
      : _responses = responses,
        _images = images,
        _helpfulVotes = helpfulVotes;

  factory _$ReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewImplFromJson(json);

  @override
  final String id;
  @override
  final String propertyId;
  @override
  final String reviewerId;
  @override
  final int rating;
  @override
  final String reviewText;
  @override
  final DateTime createdAt;
  @override
  final User? reviewer;
  @override
  @JsonKey()
  final bool hasVoted;
  @override
  @JsonKey()
  final int helpfulCount;
  @override
  @JsonKey()
  final bool featured;
  final List<ReviewResponse> _responses;
  @override
  @JsonKey()
  List<ReviewResponse> get responses {
    if (_responses is EqualUnmodifiableListView) return _responses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_responses);
  }

  final List<Image> _images;
  @override
  @JsonKey()
  List<Image> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<HelpfulVote> _helpfulVotes;
  @override
  @JsonKey()
  List<HelpfulVote> get helpfulVotes {
    if (_helpfulVotes is EqualUnmodifiableListView) return _helpfulVotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_helpfulVotes);
  }

  @override
  @JsonKey()
  final bool isComposingReply;

  @override
  String toString() {
    return 'Review(id: $id, propertyId: $propertyId, reviewerId: $reviewerId, rating: $rating, reviewText: $reviewText, createdAt: $createdAt, reviewer: $reviewer, hasVoted: $hasVoted, helpfulCount: $helpfulCount, featured: $featured, responses: $responses, images: $images, helpfulVotes: $helpfulVotes, isComposingReply: $isComposingReply)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId) &&
            (identical(other.reviewerId, reviewerId) ||
                other.reviewerId == reviewerId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewText, reviewText) ||
                other.reviewText == reviewText) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.reviewer, reviewer) ||
                other.reviewer == reviewer) &&
            (identical(other.hasVoted, hasVoted) ||
                other.hasVoted == hasVoted) &&
            (identical(other.helpfulCount, helpfulCount) ||
                other.helpfulCount == helpfulCount) &&
            (identical(other.featured, featured) ||
                other.featured == featured) &&
            const DeepCollectionEquality()
                .equals(other._responses, _responses) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other._helpfulVotes, _helpfulVotes) &&
            (identical(other.isComposingReply, isComposingReply) ||
                other.isComposingReply == isComposingReply));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      propertyId,
      reviewerId,
      rating,
      reviewText,
      createdAt,
      reviewer,
      hasVoted,
      helpfulCount,
      featured,
      const DeepCollectionEquality().hash(_responses),
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_helpfulVotes),
      isComposingReply);

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
      {required final String id,
      required final String propertyId,
      required final String reviewerId,
      required final int rating,
      required final String reviewText,
      required final DateTime createdAt,
      final User? reviewer,
      final bool hasVoted,
      final int helpfulCount,
      final bool featured,
      final List<ReviewResponse> responses,
      final List<Image> images,
      final List<HelpfulVote> helpfulVotes,
      final bool isComposingReply}) = _$ReviewImpl;

  factory _Review.fromJson(Map<String, dynamic> json) = _$ReviewImpl.fromJson;

  @override
  String get id;
  @override
  String get propertyId;
  @override
  String get reviewerId;
  @override
  int get rating;
  @override
  String get reviewText;
  @override
  DateTime get createdAt;
  @override
  User? get reviewer;
  @override
  bool get hasVoted;
  @override
  int get helpfulCount;
  @override
  bool get featured;
  @override
  List<ReviewResponse> get responses;
  @override
  List<Image> get images;
  @override
  List<HelpfulVote> get helpfulVotes;
  @override
  bool get isComposingReply;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReviewResponse _$ReviewResponseFromJson(Map<String, dynamic> json) {
  return _ReviewResponse.fromJson(json);
}

/// @nodoc
mixin _$ReviewResponse {
  String get id => throw _privateConstructorUsedError;
  String get reviewId => throw _privateConstructorUsedError;
  String get responseText => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

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
  $Res call(
      {String id, String reviewId, String responseText, DateTime createdAt});
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
    Object? id = null,
    Object? reviewId = null,
    Object? responseText = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
      responseText: null == responseText
          ? _value.responseText
          : responseText // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
  $Res call(
      {String id, String reviewId, String responseText, DateTime createdAt});
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
    Object? id = null,
    Object? reviewId = null,
    Object? responseText = null,
    Object? createdAt = null,
  }) {
    return _then(_$ReviewResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
      responseText: null == responseText
          ? _value.responseText
          : responseText // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewResponseImpl implements _ReviewResponse {
  const _$ReviewResponseImpl(
      {required this.id,
      required this.reviewId,
      required this.responseText,
      required this.createdAt});

  factory _$ReviewResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String reviewId;
  @override
  final String responseText;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'ReviewResponse(id: $id, reviewId: $reviewId, responseText: $responseText, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.responseText, responseText) ||
                other.responseText == responseText) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, reviewId, responseText, createdAt);

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
      {required final String id,
      required final String reviewId,
      required final String responseText,
      required final DateTime createdAt}) = _$ReviewResponseImpl;

  factory _ReviewResponse.fromJson(Map<String, dynamic> json) =
      _$ReviewResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get reviewId;
  @override
  String get responseText;
  @override
  DateTime get createdAt;

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
