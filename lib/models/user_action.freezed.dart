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

UserAction _$UserActionFromJson(Map<String, dynamic> json) {
  return _UserAction.fromJson(json);
}

/// @nodoc
mixin _$UserAction {
  String get id => throw _privateConstructorUsedError;
  String get propertyId => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserAction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserActionCopyWith<UserAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserActionCopyWith<$Res> {
  factory $UserActionCopyWith(
          UserAction value, $Res Function(UserAction) then) =
      _$UserActionCopyWithImpl<$Res, UserAction>;
  @useResult
  $Res call(
      {String id,
      String propertyId,
      String? userId,
      String action,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$UserActionCopyWithImpl<$Res, $Val extends UserAction>
    implements $UserActionCopyWith<$Res> {
  _$UserActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? propertyId = null,
    Object? userId = freezed,
    Object? action = null,
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
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
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
abstract class _$$UserActionImplCopyWith<$Res>
    implements $UserActionCopyWith<$Res> {
  factory _$$UserActionImplCopyWith(
          _$UserActionImpl value, $Res Function(_$UserActionImpl) then) =
      __$$UserActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String propertyId,
      String? userId,
      String action,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$UserActionImplCopyWithImpl<$Res>
    extends _$UserActionCopyWithImpl<$Res, _$UserActionImpl>
    implements _$$UserActionImplCopyWith<$Res> {
  __$$UserActionImplCopyWithImpl(
      _$UserActionImpl _value, $Res Function(_$UserActionImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? propertyId = null,
    Object? userId = freezed,
    Object? action = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$UserActionImpl(
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
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
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
class _$UserActionImpl implements _UserAction {
  const _$UserActionImpl(
      {required this.id,
      required this.propertyId,
      this.userId,
      required this.action,
      required this.createdAt,
      required this.updatedAt});

  factory _$UserActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserActionImplFromJson(json);

  @override
  final String id;
  @override
  final String propertyId;
  @override
  final String? userId;
  @override
  final String action;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'UserAction(id: $id, propertyId: $propertyId, userId: $userId, action: $action, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserActionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, propertyId, userId, action, createdAt, updatedAt);

  /// Create a copy of UserAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserActionImplCopyWith<_$UserActionImpl> get copyWith =>
      __$$UserActionImplCopyWithImpl<_$UserActionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserActionImplToJson(
      this,
    );
  }
}

abstract class _UserAction implements UserAction {
  const factory _UserAction(
      {required final String id,
      required final String propertyId,
      final String? userId,
      required final String action,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$UserActionImpl;

  factory _UserAction.fromJson(Map<String, dynamic> json) =
      _$UserActionImpl.fromJson;

  @override
  String get id;
  @override
  String get propertyId;
  @override
  String? get userId;
  @override
  String get action;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of UserAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserActionImplCopyWith<_$UserActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
