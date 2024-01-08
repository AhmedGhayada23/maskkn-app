
import 'package:flutter/material.dart';
import '../../../appConfig.dart';


class  MainIcons extends StatelessWidget {
  MainIcons(this.img_path, this.title, this.toPage);
  final String img_path;
  final String title;
  final Widget toPage;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        foregroundColor: Res.lGrayColor, backgroundColor: Res.lGrayColor,
        elevation:0,
      ),
      onPressed: (){
        Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => toPage,
            ));
      },
      icon: Image.asset(
        img_path,
        height: 50,
      ),
      label: Text(title,
        style: TextStyle(
          fontSize: Res.TextFontSize,
          fontWeight: FontWeight.bold,
          color: Res.blackColor,
        ),),
    );
  }
}