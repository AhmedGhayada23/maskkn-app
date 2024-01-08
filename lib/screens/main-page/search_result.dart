//ResultPage
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:maskkn/screens/main-page/sell_on_chart/search_detials_model.dart';
import '../../appConfig.dart';
import '../../models/property_short_details.dart';
import '../../network-services/real_estate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResultPage extends StatefulWidget {
  final String? keyword,sectorId,sectorDetailsId,stateId,cityId,saleStatus, priceMax, priceMin, minArea, maxArea;
  const ResultPage(
      {
        this.keyword,
        this.sectorId,
        this.sectorDetailsId,
        this.stateId,
        this.cityId,
        this.saleStatus,
      this.priceMax,
      this.priceMin,
      this.minArea,
      this.maxArea,
      super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool hasMoreData = true;
  bool lodding = true;
  RealEstateApi realestates = RealEstateApi();
  List<PropertyShortDetails> allProperties = [];

  fetchData() async {
    var properties = await realestates.getSeatch(widget.keyword,widget.sectorId,widget.sectorDetailsId,widget.stateId,widget.cityId,widget.saleStatus,widget.priceMax,
        widget.priceMin, widget.maxArea, widget.minArea);
    setState(() {
      allProperties.addAll(properties);
      lodding = false;
      print("length>> ${allProperties.length}");
    });
  }

  @override
  void initState() {
    fetchData();
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

    String localeCode = Localizations.localeOf(context).languageCode;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          color: Res.blackColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'List Properties',
          style: TextStyle(
              color: Res.blackColor,
              fontSize: Res.SubTitleFontSize,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: lodding == true
            ? Center(child: CircularProgressIndicator())
            : allProperties.isNotEmpty
                ? 
                 ListView(
                  
                    children: [
                      Text(
                        'Showing Result',
                        style: TextStyle(
                            color: Res.blackColor,
                            fontSize: Res.SubTitleFontSize,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '${allProperties.length} Properties Found',
                        style: TextStyle(
                            color: Res.blackColor,
                            fontSize: Res.SubTitleFontSize,
                            fontWeight: FontWeight.w500),
                      ),
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: allProperties.length,
                        itemBuilder: (context, index) {
                          if (index == allProperties.length) {
                            return _buildLoading();
                          } else {
                            return SearchDetialsModel(
                              userName: allProperties[index].user?.name ?? '',
                              area: allProperties[index].area.toString(),
                              avatar: allProperties[index].user?.avatar ?? '',
                              bathrooms: allProperties[index]
                                  .numberBathrooms
                                  .toString(),
                              img: allProperties[index].small,
                              buildingSize:
                                  allProperties[index].buildingSize.toString(),
                              id: allProperties[index].id,
                              isFavorite: false,
                              location: '',    
                              price: allProperties[index].salePrice.toString(),
                              rooms:
                                  allProperties[index].numberRooms.toString(),
                              title: localeCode == 'ar'
                                  ? allProperties[index].titleAr
                                  : allProperties[index].titleEn,
                              type: allProperties[index].isRent == 1
                                  ? localizations.rent
                                  : localizations.sell,
                              viwes: allProperties[index].views.toString(),
                              url_3d: allProperties[index].url3d.toString(),
                              virtualTour: true,
                            );
                          }
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 8.0,
                        ),
                      ),
                    ],
                  ) : Center(
                    child: Text(
                      'No Result',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: Res.SubTitleFontSize,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
      ),
    );
  }
}

/*class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  RealEstateApi realestates = RealEstateApi();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child:
    Column(
        children: [
          Row(
            children: [
              Text(
                '9 Eva hostels Found',
                style: TextStyle(color: Res.kPrimaryColor),
              ),
              const Spacer(),
              const Icon(
                Icons.filter_alt
              )
            ],
          ),
         Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => index.isEven
                  ? FadeInRight(child:  RealEstateCard( Item.bestVilla[index], (){},index,),)
                  : FadeInLeft(child: RealEstateCard( Item.bestVilla[index], (){},index,),),
              itemCount: Item.bestVilla.length,
              physics: BouncingScrollPhysics(),

            ),
          ),
        ],
      ),
    );
  }
}*/

// RealEstateApi realEstate = RealEstateApi();

// class ResultPage extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:AppBar(

//         leading: IconButton(icon: Icon(Icons.arrow_back,),color: Res.blackColor, onPressed: () {
//           Navigator.pop(context);

//         }, ),
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//       ),
//       body: SafeArea(

//         child: FutureBuilder(
//           future: realEstate.getSeatch(),
//           builder:
//               (BuildContext context, AsyncSnapshot<List> snapshot) {
//             if (snapshot.hasData) {
//               return Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: Container(
//                       child: Card(
//                         color: Colors.black.withOpacity(0.5),
//                         child: ListView.builder(
//                             itemCount: snapshot.data?.length,
//                             itemBuilder: (BuildContext context, int index) {
//                               var currentPerson = snapshot.data![index];

//                               return ListTile(
//                                 title: Text(snapshot.data![index].toString()),
//                                 leading: CircleAvatar(
//                                   backgroundImage:
//                                   NetworkImage(snapshot.data![index].toString()),
//                                 ),

//                               );
//                             }),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             }

//             if (snapshot.hasError) {
//               print("error is >> ${snapshot.error}");
//               return Center(
//                   child: Icon(
//                     Icons.error,
//                     color: Colors.red,
//                     size: 82.0,
//                   ));
//             }

//             return Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     CircularProgressIndicator(),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     Text("Loading at the moment, please hold the line.")
//                   ],
//                 ));
//           },
//         ),
//       ),
//     );
//   }
// }

