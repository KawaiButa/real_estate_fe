// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedMetadata _$PaginatedMetadataFromJson(Map<String, dynamic> json) {
  return _PaginatedMetadata.fromJson(json);
}

/// @nodoc
mixin _$PaginatedMetadata {
  int get limit => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this PaginatedMetadata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedMetadataCopyWith<PaginatedMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedMetadataCopyWith<$Res> {
  factory $PaginatedMetadataCopyWith(
          PaginatedMetadata value, $Res Function(PaginatedMetadata) then) =
      _$PaginatedMetadataCopyWithImpl<$Res, PaginatedMetadata>;
  @useResult
  $Res call({int limit, int offset, int total});
}

/// @nodoc
class _$PaginatedMetadataCopyWithImpl<$Res, $Val extends PaginatedMetadata>
    implements $PaginatedMetadataCopyWith<$Res> {
  _$PaginatedMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? offset = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedMetadataImplCopyWith<$Res>
    implements $PaginatedMetadataCopyWith<$Res> {
  factory _$$PaginatedMetadataImplCopyWith(_$PaginatedMetadataImpl value,
          $Res Function(_$PaginatedMetadataImpl) then) =
      __$$PaginatedMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int limit, int offset, int total});
}

/// @nodoc
class __$$PaginatedMetadataImplCopyWithImpl<$Res>
    extends _$PaginatedMetadataCopyWithImpl<$Res, _$PaginatedMetadataImpl>
    implements _$$PaginatedMetadataImplCopyWith<$Res> {
  __$$PaginatedMetadataImplCopyWithImpl(_$PaginatedMetadataImpl _value,
      $Res Function(_$PaginatedMetadataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? offset = null,
    Object? total = null,
  }) {
    return _then(_$PaginatedMetadataImpl(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedMetadataImpl implements _PaginatedMetadata {
  const _$PaginatedMetadataImpl(
      {required this.limit, required this.offset, required this.total});

  factory _$PaginatedMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedMetadataImplFromJson(json);

  @override
  final int limit;
  @override
  final int offset;
  @override
  final int total;

  @override
  String toString() {
    return 'PaginatedMetadata(limit: $limit, offset: $offset, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedMetadataImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, limit, offset, total);

  /// Create a copy of PaginatedMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedMetadataImplCopyWith<_$PaginatedMetadataImpl> get copyWith =>
      __$$PaginatedMetadataImplCopyWithImpl<_$PaginatedMetadataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedMetadataImplToJson(
      this,
    );
  }
}

abstract class _PaginatedMetadata implements PaginatedMetadata {
  const factory _PaginatedMetadata(
      {required final int limit,
      required final int offset,
      required final int total}) = _$PaginatedMetadataImpl;

  factory _PaginatedMetadata.fromJson(Map<String, dynamic> json) =
      _$PaginatedMetadataImpl.fromJson;

  @override
  int get limit;
  @override
  int get offset;
  @override
  int get total;

  /// Create a copy of PaginatedMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedMetadataImplCopyWith<_$PaginatedMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
