import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maskkn/models/city.dart';
import 'package:maskkn/models/governorate.dart';
import 'package:maskkn/models/property_management.dart';
import 'package:maskkn/models/property_request_type.dart';
import 'package:maskkn/models/sector.dart';
import 'package:maskkn/models/sector_details.dart';
import 'package:maskkn/network-services/property_request.dart';
import 'package:maskkn/network-services/sector_req.dart';
import 'package:maskkn/screens/chat-screen/conversation-screen.dart';
import 'package:maskkn/screens/main-page/filter_page.dart';
import 'package:maskkn/screens/service-screens/components/customizedDropdounButton.dart';
import 'package:maskkn/screens/service-screens/property_managment/details_agent.dart';
import 'package:maskkn/screens/service-screens/property_managment/filter_agent.dart';
import '../../../appConfig.dart';
import '../../chat-screen/components/search-bar.dart';

class PropertyManagement extends StatefulWidget {
  String? cityId, stateId;
  PropertyManagement({
    this.cityId,
    this.stateId,
    super.key,
  });

  @override
  State<PropertyManagement> createState() => _PropertyManagementState();
}

class _PropertyManagementState extends State<PropertyManagement> {
  bool lodding = true;
  TextEditingController searchText = TextEditingController();
  PropertyRequest propertyRequest = PropertyRequest();
  SectorReqest sectorReqest = SectorReqest();
  List<Governorate> governorateData = [];
  List<City> cityData = [];
  List<PropertyManagementModel> propertyManagemenData = [];

  fetchData() async {
    var propertyManagemens = await propertyRequest.getPropertyManagement(
        widget.cityId, widget.stateId);

    setState(() {
      propertyManagemenData.addAll(propertyManagemens);
      lodding = false;
    });
  }

  @override
  void initState() {
    fetchData();
    print('start agent');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    String localeCode = Localizations.localeOf(context).languageCode;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          localizations.findAgent,
          style: TextStyle(color: Res.blackColor, fontFamily: "Sf Pro"),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          color: Res.blackColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: lodding != false
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Res.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: searchText,
                        style: TextStyle(fontSize: 15, fontFamily: "Sf Pro"),
                        cursorColor: Res.dGrayColor2,
                        onSubmitted: (value) async {
                          // var data = await propertyRequest
                          //     .getPropertyManagement('3', widget.stateId,'');
                          // setState(() {
                          //   propertyManagemenData.addAll(data);
                          // });
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => FilterAgent(),
                                ));
                              },
                              icon: Icon(
                                Icons.filter_list_sharp,
                                color: Res.blackColor,
                              )),
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Res.whiteColor, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            gapPadding: 0.0,
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Res.whiteColor, width: 2),
                          ),
                          filled: true,
                          fillColor: Res.whiteColor,
                          hintText: localizations.search,
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Res.dGrayColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                // print(
                                //     'id ::${propertyManagemenData[index].id!}');
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailsAgent(
                                      id: propertyManagemenData[index].id!),
                                ));
                              },
                              child: Container(
                                height: 150,
                                padding: EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: Res.whiteColor,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    width: 1,
                                    color: const Color(0xFFF1F1F1),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 40,
                                          backgroundImage: NetworkImage(
                                              propertyManagemenData[index]
                                                      .avatar ??
                                                  ''),
                                        ),

                                        // Container(
                                        //   width: 60,
                                        //   height: 60,
                                        //   decoration: BoxDecoration(
                                        //     color: Res.grey200,
                                        //     image: DecorationImage(
                                        //       image: NetworkImage(
                                        //           propertyManagemenData[index]
                                        //                   .avatar ??
                                        //               ''),
                                        //       fit: BoxFit.cover,
                                        //     ),
                                        //   ),
                                        // ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              propertyManagemenData[index]
                                                      .name ??
                                                  '',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Res.blackColor,
                                                  fontSize: 16),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.8,
                                              child: Text(
                                                localeCode == 'ar'
                                                    ? 'التقييم العقاري'
                                                    : 'Real Estate Property Request',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Res.blackColor,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Text(
                                          propertyManagemenData[index]
                                              .isAdvertisement
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Res.sPrimaryColor,
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          'Active Listings',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Res.blackColor,
                                              fontSize: 14),
                                        ),
                                        Spacer(),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ConversationScreen(
                                                    userId:
                                                        propertyManagemenData[
                                                                index]
                                                            .id!,
                                                    userName:
                                                        propertyManagemenData[
                                                                index]
                                                            .name!,
                                                    userImage:
                                                        propertyManagemenData[
                                                                index]
                                                            .avatar!,
                                                    // chat: chatsMap[users[index]],
                                                  ),
                                                ));
                                          },
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icon/chat.svg'),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                localeCode == 'ar'
                                                    ? 'دردشة'
                                                    : 'Chat',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Res.kPrimaryColor,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 8,
                            ),
                        itemCount: propertyManagemenData.length),
                  )
                ],
              ),
            ),
    );
  }
}
