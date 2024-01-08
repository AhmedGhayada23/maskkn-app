import 'package:flutter/material.dart';

import '../../appConfig.dart';



Widget doneWidget(title, IconData) {
  return Scaffold(
    backgroundColor: Colors.transparent.withOpacity(0.5),
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            IconData,
            //Icons.thumb_up_outlined,
            color: Colors.white,
            size: 45,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: Res.SubTitleFontSize),
          )
        ],
      ),
    ),
  );
}

/*
*   onPressed: () {
                      OverlayEntry overlayEntry;
                      overlayEntry =
                          OverlayEntry(builder: (context) => doneWidget());
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        Overlay.of(context)!.insert(overlayEntry);
                        Timer(Duration(milliseconds: 1500),
                            () => overlayEntry.remove());
                      });
                    }*/