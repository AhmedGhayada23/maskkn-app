// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:maskkn/models/agent_model.dart';
import 'package:maskkn/models/user.dart';
part 'chat-message.g.dart';

@JsonSerializable()
class ChatMessage {
  int? id;
  String? receiver_id;
  String? message;
  String? seen;
  String? user_id;
  String? property_id;
  String? created_at;
  String? updated_at;
  String? SentMessageOnHumanReadable;
  User? user;
  ChatMessage({
    this.id,
    this.receiver_id,
    this.message,
    this.seen,
    this.user_id,
    this.property_id,
    this.created_at,
    this.updated_at,
    this.SentMessageOnHumanReadable,
    this.user,
  });
  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);
}
