import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maskkn/screens/chat-screen/components/chat-icons.dart';

import '../../../appConfig.dart';

class NewMessage extends StatefulWidget {
  const NewMessage(
      {Key? key,
      this.controller,
      this.sendListener,
      this.attachmentClickListener})
      : super(key: key);
  final controller;
  final sendListener;
  final attachmentClickListener;
  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  String _enteredMessage = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Res.whiteColor,
      padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
      child: Row(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Res.chatGray2),
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        controller: widget.controller,
                        cursorColor: Res.kPrimaryColor,
                        style: TextStyle(fontFamily: "Sf pro"),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Res.chatGray2,
                          hintText: "Write here.....",
                          hintStyle: TextStyle(
                              fontFamily: "Sf pro", color: Res.dGrayColor),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Res.chatGray2, width: 0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Res.chatGray2, width: 0),
                          ),
                        ),
                      ),
                    ),
                    // IconButton(
                    //     onPressed: widget.attachmentClickListener /* () async {
                    //       debugPrint("clicked");
                    //         var image = await MediaProvider.getVideoFromCamera();
                    //         if(image!=null)
                    //         widget.sendListener("video",image);
                    //     } */,
                    //     icon: Icon(ChatIcons.ic_attach))
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Res.kPrimaryColor),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => widget.sendListener("txt", null),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    ChatIcons.ic_send,
                    size: 30,
                    color: Res.whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
