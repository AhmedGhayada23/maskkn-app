import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import '../../../AppIcons/icons2_icons.dart';
import '../../../appConfig.dart';

class RoomDetails extends StatelessWidget {
  const RoomDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rooms Details',
              style: TextStyle(
                  fontSize: Res.SubTitleFontSize,
                  color: Res.kPrimaryColor),
            ),
            SizedBox(
              height: 20,
            ),
            RoomWidget(
                title: 'Private Room',
                discountPrice: '110 OMR',
                actualPrice: '120 OMR',
                asset: Res.interior_1,
                totalPeople: 1),
            SizedBox(
              height: 35,
            ),
            RoomWidget(
                title: 'Sharing Room',
                discountPrice: '110 OMR',
                actualPrice: '120 OMR',
                asset:  Res.interior_1,
                totalPeople: 2),
            SizedBox(
              height: 35,
            ),
            RoomWidget(
                title: 'Sharing Room',
                discountPrice: '110 OMR',
                actualPrice: '120 OMR',
                asset:  Res.interior_1,
                totalPeople: 4),
          ],
        ),
      ),
    );
  }
}

class RoomWidget extends StatelessWidget {
  String title;
  String discountPrice;
  String actualPrice;
  String asset;
  int totalPeople;
  RoomWidget(
      {required this.title,
        required this.discountPrice,
        required this.actualPrice,
        required this.asset,
        required this.totalPeople,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurRadius: 10, spreadRadius: 0.8, color: Res.grey200!)
          ],
          color: Res.kPrimaryColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '$title ${totalPeople}',
                      style: TextStyle(fontSize: 16),
                    ),
                    if (totalPeople == 1) ...[
                      Icon(Icons2.user_user),
                    ] else if (totalPeople == 2) ...[
                      Icon(Icons2.user_group_equal),
                    ] else ...[
                      Container(),
                    ]
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      actualPrice,
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Res.dGrayColor),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      discountPrice,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color:Res.kPrimaryColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons2.AC),
                          Text(
                            'TV',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons2.wifi),
                          Text(
                            'Wifi',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons2.Wardrobe),
                          Text(
                            'Wardrobe',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons2.balcony),
                          Text(
                            'Kitchen',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons2.office_table),
                          Text(
                            'Office',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  asset,
                  height: 170,
                  fit: BoxFit.cover,
                )),
          )
        ],
      ),
    );
  }
}