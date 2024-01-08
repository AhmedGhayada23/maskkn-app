/*
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maskkn/AppIcons/icons2_icons.dart';
import 'package:maskkn/screens/real_estate_detials/screen_1.dart';
import '../../AppIcons/icons.dart';
import '../../AppIcons/icons2_icons.dart';
import '../../appConfig.dart';
import 'components/feature_section.dart';
import 'components/interior_carousel.dart';
import 'components/realestate_location.dart';


class ScreenTwo extends StatelessWidget {
  String heroTag;
  ScreenTwo({this.heroTag = 'image', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Res.sPrimaryColor,)),
          const SizedBox(
            width: 10,
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.share,color: Res.blackColor,)),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //InteriorCarousel(heroTag: heroTag,),
              const SizedBox(
                height: 10,
              ),
              const PropertyInfo2(),
              const SizedBox(
                height: 20,
              ),
              const Description(),
              const SizedBox(
                height: 20,
              ),
              const PropertyDetails(),
              const SizedBox(
                height: 20,
              ),
              const FeatureSection(),
              const SizedBox(
                height: 20,
              ),
              const LocationOfRealEstate(),
              const SizedBox(
                height: 10,
              ),
              const VirtualTour(),
              const SizedBox(
                height: 10,
              ),
              const ButtonArea()
            ],
          )),
    );
  }
}

class PropertyDetails extends StatelessWidget {
  const PropertyDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Property Details',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[200]!),
              borderRadius: BorderRadius.circular(1),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Column(
              children: [
                Row(
                  children: [const Text('Type'), const Spacer(), const Text("Furnished")],
                ),
                const Divider(),
                Row(
                  children: [const Text('Built Year'), const Spacer(), const Text("2007")],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PropertyInfo2 extends StatelessWidget {
  const PropertyInfo2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            FadeInLeft(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Eva Hostel',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.location_on_outlined,color: Res.dGrayColor,),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Muscat, Seeb',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    )
                  ]),
            ),
            const Spacer(),
            FadeInRight(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '40-120 OMR',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'John Doe',
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const CircleAvatar(
                          radius: 14,
                          backgroundImage: AssetImage(Res.man),
                        )
                      ],
                    )
                  ]),
            ),
          ]),
          const SizedBox(height: 10),
          const Divider(
            height: 2,
          ),
          const SizedBox(height: 20),
          const Divider(
            height: 1,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Column(
                children: [
                  Icon(CustomizedIcons.mskn_app_icon_bed,size: 20,),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    '2 Bedrooms',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
              const SizedBox(
                width: 7,
              ),
              Container(
                width: 0.8,
                height: 40,
                color: Colors.grey[200],
              ),
              const SizedBox(
                width: 7,
              ),
              Column(
                children: [
                  Icon(CustomizedIcons.mskn_app_icon_bathroom,size: 25,),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    '1 Bathrooms',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
              const SizedBox(
                width: 7,
              ),
              Container(
                width: 0.8,
                height: 40,
                color: Colors.grey[200],
              ),
              const SizedBox(
                width: 7,
              ),
              Column(
                children: [

                  Icon(CustomizedIcons.mskn_app_icon_building_size,size: 25,),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    '1,021 sqm',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
              const SizedBox(
                width: 7,
              ),
              Container(
                width: 0.8,
                height: 40,
                color: Colors.grey[200],
              ),
              const SizedBox(
                width: 7,
              ),
              Column(
                children: const [
                  Icon(CustomizedIcons.mskn_app_icon_land_size,size: 25,),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '600 sqm',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            height: 1,
          ),
        ],
      ),
    );
  }
}
*/
