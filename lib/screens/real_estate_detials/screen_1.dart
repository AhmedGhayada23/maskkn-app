/*
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../AppIcons/icons2_icons.dart';
import '../../appConfig.dart';
import 'components/feature_section.dart';
import 'components/interior_carousel.dart';
import 'components/property_info.dart';
import 'components/realestate_location.dart';
import 'components/room_details.dart';
import 'components/schedual_tour.dart';


class ScreenOne extends StatelessWidget {
  String heroTag;
  ScreenOne({this.heroTag = 'image', Key? key}) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back,),color: Res.blackColor, onPressed: () {
          Navigator.pop(context);

        }, ),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
              //InteriorCarousel(heroTag: heroTag),
              const SizedBox(
                height: 10,
              ),
              const PropertyInfo(),
              const SizedBox(
                height: 20,
              ),
              const FeatureSection(),
             const SizedBox(
                height: 20,
              ),
              const RoomDetails(),
                 const SizedBox(
                height: 20,
              ),
              LocationOfRealEstate(),
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




class VirtualTour extends StatelessWidget {
  const VirtualTour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Virtual Tour',
                style: TextStyle(
                    fontSize: 17, color: Res.kPrimaryColor),
              ),
              const Spacer(),
              Image.asset(
                Res.threeDimIcPng,
                height: 30,
                width: 30,
                color: Res.kPrimaryColor,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                Res.interior_1,
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            onTap: (){},
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class ButtonArea extends StatelessWidget {
  const ButtonArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(Res.man),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Text(
                    'seller anme',
                    style: TextStyle(fontSize: Res.TextFontSize),
                  ),
                  Text(
                    'Agent from MSKN',
                    style: TextStyle(fontSize: Res.SubTextFontSize,
                        color: Res.dGrayColor.withOpacity(0.6)),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            child: FadeInUp(
              child: ElevatedButton(

                  onPressed: () {
                    showBottomSheet(
                      backgroundColor: Res.kPrimaryColor,
                      context: context,
                      builder: (context) => const ScheduleTourView(),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:MaterialStateProperty.all<Color>(Res.kPrimaryColor) ,
                      shape: MaterialStateProperty.resolveWith((states) =>
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Schedule Tour',
                          style: TextStyle(fontSize: Res.TextFontSize),
                        )
                      ],
                    ),
                  )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: FadeInLeft(
                  child: Container(
                    height: 40,
                    child: OutlinedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            shape: MaterialStateProperty.resolveWith((states) =>
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                        color: Res.kPrimaryColor)))),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children:[
                              Icon( Icons2.communication_chat_outlined,size: 40,
                                  color: Res.kPrimaryColor
                             ),
                              SizedBox(
                                width: 3,
                              ),
                              Text('Chat', style: TextStyle(color: Res.kPrimaryColor),),
                            ],
                          ),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: FadeInRight(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Res.kPrimaryColor.withOpacity(0.2),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.phone,
                            color: Res.kPrimaryColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Call',
                            style: TextStyle(
                                fontSize: 17,
                                color:  Res.kPrimaryColor,),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: TextStyle(
              color:  Res.kPrimaryColor,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
              'For Sale: _Beautifully separated villas and calm colors Site:_Al-Amerat second stage Specifications:_Building area for each villa: 351m _Land Area for each villa: 300m _Each villa consists of two floors.Price:'),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}


*/
