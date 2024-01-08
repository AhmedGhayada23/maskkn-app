import 'dart:async';

import 'package:flutter/material.dart';
import 'package:maskkn/appConfig.dart';
import 'package:maskkn/models/agent_model.dart';
import 'package:maskkn/models/chant_message_model.dart';
import 'package:maskkn/models/chat-message.dart';
import 'package:maskkn/models/chat.dart';
import 'package:maskkn/models/user.dart';
import 'package:maskkn/network-services/authentication.dart';
import 'package:maskkn/network-services/chatting.dart';
import 'package:maskkn/providers/chat_messages_Provider.dart';
import 'package:maskkn/screens/chat-screen/components/attachment-options.dart';
import 'package:maskkn/screens/chat-screen/components/message-bubble.dart';
import 'package:maskkn/screens/chat-screen/components/message.dart';
import 'package:maskkn/screens/chat-screen/components/new-message.dart';
import 'package:provider/provider.dart';

class ConversationScreen extends StatefulWidget {
  ConversationScreen(
      {Key? key,
      required this.userId,
      required this.userName,
      required this.userImage})
      : super(key: key);
  int userId;
  String userName;
  String userImage;
  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  late StreamSubscription<List<ChantMessageModel>> _subscription;
  final _controller = TextEditingController();
  ValueNotifier<bool> showAttachmentMenu = ValueNotifier<bool>(false);

  // @override
  // void initState() {
  //   super.initState();
  //   final chatProvider =
  //       Provider.of<ChatMessagesProvider>(context, listen: false);

  //   // Listen to the stream
  //   _subscription = chatProvider.chatMessagesStream.listen((chatMessages) {
  //     // Handle incoming chat messages
  //   });

  //   // Fetch chat messages when the widget initializes
  //   chatProvider.getChatForUser(widget.chattingUser!.id!);
  // }

  // @override
  // void dispose() {
  //   // Cancel the stream subscription when the widget is disposed
  //   _subscription.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final chatProvider =
        Provider.of<ChatMessagesProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Res.kPrimaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.phone),
          // ),
        ],
        title: Text(
          widget.userName,
          style: TextStyle(color: Res.whiteColor, fontFamily: "Sf Pro"),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                StreamBuilder<List<ChantMessageModel>>(
                  stream: Stream.periodic(const Duration(seconds: 3)).asyncMap(
                      (_) => chatProvider.fetchChatForUser(widget.userId)),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Handle loading state
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      // Handle error state
                      return Center(
                        child: Text('Error: ${snapshot.error.toString()}'),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      // Handle empty data state
                      return Center(
                        child: Text('No available chats'),
                      );
                    } else {
                      final chatMessages = snapshot.data;
                      return ListView.builder(
                        itemCount: chatMessages?.length,
                        itemBuilder: (context, index) {
                          final message = chatMessages?[index];
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: MessageBubble(
                              msgSender: "s",
                              msgText: message?.message ?? '',
                              sending_time:
                                  DateTime.parse(message?.createdAt ?? ''),
                              user: true,
                              isLast: true,
                              messageType: "txt",
                              mediaUrl: "",
                              avatar: widget.userImage,
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
                ValueListenableBuilder(
                  valueListenable: showAttachmentMenu,
                  builder: (context, value, child) => value as bool
                      ? AttachmentOptions(
                          clickListener: (image, type) {
                            showAttachmentMenu.value = false;
                            if (type == "document") {
                              // DataService.SendDocMessage(
                              //     type,
                              //     image,
                              //     widget.chattingUser,
                              //     widget.chat,
                              //     image.path.split("/").last);
                            } else {
                              if (image != null) {
                                // DataService.SendMessage(
                                //     type,
                                //     image,
                                //     widget.chattingUser,
                                //     widget.chat,
                                //     _controller);
                              }
                            }
                          },
                        )
                      : Container(
                          width: 0,
                          height: 0,
                        ),
                ),
              ],
            ),
          ),
          NewMessage(
            controller: _controller,
            sendListener: (type, mediapath) {
              ChatsApi().sendMessage(widget.userId, _controller.text);
              _controller.clear();
              // DataService.SendMessage(type,
              //   mediapath, widget.chattingUser, widget.chat, _controller)
            },
            attachmentClickListener: () {
              showAttachmentMenu.value = !showAttachmentMenu.value;
            },
          ),
        ],
      ),
    );
  }
}
