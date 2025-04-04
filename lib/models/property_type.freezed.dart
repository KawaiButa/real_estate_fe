// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PropertyType _$PropertyTypeFromJson(Map<String, dynamic> json) {
  return _PropertyType.fromJson(json);
}

/// @nodoc
mixin _$PropertyType {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this PropertyType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PropertyType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PropertyTypeCopyWith<PropertyType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertyTypeCopyWith<$Res> {
  factory $PropertyTypeCopyWith(
          PropertyType value, $Res Function(PropertyType) then) =
      _$PropertyTypeCopyWithImpl<$Res, PropertyType>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$PropertyTypeCopyWithImpl<$Res, $Val extends PropertyType>
    implements $PropertyTypeCopyWith<$Res> {
  _$PropertyTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PropertyType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PropertyTypeImplCopyWith<$Res>
    implements $PropertyTypeCopyWith<$Res> {
  factory _$$PropertyTypeImplCopyWith(
          _$PropertyTypeImpl value, $Res Function(_$PropertyTypeImpl) then) =
      __$$PropertyTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$PropertyTypeImplCopyWithImpl<$Res>
    extends _$PropertyTypeCopyWithImpl<$Res, _$PropertyTypeImpl>
    implements _$$PropertyTypeImplCopyWith<$Res> {
  __$$PropertyTypeImplCopyWithImpl(
      _$PropertyTypeImpl _value, $Res Function(_$PropertyTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of PropertyType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$PropertyTypeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PropertyTypeImpl implements _PropertyType {
  const _$PropertyTypeImpl({required this.id, required this.name});

  factory _$PropertyTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertyTypeImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'PropertyType(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertyTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of PropertyType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertyTypeImplCopyWith<_$PropertyTypeImpl> get copyWith =>
      __$$PropertyTypeImplCopyWithImpl<_$PropertyTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PropertyTypeImplToJson(
      this,
    );
  }
}

abstract class _PropertyType implements PropertyType {
  const factory _PropertyType(
      {required final String id,
      required final String name}) = _$PropertyTypeImpl;

  factory _PropertyType.fromJson(Map<String, dynamic> json) =
      _$PropertyTypeImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of PropertyType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PropertyTypeImplCopyWith<_$PropertyTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
