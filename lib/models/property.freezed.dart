// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Property _$PropertyFromJson(Map<String, dynamic> json) {
  return _Property.fromJson(json);
}

/// @nodoc
mixin _$Property {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get propertyCategory => throw _privateConstructorUsedError;
  String get transactionType => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get bedrooms => throw _privateConstructorUsedError;
  int get bathrooms => throw _privateConstructorUsedError;
  String get propertyTypeId => throw _privateConstructorUsedError;
  PropertyType get propertyType => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  Address get address => throw _privateConstructorUsedError;
  User? get owner => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  double? get averageRating => throw _privateConstructorUsedError;
  double? get sqm => throw _privateConstructorUsedError;
  List<Review> get reviews => throw _privateConstructorUsedError;
  List<Image> get images => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false)
  int? get totalReviewCount => throw _privateConstructorUsedError;

  /// Serializes this Property to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PropertyCopyWith<Property> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertyCopyWith<$Res> {
  factory $PropertyCopyWith(Property value, $Res Function(Property) then) =
      _$PropertyCopyWithImpl<$Res, Property>;
  @useResult
  $Res call(
      {String id,
      String title,
      String propertyCategory,
      String transactionType,
      double price,
      int bedrooms,
      int bathrooms,
      String propertyTypeId,
      PropertyType propertyType,
      String description,
      bool status,
      Address address,
      User? owner,
      DateTime createdAt,
      String ownerId,
      double? averageRating,
      double? sqm,
      List<Review> reviews,
      List<Image> images,
      DateTime? updatedAt,
      @JsonKey(includeFromJson: false) int? totalReviewCount});

  $PropertyTypeCopyWith<$Res> get propertyType;
  $AddressCopyWith<$Res> get address;
  $UserCopyWith<$Res>? get owner;
}

