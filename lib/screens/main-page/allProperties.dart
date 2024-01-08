import 'package:flutter/material.dart';
import 'package:maskkn/models/property_short_details.dart';
import 'package:maskkn/screens/main-page/property_short_detials.dart';

import '../../appConfig.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../network-services/real_estate.dart';


class AllProperties extends StatefulWidget {
  const AllProperties({Key? key}) : super(key: key);

  @override
  State<AllProperties> createState() => _AllPropertiesState();
}

class _AllPropertiesState extends State<AllProperties> {
  RealEstateApi realestates = RealEstateApi();
  List<PropertyShortDetails> allProperties = [];
  int page = 0;
  int limit = 5;
  bool isLoadMore = false;
  bool hasMoreData = true; // new variable to track if there is more data
  ScrollController scrollController = ScrollController();


  fetchData() async {
    var properties = await realestates.getProperties(limit, page);
    setState(() {
      allProperties.addAll(properties);
      print("length>> ${allProperties.length}");
      hasMoreData = properties.length == limit;
    });
  }

  @override
  void initState() {
    fetchData();
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent && hasMoreData) {
        setState(() {
          isLoadMore = true;
        });
        page ++;
        await fetchData();

        setState(() {
          isLoadMore = false;
        });
      }
    });

    super.initState();
  }


  Widget _buildLoading() {
    return hasMoreData
        ? Center(
      child: CircularProgressIndicator(
        color: Res.kPrimaryColor,
        backgroundColor: Res.grey200,
      ),
    )
        : SizedBox();
  }


  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    String localeCode = Localizations
        .localeOf(context)
        .languageCode;
    return Scaffold(
      appBar: AppBar(
        title: Text('Showing Result', style: TextStyle(
            color: Res.blackColor,
            fontSize: Res.SubTitleFontSize,
            fontWeight: FontWeight.w500
        ),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,), color: Res.blackColor, onPressed: () {
          Navigator.pop(context);
        },),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),

      body: ListView.builder(
          controller: scrollController,
          itemCount: isLoadMore? allProperties.length + 1: allProperties.length,
          itemBuilder: (BuildContext context, int index) {
            if(allProperties.length == 0) {
              return Center(
                child: CircularProgressIndicator(
                  color: Res.kPrimaryColor,
                  backgroundColor: Res.grey200,
                ),
              );
            }
            else if(index == allProperties.length){
               return _buildLoading();
             }else{
               return PropertyShortDetailsCard(
                 userName:  allProperties[index].user!.name,
                 avatar:allProperties[index].user!.avatar ,
                 isFavorite: false,
                 id: allProperties[index].id,
                 buildingSize: allProperties[index].buildingSize,
                 area: allProperties[index].area,
                 title: localeCode == 'ar'
                     ? allProperties[index].titleAr
                     : allProperties[index].titleEn,
                 bathrooms: allProperties[index].numberBathrooms,
                 img: allProperties[index].small,
                 price: allProperties[index].salePrice,
                 virtualTour: false,
                 location: " ",
                 type: allProperties[index].isRent == 1
                     ? localizations.rent
                     : localizations.sell,
                 rooms: allProperties[index].numberRooms,
                 viwes: allProperties[index].views,
                 url_3d: allProperties[index].url3d,

               );
             }

          }
      ),

    );
  }
}

















