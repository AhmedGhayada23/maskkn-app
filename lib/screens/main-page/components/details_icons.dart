

import 'package:flutter/cupertino.dart';

import '../../../appConfig.dart';

class DetialedIcon extends StatelessWidget {
  DetialedIcon({ required this.icon, required this.number,required this.unit, required this.size});
  IconData icon;
  String number;
  String unit;
  double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(icon, color: Res.dGrayColor.withOpacity(0.8),size: size,),
          SizedBox(width: 5,),
          Expanded(
            flex: 1,
            child: Text(number + " "+ unit, style: TextStyle(
              fontSize: Res.SubTextFontSize,
              color: Res.dGrayColor
            ),),
          ),
        ],
      ),
    );
  }
}
