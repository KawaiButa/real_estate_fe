// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partner_registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PartnerRegistration _$PartnerRegistrationFromJson(Map<String, dynamic> json) {
  return _PartnerRegistration.fromJson(json);
}

/// @nodoc
mixin _$PartnerRegistration {
  String? get userId => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  DateTime get dateOfBirth => throw _privateConstructorUsedError;
  Image? get profileImage => throw _privateConstructorUsedError;
  PartnerType get type => throw _privateConstructorUsedError;
  List<Image> get businessRegistrationCertificateImages =>
      throw _privateConstructorUsedError;
  String? get taxId => throw _privateConstructorUsedError;
  String? get authorizedRepresentativeName =>
      throw _privateConstructorUsedError;
  bool get approved => throw _privateConstructorUsedError;
  String? get rejectReason => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PartnerRegistration to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PartnerRegistration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PartnerRegistrationCopyWith<PartnerRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartnerRegistrationCopyWith<$Res> {
  factory $PartnerRegistrationCopyWith(
          PartnerRegistration value, $Res Function(PartnerRegistration) then) =
      _$PartnerRegistrationCopyWithImpl<$Res, PartnerRegistration>;
  @useResult
  $Res call(
      {String? userId,
      User? user,
      DateTime dateOfBirth,
      Image? profileImage,
      PartnerType type,
      List<Image> businessRegistrationCertificateImages,
      String? taxId,
      String? authorizedRepresentativeName,
      bool approved,
      String? rejectReason,
      DateTime createdAt,
      DateTime? updatedAt});

  $UserCopyWith<$Res>? get user;
  $ImageCopyWith<$Res>? get profileImage;
}

/// @nodoc
class _$PartnerRegistrationCopyWithImpl<$Res, $Val extends PartnerRegistration>
    implements $PartnerRegistrationCopyWith<$Res> {
  _$PartnerRegistrationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PartnerRegistration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? user = freezed,
    Object? dateOfBirth = null,
    Object? profileImage = freezed,
    Object? type = null,
    Object? businessRegistrationCertificateImages = null,
    Object? taxId = freezed,
    Object? authorizedRepresentativeName = freezed,
    Object? approved = null,
    Object? rejectReason = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as Image?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PartnerType,
      businessRegistrationCertificateImages: null ==
              businessRegistrationCertificateImages
          ? _value.businessRegistrationCertificateImages
          : businessRegistrationCertificateImages // ignore: cast_nullable_to_non_nullable
              as List<Image>,
      taxId: freezed == taxId
          ? _value.taxId
          : taxId // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizedRepresentativeName: freezed == authorizedRepresentativeName
          ? _value.authorizedRepresentativeName
          : authorizedRepresentativeName // ignore: cast_nullable_to_non_nullable
              as String?,
      approved: null == approved
          ? _value.approved
          : approved // ignore: cast_nullable_to_non_nullable
              as bool,
      rejectReason: freezed == rejectReason
          ? _value.rejectReason
          : rejectReason // ignore: cast_nullable_to_non_nullable
              as String?,
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

  /// Create a copy of PartnerRegistration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of PartnerRegistration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageCopyWith<$Res>? get profileImage {
    if (_value.profileImage == null) {
      return null;
    }

    return $ImageCopyWith<$Res>(_value.profileImage!, (value) {
      return _then(_value.copyWith(profileImage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PartnerRegistrationImplCopyWith<$Res>
    implements $PartnerRegistrationCopyWith<$Res> {
  factory _$$PartnerRegistrationImplCopyWith(_$PartnerRegistrationImpl value,
          $Res Function(_$PartnerRegistrationImpl) then) =
      __$$PartnerRegistrationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userId,
      User? user,
      DateTime dateOfBirth,
      Image? profileImage,
      PartnerType type,
      List<Image> businessRegistrationCertificateImages,
      String? taxId,
      String? authorizedRepresentativeName,
      bool approved,
      String? rejectReason,
      DateTime createdAt,
      DateTime? updatedAt});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $ImageCopyWith<$Res>? get profileImage;
}

/// @nodoc
class __$$PartnerRegistrationImplCopyWithImpl<$Res>
    extends _$PartnerRegistrationCopyWithImpl<$Res, _$PartnerRegistrationImpl>
    implements _$$PartnerRegistrationImplCopyWith<$Res> {
  __$$PartnerRegistrationImplCopyWithImpl(_$PartnerRegistrationImpl _value,
      $Res Function(_$PartnerRegistrationImpl) _then)
      : super(_value, _then);

  /// Create a copy of PartnerRegistration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? user = freezed,
    Object? dateOfBirth = null,
    Object? profileImage = freezed,
    Object? type = null,
    Object? businessRegistrationCertificateImages = null,
    Object? taxId = freezed,
    Object? authorizedRepresentativeName = freezed,
    Object? approved = null,
    Object? rejectReason = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PartnerRegistrationImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as Image?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PartnerType,
      businessRegistrationCertificateImages: null ==
              businessRegistrationCertificateImages
          ? _value._businessRegistrationCertificateImages
          : businessRegistrationCertificateImages // ignore: cast_nullable_to_non_nullable
              as List<Image>,
      taxId: freezed == taxId
          ? _value.taxId
          : taxId // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizedRepresentativeName: freezed == authorizedRepresentativeName
          ? _value.authorizedRepresentativeName
          : authorizedRepresentativeName // ignore: cast_nullable_to_non_nullable
              as String?,
      approved: null == approved
          ? _value.approved
          : approved // ignore: cast_nullable_to_non_nullable
              as bool,
      rejectReason: freezed == rejectReason
          ? _value.rejectReason
          : rejectReason // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$PartnerRegistrationImpl implements _PartnerRegistration {
  const _$PartnerRegistrationImpl(
      {this.userId,
      this.user,
      required this.dateOfBirth,
      this.profileImage,
      required this.type,
      final List<Image> businessRegistrationCertificateImages = const [],
      this.taxId,
      this.authorizedRepresentativeName,
      this.approved = false,
      this.rejectReason,
      required this.createdAt,
      this.updatedAt})
      : _businessRegistrationCertificateImages =
            businessRegistrationCertificateImages;

  factory _$PartnerRegistrationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartnerRegistrationImplFromJson(json);

  @override
  final String? userId;
  @override
  final User? user;
  @override
  final DateTime dateOfBirth;
  @override
  final Image? profileImage;
  @override
  final PartnerType type;
  final List<Image> _businessRegistrationCertificateImages;
  @override
  @JsonKey()
  List<Image> get businessRegistrationCertificateImages {
    if (_businessRegistrationCertificateImages is EqualUnmodifiableListView)
      return _businessRegistrationCertificateImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_businessRegistrationCertificateImages);
  }

  @override
  final String? taxId;
  @override
  final String? authorizedRepresentativeName;
  @override
  @JsonKey()
  final bool approved;
  @override
  final String? rejectReason;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PartnerRegistration(userId: $userId, user: $user, dateOfBirth: $dateOfBirth, profileImage: $profileImage, type: $type, businessRegistrationCertificateImages: $businessRegistrationCertificateImages, taxId: $taxId, authorizedRepresentativeName: $authorizedRepresentativeName, approved: $approved, rejectReason: $rejectReason, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartnerRegistrationImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(
                other._businessRegistrationCertificateImages,
                _businessRegistrationCertificateImages) &&
            (identical(other.taxId, taxId) || other.taxId == taxId) &&
            (identical(other.authorizedRepresentativeName,
                    authorizedRepresentativeName) ||
                other.authorizedRepresentativeName ==
                    authorizedRepresentativeName) &&
            (identical(other.approved, approved) ||
                other.approved == approved) &&
            (identical(other.rejectReason, rejectReason) ||
                other.rejectReason == rejectReason) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      user,
      dateOfBirth,
      profileImage,
      type,
      const DeepCollectionEquality()
          .hash(_businessRegistrationCertificateImages),
      taxId,
      authorizedRepresentativeName,
      approved,
      rejectReason,
      createdAt,
      updatedAt);

  /// Create a copy of PartnerRegistration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PartnerRegistrationImplCopyWith<_$PartnerRegistrationImpl> get copyWith =>
      __$$PartnerRegistrationImplCopyWithImpl<_$PartnerRegistrationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartnerRegistrationImplToJson(
      this,
    );
  }
}

abstract class _PartnerRegistration implements PartnerRegistration {
  const factory _PartnerRegistration(
      {final String? userId,
      final User? user,
      required final DateTime dateOfBirth,
      final Image? profileImage,
      required final PartnerType type,
      final List<Image> businessRegistrationCertificateImages,
      final String? taxId,
      final String? authorizedRepresentativeName,
      final bool approved,
      final String? rejectReason,
      required final DateTime createdAt,
      final DateTime? updatedAt}) = _$PartnerRegistrationImpl;

  factory _PartnerRegistration.fromJson(Map<String, dynamic> json) =
      _$PartnerRegistrationImpl.fromJson;

  @override
  String? get userId;
  @override
  User? get user;
  @override
  DateTime get dateOfBirth;
  @override
  Image? get profileImage;
  @override
  PartnerType get type;
  @override
  List<Image> get businessRegistrationCertificateImages;
  @override
  String? get taxId;
  @override
  String? get authorizedRepresentativeName;
  @override
  bool get approved;
  @override
  String? get rejectReason;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of PartnerRegistration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PartnerRegistrationImplCopyWith<_$PartnerRegistrationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
