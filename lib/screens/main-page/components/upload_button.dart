import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../appConfig.dart';

class UploadButton extends StatefulWidget {
  const UploadButton({Key? key}) : super(key: key);

  @override
  State<UploadButton> createState() => _UploadButtonState();
}

class _UploadButtonState extends State<UploadButton> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return  ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        foregroundColor: Res.lGrayColor,
        backgroundColor: Res.lGrayColor.withOpacity(0.8),
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: Res.dGrayColor.withOpacity(0.2))
        ),
      ),
      onPressed: (){
      },
      icon: CircleAvatar(
        backgroundColor:
        Res.kPrimaryColor.withOpacity(0.2),
        child: Icon(
          Icons.cloud_download_rounded,
          size: 18,
          color:  Res.kPrimaryColor,
        ),
      ),
      label: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(localizations.uploadFile,
            style: TextStyle(
              fontSize: Res.SubTextFontSize,
              color: Res.dGrayColor,
            ),),
          Text(localizations.fileType,
            style: TextStyle(
              fontSize: Res.SubTextFontSize,
              color: Res.dGrayColor,
            ),),
        ],
      ),
    );
  }
}
