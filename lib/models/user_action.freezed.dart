// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PropertyVerification _$PropertyVerificationFromJson(Map<String, dynamic> json) {
  return _PropertyVerification.fromJson(json);
}

/// @nodoc
mixin _$PropertyVerification {
  String get id => throw _privateConstructorUsedError;
  String get propertyId => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PropertyVerification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PropertyVerification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PropertyVerificationCopyWith<PropertyVerification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertyVerificationCopyWith<$Res> {
  factory $PropertyVerificationCopyWith(PropertyVerification value,
          $Res Function(PropertyVerification) then) =
      _$PropertyVerificationCopyWithImpl<$Res, PropertyVerification>;
  @useResult
  $Res call(
      {String id,
      String propertyId,
      String? userId,
      String type,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$PropertyVerificationCopyWithImpl<$Res,
        $Val extends PropertyVerification>
    implements $PropertyVerificationCopyWith<$Res> {
  _$PropertyVerificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PropertyVerification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? propertyId = null,
    Object? userId = freezed,
    Object? type = null,
    Object? createdAt = null,
    Object? updatedAt = null,
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
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PropertyVerificationImplCopyWith<$Res>
    implements $PropertyVerificationCopyWith<$Res> {
  factory _$$PropertyVerificationImplCopyWith(_$PropertyVerificationImpl value,
          $Res Function(_$PropertyVerificationImpl) then) =
      __$$PropertyVerificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String propertyId,
      String? userId,
      String type,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$PropertyVerificationImplCopyWithImpl<$Res>
    extends _$PropertyVerificationCopyWithImpl<$Res, _$PropertyVerificationImpl>
    implements _$$PropertyVerificationImplCopyWith<$Res> {
  __$$PropertyVerificationImplCopyWithImpl(_$PropertyVerificationImpl _value,
      $Res Function(_$PropertyVerificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of PropertyVerification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? propertyId = null,
    Object? userId = freezed,
    Object? type = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$PropertyVerificationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      propertyId: null == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PropertyVerificationImpl implements _PropertyVerification {
  const _$PropertyVerificationImpl(
      {required this.id,
      required this.propertyId,
      this.userId,
      required this.type,
      required this.createdAt,
      required this.updatedAt});

  factory _$PropertyVerificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertyVerificationImplFromJson(json);

  @override
  final String id;
  @override
  final String propertyId;
  @override
  final String? userId;
  @override
  final String type;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'PropertyVerification(id: $id, propertyId: $propertyId, userId: $userId, type: $type, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertyVerificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, propertyId, userId, type, createdAt, updatedAt);

  /// Create a copy of PropertyVerification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertyVerificationImplCopyWith<_$PropertyVerificationImpl>
      get copyWith =>
          __$$PropertyVerificationImplCopyWithImpl<_$PropertyVerificationImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PropertyVerificationImplToJson(
      this,
    );
  }
}

abstract class _PropertyVerification implements PropertyVerification {
  const factory _PropertyVerification(
      {required final String id,
      required final String propertyId,
      final String? userId,
      required final String type,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$PropertyVerificationImpl;

  factory _PropertyVerification.fromJson(Map<String, dynamic> json) =
      _$PropertyVerificationImpl.fromJson;

  @override
  String get id;
  @override
  String get propertyId;
  @override
  String? get userId;
  @override
  String get type;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of PropertyVerification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PropertyVerificationImplCopyWith<_$PropertyVerificationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
