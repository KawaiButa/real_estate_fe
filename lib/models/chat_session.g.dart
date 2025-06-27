// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_session.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatSessionAdapter extends TypeAdapter<ChatSession> {
  @override
  final int typeId = 1;

  @override
  ChatSession read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatSession(
      id: fields[0] as String,
      user1Id: fields[1] as String?,
      user2Id: fields[2] as String,
      user1: fields[3] as User?,
      user2: fields[4] as User?,
      lastMessage: fields[5] as ChatMessage?,
      messages: (fields[6] as List).cast<ChatMessage>(),
    );
  }

  @override
  void write(BinaryWriter writer, ChatSession obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.user1Id)
      ..writeByte(2)
      ..write(obj.user2Id)
      ..writeByte(3)
      ..write(obj.user1)
      ..writeByte(4)
      ..write(obj.user2)
      ..writeByte(5)
      ..write(obj.lastMessage)
      ..writeByte(6)
      ..write(obj.messages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatSessionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatSessionImpl _$$ChatSessionImplFromJson(Map<String, dynamic> json) =>
    _$ChatSessionImpl(
      id: json['id'] as String,
      user1Id: json['user_1_id'] as String?,
      user2Id: json['user_2_id'] as String,
      user1: json['user_1'] == null
          ? null
          : User.fromJson(json['user_1'] as Map<String, dynamic>),
      user2: json['user_2'] == null
          ? null
          : User.fromJson(json['user_2'] as Map<String, dynamic>),
      lastMessage: json['last_message'] == null
          ? null
          : ChatMessage.fromJson(json['last_message'] as Map<String, dynamic>),
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ChatSessionImplToJson(_$ChatSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_1_id': instance.user1Id,
      'user_2_id': instance.user2Id,
      'user_1': instance.user1,
      'user_2': instance.user2,
      'last_message': instance.lastMessage,
      'messages': instance.messages,
    };
