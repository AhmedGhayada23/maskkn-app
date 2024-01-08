import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:maskkn/appConfig.dart';
import 'package:maskkn/models/agent_model.dart';
import 'package:maskkn/network-services/property_request.dart';
import 'package:maskkn/screens/realEstate_all_details.dart';
import 'package:maskkn/screens/main-page/components/details_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsAgent extends StatefulWidget {
  final int id;
  const DetailsAgent({required this.id, super.key});

  @override
  State<DetailsAgent> createState() => _DetailsAgentState();
}

class _DetailsAgentState extends State<DetailsAgent>
    with SingleTickerProviderStateMixin {
  bool lodding = true;
  PropertyRequest propertyRequest = PropertyRequest();
  AgentModel? agentModel;

  fetchData() async {
    AgentModel agentModelData =
        await propertyRequest.getPropertyManagementDetails(widget.id);

    setState(() {
      agentModel = agentModelData;
      lodding = false;
    });
  }

  // final List<Tab> myTabs = <Tab>[
  //    Tab(text: 'Sale(${agentModel!.propertiesForSale!.length})'),
  //   new Tab(text: 'Rent'),
  // ];
  late TabController _tabController;

  @override
  void initState() {
    fetchData();
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Res.blackColor,
            )),
        actions: [],
      ),
      body: lodding != false
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Column(
                children: [
                  // بيانات الشركاء
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage(agentModel?.avatar ?? ''),
                      ),
                      SizedBox(width: 8),
                      Text(
                        agentModel?.name ?? '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Res.blackColor,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        agentModel?.email ?? '',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Res.blackColor,
                            fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '${agentModel?.phone ?? ''}',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Res.blackColor,
                            fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  // Row(
                  //   children: [
                  //     Icon(
                  //       Icons.account_box_sharp,
                  //       color: Colors.grey,
                  //     ),
                  //     SizedBox(
                  //       width: 8,
                  //     ),
                  //     Text(
                  //       '',
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.w500,
                  //           color: Res.blackColor,
                  //           fontSize: 14),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: () async {
                      Uri uri = Uri(
                          scheme: 'tel', path: agentModel?.phone.toString());
                      if (!await launchUrl(uri)) {
                        throw Exception('Could not launch $uri');
                      }
                    },
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
                                color: Res.kPrimaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TabBar(
                      labelColor: Res.blackColor,
                      indicatorColor: Res.kPrimaryColor,
                      labelStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Res.blackColor,
                      ),
                      controller: _tabController,
                      tabs: [
                        Tab(
                          text:
                              'Sale (${agentModel?.propertiesForSale?.length})',
                        ),
                        Tab(
                            text:
                                'Rent (${agentModel?.propertiesForRent?.length})'),
                      ]),
                  Expanded(
                    child: TabBarView(controller: _tabController, children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int index = 0;
                                index < agentModel!.propertiesForSale!.length;
                                index++)
                              SaleWidget(
                                area:
                                    '${agentModel?.propertiesForSale?[index].area ?? ''}',
                                bathrooms: agentModel!
                                    .propertiesForSale![index].numberBathrooms
                                    .toString(),
                                buildingSize:
                                    '${agentModel?.propertiesForSale?[index].buildingSize ?? ''}',
                                id: agentModel!.propertiesForSale![index].id!,
                                img: agentModel
                                        ?.propertiesForSale?[index].medium ??
                                    '',
                                imgUser: agentModel?.propertiesForSale?[index]
                                        .user?.avatar ??
                                    '',
                                location: '',
                                name: agentModel
                                        ?.propertiesForSale?[index].titleAr ??
                                    '',
                                price:
                                    "${agentModel?.propertiesForSale?[index].salePrice ?? ''}",
                                type: agentModel?.propertiesForSale?[index]
                                            .isRent ==
                                        1
                                    ? 'rent'
                                    : 'sell',
                                url_3d: agentModel
                                        ?.propertiesForSale?[index].url3D ??
                                    '',
                                view: agentModel
                                        ?.propertiesForSale?[index].views ??
                                    '',
                              ),
                          ],
                        ),
                      ),
                      // Rent
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            for (int index = 0;
                                index < agentModel!.propertiesForRent!.length;
                                index++)
                              RentWidget(
                                id: agentModel!.propertiesForRent![index].id!,
                                img: agentModel
                                        ?.propertiesForRent?[index].small ??
                                    '',
                                location: '',
                                area:
                                    '${agentModel?.propertiesForRent?[index].area ?? ''}',
                                type: agentModel?.propertiesForRent?[index]
                                            .isRent ==
                                        1
                                    ? 'rent'
                                    : 'sell',
                                price: agentModel!
                                    .propertiesForRent![index].salePrice
                                    .toString(),
                                url_3d: agentModel
                                        ?.propertiesForRent?[index].url3D ??
                                    '',
                                view: agentModel
                                        ?.propertiesForRent?[index].views ??
                                    '',
                                name: agentModel
                                        ?.propertiesForRent?[index].titleAr ??
                                    '',
                                imgUser: agentModel?.propertiesForRent?[index]
                                        .user?.avatar ??
                                    '',
                                bathrooms: agentModel!
                                    .propertiesForRent![index].numberBathrooms
                                    .toString(),
                                buildingSize: agentModel
                                        ?.propertiesForRent?[index]
                                        .buildingSize ??
                                    '',
                              ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
    );
  }
}

