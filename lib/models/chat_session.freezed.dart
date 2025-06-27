// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatSession _$ChatSessionFromJson(Map<String, dynamic> json) {
  return _ChatSession.fromJson(json);
}

/// @nodoc
mixin _$ChatSession {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: "user_1_id")
  String? get user1Id => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: "user_2_id")
  String get user2Id => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: "user_1")
  User? get user1 => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: "user_2")
  User? get user2 => throw _privateConstructorUsedError;
  @HiveField(5)
  ChatMessage? get lastMessage => throw _privateConstructorUsedError;
  @HiveField(6)
  List<ChatMessage> get messages => throw _privateConstructorUsedError;

  /// Serializes this ChatSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatSessionCopyWith<ChatSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatSessionCopyWith<$Res> {
  factory $ChatSessionCopyWith(
          ChatSession value, $Res Function(ChatSession) then) =
      _$ChatSessionCopyWithImpl<$Res, ChatSession>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(name: "user_1_id") String? user1Id,
      @HiveField(2) @JsonKey(name: "user_2_id") String user2Id,
      @HiveField(3) @JsonKey(name: "user_1") User? user1,
      @HiveField(4) @JsonKey(name: "user_2") User? user2,
      @HiveField(5) ChatMessage? lastMessage,
      @HiveField(6) List<ChatMessage> messages});

  $UserCopyWith<$Res>? get user1;
  $UserCopyWith<$Res>? get user2;
  $ChatMessageCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class _$ChatSessionCopyWithImpl<$Res, $Val extends ChatSession>
    implements $ChatSessionCopyWith<$Res> {
  _$ChatSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user1Id = freezed,
    Object? user2Id = null,
    Object? user1 = freezed,
    Object? user2 = freezed,
    Object? lastMessage = freezed,
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user1Id: freezed == user1Id
          ? _value.user1Id
          : user1Id // ignore: cast_nullable_to_non_nullable
              as String?,
      user2Id: null == user2Id
          ? _value.user2Id
          : user2Id // ignore: cast_nullable_to_non_nullable
              as String,
      user1: freezed == user1
          ? _value.user1
          : user1 // ignore: cast_nullable_to_non_nullable
              as User?,
      user2: freezed == user2
          ? _value.user2
          : user2 // ignore: cast_nullable_to_non_nullable
              as User?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as ChatMessage?,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
    ) as $Val);
  }

  /// Create a copy of ChatSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user1 {
    if (_value.user1 == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user1!, (value) {
      return _then(_value.copyWith(user1: value) as $Val);
    });
  }

  /// Create a copy of ChatSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user2 {
    if (_value.user2 == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user2!, (value) {
      return _then(_value.copyWith(user2: value) as $Val);
    });
  }

  /// Create a copy of ChatSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatMessageCopyWith<$Res>? get lastMessage {
    if (_value.lastMessage == null) {
      return null;
    }

    return $ChatMessageCopyWith<$Res>(_value.lastMessage!, (value) {
      return _then(_value.copyWith(lastMessage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatSessionImplCopyWith<$Res>
    implements $ChatSessionCopyWith<$Res> {
  factory _$$ChatSessionImplCopyWith(
          _$ChatSessionImpl value, $Res Function(_$ChatSessionImpl) then) =
      __$$ChatSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(name: "user_1_id") String? user1Id,
      @HiveField(2) @JsonKey(name: "user_2_id") String user2Id,
      @HiveField(3) @JsonKey(name: "user_1") User? user1,
      @HiveField(4) @JsonKey(name: "user_2") User? user2,
      @HiveField(5) ChatMessage? lastMessage,
      @HiveField(6) List<ChatMessage> messages});

  @override
  $UserCopyWith<$Res>? get user1;
  @override
  $UserCopyWith<$Res>? get user2;
  @override
  $ChatMessageCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class __$$ChatSessionImplCopyWithImpl<$Res>
    extends _$ChatSessionCopyWithImpl<$Res, _$ChatSessionImpl>
    implements _$$ChatSessionImplCopyWith<$Res> {
  __$$ChatSessionImplCopyWithImpl(
      _$ChatSessionImpl _value, $Res Function(_$ChatSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user1Id = freezed,
    Object? user2Id = null,
    Object? user1 = freezed,
    Object? user2 = freezed,
    Object? lastMessage = freezed,
    Object? messages = null,
  }) {
    return _then(_$ChatSessionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user1Id: freezed == user1Id
          ? _value.user1Id
          : user1Id // ignore: cast_nullable_to_non_nullable
              as String?,
      user2Id: null == user2Id
          ? _value.user2Id
          : user2Id // ignore: cast_nullable_to_non_nullable
              as String,
      user1: freezed == user1
          ? _value.user1
          : user1 // ignore: cast_nullable_to_non_nullable
              as User?,
      user2: freezed == user2
          ? _value.user2
          : user2 // ignore: cast_nullable_to_non_nullable
              as User?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as ChatMessage?,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatSessionImpl implements _ChatSession {
  const _$ChatSessionImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) @JsonKey(name: "user_1_id") this.user1Id,
      @HiveField(2) @JsonKey(name: "user_2_id") required this.user2Id,
      @HiveField(3) @JsonKey(name: "user_1") this.user1,
      @HiveField(4) @JsonKey(name: "user_2") this.user2,
      @HiveField(5) this.lastMessage,
      @HiveField(6) final List<ChatMessage> messages = const []})
      : _messages = messages;

  factory _$ChatSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatSessionImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  @JsonKey(name: "user_1_id")
  final String? user1Id;
  @override
  @HiveField(2)
  @JsonKey(name: "user_2_id")
  final String user2Id;
  @override
  @HiveField(3)
  @JsonKey(name: "user_1")
  final User? user1;
  @override
  @HiveField(4)
  @JsonKey(name: "user_2")
  final User? user2;
  @override
  @HiveField(5)
  final ChatMessage? lastMessage;
  final List<ChatMessage> _messages;
  @override
  @JsonKey()
  @HiveField(6)
  List<ChatMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'ChatSession(id: $id, user1Id: $user1Id, user2Id: $user2Id, user1: $user1, user2: $user2, lastMessage: $lastMessage, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user1Id, user1Id) || other.user1Id == user1Id) &&
            (identical(other.user2Id, user2Id) || other.user2Id == user2Id) &&
            (identical(other.user1, user1) || other.user1 == user1) &&
            (identical(other.user2, user2) || other.user2 == user2) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, user1Id, user2Id, user1,
      user2, lastMessage, const DeepCollectionEquality().hash(_messages));

  /// Create a copy of ChatSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatSessionImplCopyWith<_$ChatSessionImpl> get copyWith =>
      __$$ChatSessionImplCopyWithImpl<_$ChatSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatSessionImplToJson(
      this,
    );
  }
}

abstract class _ChatSession implements ChatSession {
  const factory _ChatSession(
      {@HiveField(0) required final String id,
      @HiveField(1) @JsonKey(name: "user_1_id") final String? user1Id,
      @HiveField(2) @JsonKey(name: "user_2_id") required final String user2Id,
      @HiveField(3) @JsonKey(name: "user_1") final User? user1,
      @HiveField(4) @JsonKey(name: "user_2") final User? user2,
      @HiveField(5) final ChatMessage? lastMessage,
      @HiveField(6) final List<ChatMessage> messages}) = _$ChatSessionImpl;

  factory _ChatSession.fromJson(Map<String, dynamic> json) =
      _$ChatSessionImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  @JsonKey(name: "user_1_id")
  String? get user1Id;
  @override
  @HiveField(2)
  @JsonKey(name: "user_2_id")
  String get user2Id;
  @override
  @HiveField(3)
  @JsonKey(name: "user_1")
  User? get user1;
  @override
  @HiveField(4)
  @JsonKey(name: "user_2")
  User? get user2;
  @override
  @HiveField(5)
  ChatMessage? get lastMessage;
  @override
  @HiveField(6)
  List<ChatMessage> get messages;

  /// Create a copy of ChatSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatSessionImplCopyWith<_$ChatSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
