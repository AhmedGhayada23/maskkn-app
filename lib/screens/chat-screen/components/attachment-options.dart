import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:maskkn/appConfig.dart';
import 'package:maskkn/screens/chat-screen/components/chat-icons.dart';
import 'package:maskkn/screens/chat-screen/components/icon-button.dart';
import 'package:maskkn/services/dataUtils/fileUtils.dart';
import 'package:maskkn/services/dataUtils/mediaUtils.dart';

class AttachmentOptions extends StatefulWidget {
  const AttachmentOptions(
      {super.key,
      this.clickListener,
      });
  final clickListener;
  

  @override
  State<AttachmentOptions> createState() => _AttachmentOptionsState();
}

class _AttachmentOptionsState extends State<AttachmentOptions> {
  bool IsGalleryClicked = false;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Res.whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 1,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: IsGalleryClicked
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomIconButton(
                      clickListener: () async{
                        var image = await MediaProvider.getImageFromGallery();
                        widget.clickListener(image,"image");
                      },
                      icon: ChatIcons.insert_photo,
                      text: "Photo",
                    ),
                    CustomIconButton(
                      clickListener: () async{
                        var image = await MediaProvider.getVideoFromGallery();
                        widget.clickListener(image,"video");
                      },
                      icon: ChatIcons.video_library,
                      text: "Video",
                      
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomIconButton(
                      clickListener: () async{
                        File file = await FileProvider.pickFile();
                        if(file.path.isNotEmpty)
                          {
                            debugPrint(file.path.split("/").last);
                            widget.clickListener(file,"document");
                          }
                      },
                      icon: ChatIcons.ic_files_document_outlined,
                      text: "Document",
                      isCustomIcon: true,
                    ),
                    CustomIconButton(
                      clickListener: () async{
                        var image = await MediaProvider.getImageFromCamera();
                        widget.clickListener(image,"image");
                      },
                      icon: ChatIcons.ic_camera,
                      text: "Camera",
                      isCustomIcon: true,
                    ),
                    CustomIconButton(
                      clickListener: () async{
                        var image = await MediaProvider.getVideoFromCamera();
                        widget.clickListener(image,"video");
                      },
                      icon: ChatIcons.ic_video_camera_outlined,
                      text: "Video",
                      isCustomIcon: true,
                    ),
                    CustomIconButton(
                      clickListener: () {
                        setState(() {
                          IsGalleryClicked = true;
                        });
                      },
                      icon: ChatIcons.ic_gallery,
                      text: "Gallery",
                      isCustomIcon: true,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
