import 'package:flutter/material.dart';
import 'package:maskkn/appConfig.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, this.clickListener, this.icon, this.text,this.isCustomIcon=false});
  final clickListener;
  final icon;
  final text;
  final isCustomIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: clickListener,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(CircleBorder()),
                      padding: MaterialStateProperty.all(isCustomIcon?EdgeInsets.all(5):EdgeInsets.all(10)),
                      backgroundColor: MaterialStateProperty.all(
                          Res.kPrimaryColor.withOpacity(0.3)), // <-- Button color
                      overlayColor:
                          MaterialStateProperty.resolveWith<Color?>((states) {
                  
                          return Res.lGrayColor; // <-- Splash color
                      }),
                    ),
                    child: Icon(icon, color: Res.kPrimaryColor,size: isCustomIcon? 40:20),
                  ),
                  SizedBox(height: 7,),
                  Text(text,style: TextStyle(color: Res.dGrayColor,fontFamily: "Sf Pro"),),
                ],
              );
  }
}