import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:maskkn/models/chant_message_model.dart';
import 'package:maskkn/models/chat-message.dart';
import 'package:maskkn/network-services/authentication.dart';
import 'package:maskkn/screens/chat-screen/components/message-bubble.dart';

// ignore: must_be_immutable
class Messages extends StatelessWidget {
  Messages({Key? key, required this.messages}) : super(key: key) {
    var messagesByMe =
        messages.where((element) => AuthAPI.currentUser!.id == element.userId);
    var messagesByHim =
        messages.where((element) => AuthAPI.currentUser!.id != element.userId);
    if (messagesByMe.isNotEmpty) {
      // lastByMe = messagesByMe.first;
    }
    if (messagesByHim.isNotEmpty) {
      // lastByHim = messagesByHim.first;
    }
  }
  List<ChantMessageModel> messages;
  ChatMessage? lastByMe = ChatMessage();
  ChatMessage? lastByHim = ChatMessage();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: HexColor("#FBFCFE"),
      margin: const EdgeInsets.only(top: 20),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: messages.length,
          reverse: true,
          itemBuilder: (ctx, index) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: MessageBubble(
                msgSender: "s",
                msgText: messages[index].message!,
                sending_time: DateTime.parse(messages[index].createdAt!),
                user: true,
                isLast: true,
                messageType: "txt",
                mediaUrl: "",
                avatar: '',
              ),
            );
          }),
    );
  }
}
