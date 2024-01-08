import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maskkn/screens/chat-screen/components/ad-message.dart';
import 'package:maskkn/screens/chat-screen/components/file-message.dart';
import 'package:maskkn/screens/chat-screen/components/video-message.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../appConfig.dart';

class MessageBubble extends StatelessWidget {
  final String msgText;
  final String msgSender;
  final bool user;
  final DateTime sending_time;
  final bool isLast;
  final String? messageType;
  final String? mediaUrl;
  final String? avatar;
  MessageBubble(
      {required this.msgText,
      required this.msgSender,
      required this.user,
      required this.sending_time,
      this.isLast = false,
      this.messageType,
      this.mediaUrl,
      this.avatar});
  final DateFormat dateFormatter = DateFormat('h:mm a');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: user ? EdgeInsets.only(left: 50) : EdgeInsets.only(right: 50),
      child: Column(
        crossAxisAlignment:
            user ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment:
                user ? MainAxisAlignment.end : MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              user
                  ? Container()
                  : Container(
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          avatar ?? '',
                          width: 25,
                          height: 25,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              Flexible(
                child: messageType!.contains("ad")
                    ? AdMessage()
                    : Material(
                        borderRadius: BorderRadius.only(
                          bottomLeft:
                              user ? Radius.circular(10) : Radius.circular(5),
                          topLeft:
                              user ? Radius.circular(10) : Radius.circular(5),
                          bottomRight:
                              user ? Radius.circular(0) : Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        color: user ? Res.kPrimaryColor : Res.chatColor,
                        elevation: 0,
                        child: messageType!.contains("document")
                            ? Padding(
                                padding: EdgeInsets.only(
                                    right: 20, top: 10, bottom: 10),
                                child: DocumentMessage(
                                  fileName: msgText,
                                  clickListener: () async {
                                    // await DataService.downloadFile(mediaUrl, msgText);
                                  },
                                  isUser: user,
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    messageType!.contains("image")
                                        ? CachedNetworkImage(
                                            imageUrl: mediaUrl!,
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                CircularProgressIndicator(
                                                    color: user
                                                        ? Res.whiteColor
                                                        : Res.kPrimaryColor,
                                                    value: downloadProgress
                                                        .progress),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          )
                                        : messageType!.contains("video")
                                            ? VideoMessage(
                                                link: mediaUrl,
                                              )
                                            : Container(
                                                width: 0,
                                              ),
                                    msgText.isEmpty
                                        ? Container(
                                            width: 0,
                                          )
                                        : Text(
                                            msgText,
                                            style: TextStyle(
                                                color: user
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: 15,
                                                fontFamily: "Sf Pro",
                                                height: 1.5),
                                          ),
                                  ],
                                ),
                              ),
                      ),
              ),
            ],
          ),
          isLast
              ? Row(
                  mainAxisAlignment:
                      user ? MainAxisAlignment.end : MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: user ? 0 : 33,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        dateFormatter.format(sending_time),
                        style: TextStyle(
                          color: Res.chatGray,
                          fontSize: 13,
                          fontFamily: "Sf Pro",
                        ),
                      ),
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