class RentWidget extends StatelessWidget {
  final String img;
  final String name;
  final String imgUser;
  final int id;

  final String price;
  final String view;
  final String location;
  final String url_3d;
  final String type;
  final String bathrooms;
  final String buildingSize;
  final String area;

  const RentWidget({
    required this.id,
    required this.img,
    required this.imgUser,
    required this.name,
    required this.price,
    required this.view,
    required this.location,
    required this.url_3d,
    required this.type,
    required this.bathrooms,
    required this.buildingSize,
    required this.area,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => RealEstateAllDetails(id: id)));
      },
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Res.whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 1,
                spreadRadius: 2,
              ),
            ]),
        child: Row(
          children: [
            Expanded(
              child: Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade200,
                    image: DecorationImage(
                      image: NetworkImage(img),
                      fit: BoxFit.cover,
                    ),
                  ),
                  //https://mskkn.com/public/website-assets/images/logo.png
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 0),
                            decoration: const BoxDecoration(color: Colors.red),
                            child: Text(
                              type,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: IconButton(
                            icon: Icon(
                              true ? Icons.favorite : Icons.favorite_border,
                              shadows: <Shadow>[
                                Shadow(
                                  color: Res.kPrimaryColor,
                                  blurRadius: 50.0,
                                ),
                              ],
                              color: Colors.white,
                              size: 25,
                            ),
                            onPressed: () async {
                              // setState(() {
                              //   widget.isFavorite = !widget.isFavorite;
                              // });
                              // if(widget.isFavorite){
                              //  await favoriteFunctions.addFavorite(widget.id);
                              // }else{
                              //   await favoriteFunctions.removeFavorite(widget.id);
                              // }
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Res.kPrimaryColor,
                            ),
                            child: Text.rich(TextSpan(
                                text: price,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                                children: [
                                  TextSpan(
                                      text: ' OMR',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: Res.SubTextFontSize,
                                          color: Colors.white),
                                      children: [])
                                ])),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (view != "nothing")
                                Image.asset(
                                  "assets/icon/3d-model.png",
                                  color: Res.whiteColor,
                                  width: 25,
                                ),
                              const SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.remove_red_eye_outlined,
                                color: Res.whiteColor,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                view,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Expanded(
              child: Container(
                  color: Res.whiteColor,
                  margin: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundImage: NetworkImage(imgUser),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        name,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: Res.dGrayColor,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            location,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Icon(Icons.bed),
                          Text(
                            bathrooms,
                            style: TextStyle(
                                fontSize: Res.SubTextFontSize,
                                color: Res.dGrayColor),
                          ),
                          Spacer(),
                          Icon(Icons.bathtub_outlined),
                          Text(
                            bathrooms,
                            style: TextStyle(
                                fontSize: Res.SubTextFontSize,
                                color: Res.dGrayColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Image.asset('assets/icon/building_size.png',
                              width: 25,
                              color: Res.dGrayColor.withOpacity(0.8)),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "$buildingSize Sqm",
                            style: TextStyle(
                                fontSize: Res.SubTextFontSize,
                                color: Res.dGrayColor),
                          ),
                          Spacer(),
                          Image.asset(
                            'assets/icon/area.png',
                            width: 25,
                            color: Res.dGrayColor.withOpacity(0.8),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            area + " " + "Sqm",
                            style: TextStyle(
                                fontSize: Res.SubTextFontSize,
                                color: Res.dGrayColor),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class SaleWidget extends StatelessWidget {
  final String img;
  final String name;
  final String imgUser;
  final int id;

  final String price;
  final String view;
  final String location;
  final String url_3d;
  final String type;
  final String bathrooms;
  final String buildingSize;
  final String area;

  const SaleWidget({
    required this.id,
    required this.img,
    required this.imgUser,
    required this.name,
    required this.price,
    required this.view,
    required this.location,
    required this.url_3d,
    required this.type,
    required this.bathrooms,
    required this.buildingSize,
    required this.area,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => RealEstateAllDetails(id: id)));
      },
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Res.whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 1,
                spreadRadius: 2,
              ),
            ]),
        child: Row(
          children: [
            Expanded(
              child: Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade200,
                    image: DecorationImage(
                      image: NetworkImage(img),
                      fit: BoxFit.cover,
                    ),
                  ),
                  //https://mskkn.com/public/website-assets/images/logo.png
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 0),
                            decoration: const BoxDecoration(color: Colors.red),
                            child: Text(
                              type,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: IconButton(
                            icon: Icon(
                              true ? Icons.favorite : Icons.favorite_border,
                              shadows: <Shadow>[
                                Shadow(
                                  color: Res.kPrimaryColor,
                                  blurRadius: 50.0,
                                ),
                              ],
                              color: Colors.white,
                              size: 25,
                            ),
                            onPressed: () async {
                              // setState(() {
                              //   widget.isFavorite = !widget.isFavorite;
                              // });
                              // if(widget.isFavorite){
                              //  await favoriteFunctions.addFavorite(widget.id);
                              // }else{
                              //   await favoriteFunctions.removeFavorite(widget.id);
                              // }
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Res.kPrimaryColor,
                            ),
                            child: Text.rich(TextSpan(
                                text: price,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                                children: [
                                  TextSpan(
                                      text: ' OMR',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: Res.SubTextFontSize,
                                          color: Colors.white),
                                      children: [])
                                ])),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (view != "nothing")
                                Image.asset(
                                  "assets/icon/3d-model.png",
                                  color: Res.whiteColor,
                                  width: 25,
                                ),
                              const SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.remove_red_eye_outlined,
                                color: Res.whiteColor,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                view,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Expanded(
              child: Container(
                  color: Res.whiteColor,
                  margin: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundImage: NetworkImage(imgUser),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        name,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: Res.dGrayColor,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            location,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Icon(Icons.bed),
                          Text(
                            bathrooms,
                            style: TextStyle(
                                fontSize: Res.SubTextFontSize,
                                color: Res.dGrayColor),
                          ),
                          Spacer(),
                          Icon(Icons.bathtub_outlined),
                          Text(
                            bathrooms,
                            style: TextStyle(
                                fontSize: Res.SubTextFontSize,
                                color: Res.dGrayColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Image.asset('assets/icon/building_size.png',
                              width: 25,
                              color: Res.dGrayColor.withOpacity(0.8)),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "$buildingSize Sqm",
                            style: TextStyle(
                                fontSize: Res.SubTextFontSize,
                                color: Res.dGrayColor),
                          ),
                          Spacer(),
                          Image.asset(
                            'assets/icon/area.png',
                            width: 25,
                            color: Res.dGrayColor.withOpacity(0.8),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            area + " " + "Sqm",
                            style: TextStyle(
                                fontSize: Res.SubTextFontSize,
                                color: Res.dGrayColor),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
