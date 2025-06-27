// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tourview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Tourview _$TourviewFromJson(Map<String, dynamic> json) {
  return _Tourview.fromJson(json);
}

/// @nodoc
mixin _$Tourview {
  String get id => throw _privateConstructorUsedError;
  String get propertyId => throw _privateConstructorUsedError;
  String get imageId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Image? get image => throw _privateConstructorUsedError;
  Property? get property => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Tourview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Tourview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TourviewCopyWith<Tourview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TourviewCopyWith<$Res> {
  factory $TourviewCopyWith(Tourview value, $Res Function(Tourview) then) =
      _$TourviewCopyWithImpl<$Res, Tourview>;
  @useResult
  $Res call(
      {String id,
      String propertyId,
      String imageId,
      String name,
      Image? image,
      Property? property,
      DateTime createdAt,
      DateTime? updatedAt});

  $ImageCopyWith<$Res>? get image;
  $PropertyCopyWith<$Res>? get property;
}

/// @nodoc
class _$TourviewCopyWithImpl<$Res, $Val extends Tourview>
    implements $TourviewCopyWith<$Res> {
  _$TourviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Tourview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? propertyId = null,
    Object? imageId = null,
    Object? name = null,
    Object? image = freezed,
    Object? property = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
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
      imageId: null == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image?,
      property: freezed == property
          ? _value.property
          : property // ignore: cast_nullable_to_non_nullable
              as Property?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of Tourview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $ImageCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }

  /// Create a copy of Tourview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PropertyCopyWith<$Res>? get property {
    if (_value.property == null) {
      return null;
    }

    return $PropertyCopyWith<$Res>(_value.property!, (value) {
      return _then(_value.copyWith(property: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TourviewImplCopyWith<$Res>
    implements $TourviewCopyWith<$Res> {
  factory _$$TourviewImplCopyWith(
          _$TourviewImpl value, $Res Function(_$TourviewImpl) then) =
      __$$TourviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String propertyId,
      String imageId,
      String name,
      Image? image,
      Property? property,
      DateTime createdAt,
      DateTime? updatedAt});

  @override
  $ImageCopyWith<$Res>? get image;
  @override
  $PropertyCopyWith<$Res>? get property;
}

/// @nodoc
class __$$TourviewImplCopyWithImpl<$Res>
    extends _$TourviewCopyWithImpl<$Res, _$TourviewImpl>
    implements _$$TourviewImplCopyWith<$Res> {
  __$$TourviewImplCopyWithImpl(
      _$TourviewImpl _value, $Res Function(_$TourviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of Tourview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? propertyId = null,
    Object? imageId = null,
    Object? name = null,
    Object? image = freezed,
    Object? property = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$TourviewImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      propertyId: null == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String,
      imageId: null == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image?,
      property: freezed == property
          ? _value.property
          : property // ignore: cast_nullable_to_non_nullable
              as Property?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TourviewImpl implements _Tourview {
  const _$TourviewImpl(
      {required this.id,
      required this.propertyId,
      required this.imageId,
      required this.name,
      this.image = null,
      this.property = null,
      required this.createdAt,
      this.updatedAt});

  factory _$TourviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$TourviewImplFromJson(json);

  @override
  final String id;
  @override
  final String propertyId;
  @override
  final String imageId;
  @override
  final String name;
  @override
  @JsonKey()
  final Image? image;
  @override
  @JsonKey()
  final Property? property;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Tourview(id: $id, propertyId: $propertyId, imageId: $imageId, name: $name, image: $image, property: $property, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TourviewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId) &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.property, property) ||
                other.property == property) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, propertyId, imageId, name,
      image, property, createdAt, updatedAt);

  /// Create a copy of Tourview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TourviewImplCopyWith<_$TourviewImpl> get copyWith =>
      __$$TourviewImplCopyWithImpl<_$TourviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TourviewImplToJson(
      this,
    );
  }
}

abstract class _Tourview implements Tourview {
  const factory _Tourview(
      {required final String id,
      required final String propertyId,
      required final String imageId,
      required final String name,
      final Image? image,
      final Property? property,
      required final DateTime createdAt,
      final DateTime? updatedAt}) = _$TourviewImpl;

  factory _Tourview.fromJson(Map<String, dynamic> json) =
      _$TourviewImpl.fromJson;

  @override
  String get id;
  @override
  String get propertyId;
  @override
  String get imageId;
  @override
  String get name;
  @override
  Image? get image;
  @override
  Property? get property;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Tourview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TourviewImplCopyWith<_$TourviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
