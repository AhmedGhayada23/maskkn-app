import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../appConfig.dart';
class PlanWidget extends StatefulWidget {
  String title;
  PlanWidget({required this.title, super.key});

  @override
  State<PlanWidget> createState() => _PlanWidgetState();
}

class _PlanWidgetState extends State<PlanWidget> {
  String filePath = "";
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.title,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Res.SubTitleFontSize),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Res.grey200!),
          ),
          height: 60,
          child: filePath.isEmpty
              ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: GestureDetector(
              onTap: () async {
                var r = await FilePicker.platform.pickFiles(
                    allowedExtensions: ["jpg", "png", "pdf"],
                    type: FileType.custom,
                    allowMultiple: false);
                if (r != null) {
                  setState(() {
                    filePath = r.files.first.name.split("/").last;
                  });
                }
              },
              child: Row(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        backgroundColor:
                        Res.kPrimaryColor.withOpacity(0.2),
                        child: Icon(
                          Icons.cloud_download_rounded,
                          size: 18,
                          color:  Res.kPrimaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        localizations.uploadFile ,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: Res.TextFontSize),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Text(
                    "PNG, JPG, PDF",
                    style: TextStyle(
                        color: Colors.grey, fontSize: Res.TextFontSize),
                  )
                ],
              ),
            ),
          )
              : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: Res.grey200!),
                    ),
                    height: 45,
                    width: double.infinity,
                    child: Text(filePath),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 5,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        filePath = '';
                      });
                    },
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red[200],
                      child: const Center(
                          child: Icon(
                            Icons.clear,
                            size: 15,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}