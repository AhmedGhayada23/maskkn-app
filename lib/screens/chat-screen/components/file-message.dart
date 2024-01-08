import 'package:flutter/material.dart';
import 'package:maskkn/appConfig.dart';
import 'package:maskkn/screens/chat-screen/components/chat-icons.dart';

class DocumentMessage extends StatelessWidget {
  const DocumentMessage({super.key, this.fileName, this.clickListener,this.isUser});
  final fileName;
  final clickListener;
  final isUser;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clickListener,
      child: Row(mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: isUser?MainAxisAlignment.end:MainAxisAlignment.start,
       children: [
        Icon(ChatIcons.ic_files_document_outlined, size: 70,color: isUser? Res.whiteColor:Res.kPrimaryColor),
        Flexible(
          child: Text(
            fileName,
            style: TextStyle(
                color: isUser? Res.whiteColor:Res.kPrimaryColor,
                fontSize: 15,
                fontFamily: "Sf Pro",
                height: 1.5),
                overflow: TextOverflow.clip,
          ),
        )
      ]),
    );
  }
}
