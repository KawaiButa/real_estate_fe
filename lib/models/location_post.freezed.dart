// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocationPost _$LocationPostFromJson(Map<String, dynamic> json) {
  return _LocationPost.fromJson(json);
}

/// @nodoc
mixin _$LocationPost {
  String get city => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  /// Serializes this LocationPost to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationPostCopyWith<LocationPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationPostCopyWith<$Res> {
  factory $LocationPostCopyWith(
          LocationPost value, $Res Function(LocationPost) then) =
      _$LocationPostCopyWithImpl<$Res, LocationPost>;
  @useResult
  $Res call({String city, int count, String? url});
}

/// @nodoc
class _$LocationPostCopyWithImpl<$Res, $Val extends LocationPost>
    implements $LocationPostCopyWith<$Res> {
  _$LocationPostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? count = null,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationPostImplCopyWith<$Res>
    implements $LocationPostCopyWith<$Res> {
  factory _$$LocationPostImplCopyWith(
          _$LocationPostImpl value, $Res Function(_$LocationPostImpl) then) =
      __$$LocationPostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String city, int count, String? url});
}

/// @nodoc
class __$$LocationPostImplCopyWithImpl<$Res>
    extends _$LocationPostCopyWithImpl<$Res, _$LocationPostImpl>
    implements _$$LocationPostImplCopyWith<$Res> {
  __$$LocationPostImplCopyWithImpl(
      _$LocationPostImpl _value, $Res Function(_$LocationPostImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? count = null,
    Object? url = freezed,
  }) {
    return _then(_$LocationPostImpl(
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationPostImpl implements _LocationPost {
  const _$LocationPostImpl({required this.city, required this.count, this.url});

  factory _$LocationPostImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationPostImplFromJson(json);

  @override
  final String city;
  @override
  final int count;
  @override
  final String? url;

  @override
  String toString() {
    return 'LocationPost(city: $city, count: $count, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationPostImpl &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, city, count, url);

  /// Create a copy of LocationPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationPostImplCopyWith<_$LocationPostImpl> get copyWith =>
      __$$LocationPostImplCopyWithImpl<_$LocationPostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationPostImplToJson(
      this,
    );
  }
}

abstract class _LocationPost implements LocationPost {
  const factory _LocationPost(
      {required final String city,
      required final int count,
      final String? url}) = _$LocationPostImpl;

  factory _LocationPost.fromJson(Map<String, dynamic> json) =
      _$LocationPostImpl.fromJson;

  @override
  String get city;
  @override
  int get count;
  @override
  String? get url;

  /// Create a copy of LocationPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationPostImplCopyWith<_$LocationPostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
