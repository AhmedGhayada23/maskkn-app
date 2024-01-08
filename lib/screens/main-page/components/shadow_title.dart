
import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class ShadowText extends StatelessWidget {
  ShadowText(this.data, { required this.style }) : assert(data != null);

  final String data;
  final TextStyle style;

  Widget build(BuildContext context) {
    return  ClipRect(
      child:  Stack(
        children: [
          Positioned(
            top: 2.0,
            left: 2.0,
            child:  Text(
              data,
              style: style.copyWith(color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.bold),

            ),
          ),
          BackdropFilter(
            filter: new ui.ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: new Text(data, style: style),
          ),
        ],
      ),
    );
  }
}
