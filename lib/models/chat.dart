// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

import 'chat-message.dart';
part 'chat.g.dart';

@JsonSerializable()
class Chat {
  List<ChatMessage>? data;
  Chat({
    this.data,
  });
  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  Map<String, dynamic> toJson() => _$ChatToJson(this);
}