/// @nodoc
class _$PropertyCopyWithImpl<$Res, $Val extends Property>
    implements $PropertyCopyWith<$Res> {
  _$PropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? propertyCategory = null,
    Object? transactionType = null,
    Object? price = null,
    Object? bedrooms = null,
    Object? bathrooms = null,
    Object? propertyTypeId = null,
    Object? propertyType = null,
    Object? description = null,
    Object? status = null,
    Object? address = null,
    Object? owner = freezed,
    Object? createdAt = null,
    Object? ownerId = null,
    Object? averageRating = freezed,
    Object? sqm = freezed,
    Object? reviews = null,
    Object? images = null,
    Object? updatedAt = freezed,
    Object? totalReviewCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      propertyCategory: null == propertyCategory
          ? _value.propertyCategory
          : propertyCategory // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      bedrooms: null == bedrooms
          ? _value.bedrooms
          : bedrooms // ignore: cast_nullable_to_non_nullable
              as int,
      bathrooms: null == bathrooms
          ? _value.bathrooms
          : bathrooms // ignore: cast_nullable_to_non_nullable
              as int,
      propertyTypeId: null == propertyTypeId
          ? _value.propertyTypeId
          : propertyTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      propertyType: null == propertyType
          ? _value.propertyType
          : propertyType // ignore: cast_nullable_to_non_nullable
              as PropertyType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      averageRating: freezed == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
      sqm: freezed == sqm
          ? _value.sqm
          : sqm // ignore: cast_nullable_to_non_nullable
              as double?,
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalReviewCount: freezed == totalReviewCount
          ? _value.totalReviewCount
          : totalReviewCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PropertyTypeCopyWith<$Res> get propertyType {
    return $PropertyTypeCopyWith<$Res>(_value.propertyType, (value) {
      return _then(_value.copyWith(propertyType: value) as $Val);
    });
  }

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get owner {
    if (_value.owner == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.owner!, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PropertyImplCopyWith<$Res>
    implements $PropertyCopyWith<$Res> {
  factory _$$PropertyImplCopyWith(
          _$PropertyImpl value, $Res Function(_$PropertyImpl) then) =
      __$$PropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String propertyCategory,
      String transactionType,
      double price,
      int bedrooms,
      int bathrooms,
      String propertyTypeId,
      PropertyType propertyType,
      String description,
      bool status,
      Address address,
      User? owner,
      DateTime createdAt,
      String ownerId,
      double? averageRating,
      double? sqm,
      List<Review> reviews,
      List<Image> images,
      DateTime? updatedAt,
      @JsonKey(includeFromJson: false) int? totalReviewCount});

  @override
  $PropertyTypeCopyWith<$Res> get propertyType;
  @override
  $AddressCopyWith<$Res> get address;
  @override
  $UserCopyWith<$Res>? get owner;
}

/// @nodoc
class __$$PropertyImplCopyWithImpl<$Res>
    extends _$PropertyCopyWithImpl<$Res, _$PropertyImpl>
    implements _$$PropertyImplCopyWith<$Res> {
  __$$PropertyImplCopyWithImpl(
      _$PropertyImpl _value, $Res Function(_$PropertyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? propertyCategory = null,
    Object? transactionType = null,
    Object? price = null,
    Object? bedrooms = null,
    Object? bathrooms = null,
    Object? propertyTypeId = null,
    Object? propertyType = null,
    Object? description = null,
    Object? status = null,
    Object? address = null,
    Object? owner = freezed,
    Object? createdAt = null,
    Object? ownerId = null,
    Object? averageRating = freezed,
    Object? sqm = freezed,
    Object? reviews = null,
    Object? images = null,
    Object? updatedAt = freezed,
    Object? totalReviewCount = freezed,
  }) {
    return _then(_$PropertyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      propertyCategory: null == propertyCategory
          ? _value.propertyCategory
          : propertyCategory // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      bedrooms: null == bedrooms
          ? _value.bedrooms
          : bedrooms // ignore: cast_nullable_to_non_nullable
              as int,
      bathrooms: null == bathrooms
          ? _value.bathrooms
          : bathrooms // ignore: cast_nullable_to_non_nullable
              as int,
      propertyTypeId: null == propertyTypeId
          ? _value.propertyTypeId
          : propertyTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      propertyType: null == propertyType
          ? _value.propertyType
          : propertyType // ignore: cast_nullable_to_non_nullable
              as PropertyType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      averageRating: freezed == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
      sqm: freezed == sqm
          ? _value.sqm
          : sqm // ignore: cast_nullable_to_non_nullable
              as double?,
      reviews: null == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalReviewCount: freezed == totalReviewCount
          ? _value.totalReviewCount
          : totalReviewCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PropertyImpl implements _Property {
  const _$PropertyImpl(
      {required this.id,
      required this.title,
      required this.propertyCategory,
      required this.transactionType,
      required this.price,
      required this.bedrooms,
      required this.bathrooms,
      required this.propertyTypeId,
      required this.propertyType,
      required this.description,
      required this.status,
      required this.address,
      required this.owner,
      required this.createdAt,
      required this.ownerId,
      this.averageRating,
      this.sqm,
      final List<Review> reviews = const [],
      final List<Image> images = const [],
      this.updatedAt,
      @JsonKey(includeFromJson: false) this.totalReviewCount})
      : _reviews = reviews,
        _images = images;

  factory _$PropertyImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertyImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String propertyCategory;
  @override
  final String transactionType;
  @override
  final double price;
  @override
  final int bedrooms;
  @override
  final int bathrooms;
  @override
  final String propertyTypeId;
  @override
  final PropertyType propertyType;
  @override
  final String description;
  @override
  final bool status;
  @override
  final Address address;
  @override
  final User? owner;
  @override
  final DateTime createdAt;
  @override
  final String ownerId;
  @override
  final double? averageRating;
  @override
  final double? sqm;
  final List<Review> _reviews;
  @override
  @JsonKey()
  List<Review> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  final List<Image> _images;
  @override
  @JsonKey()
  List<Image> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final DateTime? updatedAt;
  @override
  @JsonKey(includeFromJson: false)
  final int? totalReviewCount;

  @override
  String toString() {
    return 'Property(id: $id, title: $title, propertyCategory: $propertyCategory, transactionType: $transactionType, price: $price, bedrooms: $bedrooms, bathrooms: $bathrooms, propertyTypeId: $propertyTypeId, propertyType: $propertyType, description: $description, status: $status, address: $address, owner: $owner, createdAt: $createdAt, ownerId: $ownerId, averageRating: $averageRating, sqm: $sqm, reviews: $reviews, images: $images, updatedAt: $updatedAt, totalReviewCount: $totalReviewCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.propertyCategory, propertyCategory) ||
                other.propertyCategory == propertyCategory) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.bedrooms, bedrooms) ||
                other.bedrooms == bedrooms) &&
            (identical(other.bathrooms, bathrooms) ||
                other.bathrooms == bathrooms) &&
            (identical(other.propertyTypeId, propertyTypeId) ||
                other.propertyTypeId == propertyTypeId) &&
            (identical(other.propertyType, propertyType) ||
                other.propertyType == propertyType) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.sqm, sqm) || other.sqm == sqm) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.totalReviewCount, totalReviewCount) ||
                other.totalReviewCount == totalReviewCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        propertyCategory,
        transactionType,
        price,
        bedrooms,
        bathrooms,
        propertyTypeId,
        propertyType,
        description,
        status,
        address,
        owner,
        createdAt,
        ownerId,
        averageRating,
        sqm,
        const DeepCollectionEquality().hash(_reviews),
        const DeepCollectionEquality().hash(_images),
        updatedAt,
        totalReviewCount
      ]);

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertyImplCopyWith<_$PropertyImpl> get copyWith =>
      __$$PropertyImplCopyWithImpl<_$PropertyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PropertyImplToJson(
      this,
    );
  }
}

abstract class _Property implements Property {
  const factory _Property(
          {required final String id,
          required final String title,
          required final String propertyCategory,
          required final String transactionType,
          required final double price,
          required final int bedrooms,
          required final int bathrooms,
          required final String propertyTypeId,
          required final PropertyType propertyType,
          required final String description,
          required final bool status,
          required final Address address,
          required final User? owner,
          required final DateTime createdAt,
          required final String ownerId,
          final double? averageRating,
          final double? sqm,
          final List<Review> reviews,
          final List<Image> images,
          final DateTime? updatedAt,
          @JsonKey(includeFromJson: false) final int? totalReviewCount}) =
      _$PropertyImpl;

  factory _Property.fromJson(Map<String, dynamic> json) =
      _$PropertyImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get propertyCategory;
  @override
  String get transactionType;
  @override
  double get price;
  @override
  int get bedrooms;
  @override
  int get bathrooms;
  @override
  String get propertyTypeId;
  @override
  PropertyType get propertyType;
  @override
  String get description;
  @override
  bool get status;
  @override
  Address get address;
  @override
  User? get owner;
  @override
  DateTime get createdAt;
  @override
  String get ownerId;
  @override
  double? get averageRating;
  @override
  double? get sqm;
  @override
  List<Review> get reviews;
  @override
  List<Image> get images;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(includeFromJson: false)
  int? get totalReviewCount;

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PropertyImplCopyWith<_$PropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
