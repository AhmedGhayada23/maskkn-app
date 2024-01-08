import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import 'package:intl/intl.dart';

import 'package:transparent_image/transparent_image.dart';

import '../../../appConfig.dart';

// ignore: must_be_immutable
class ConversationItem extends StatelessWidget {
  ConversationItem(
      {super.key,
      @required this.photo,
      @required this.username,
      @required this.lastMessage,
      @required this.lastTime,
      this.onDeleted});
  final photo;
  final username;
  final lastMessage;
  final lastTime;
  final onDeleted;
  DateFormat dateFormatter = DateFormat('h:mm a');
  @override
  Widget build(BuildContext context) {
//  return Slidable(
//       endActionPane: ActionPane(
//         extentRatio: 0.20,
//         motion: BehindMotion(),
//         children: [
//           SlidableAction(
//             // An action can be bigger than the others.
//             borderRadius: BorderRadius.only(
//               topRight: Radius.circular(7),
//               bottomRight: Radius.circular(7),
//             ),
//             onPressed: onDeleted,
//             backgroundColor: Color(0xFFFECCCB),
//             foregroundColor: Color(0xFFC80000),
//             icon: ChatIcons.trash_solid,
//           ),
//         ],
//       ),
//       child:
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0), color: Res.whiteColor),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(photo),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: TextStyle(
                          fontSize: 16,
                          color: Res.kPrimaryColor,
                          fontFamily: "Sf Pro",
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      lastMessage,
                      style: TextStyle(
                          fontSize: 14,
                          color: Res.dGrayColor,
                          fontFamily: "Sf Pro",
                          fontWeight: FontWeight.normal),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Text(
                dateFormatter.format(DateTime.parse(lastTime)),
                style: TextStyle(
                    fontSize: 13,
                    color: Res.dGrayColor,
                    fontFamily: "Sf Pro",
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 1,
            color: Res.lGrayColor,
          ),
        ],
      ),
    );
  }
}
