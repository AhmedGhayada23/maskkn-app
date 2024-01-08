// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat-message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => ChatMessage(
      id: json['id'] as int?,
      receiver_id: json['receiver_id'] as String?,
      message: json['message'] as String?,
      seen: json['seen'] as String?,
      user_id: json['user_id'] as String?,
      property_id: json['property_id'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      SentMessageOnHumanReadable: json['SentMessageOnHumanReadable'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'receiver_id': instance.receiver_id,
      'message': instance.message,
      'seen': instance.seen,
      'user_id': instance.user_id,
      'property_id': instance.property_id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'SentMessageOnHumanReadable': instance.SentMessageOnHumanReadable,
      'user': instance.user,
    };
