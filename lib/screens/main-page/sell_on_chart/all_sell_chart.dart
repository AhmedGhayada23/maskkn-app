import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:maskkn/appConfig.dart';
import 'package:maskkn/models/property_off_plan.dart';
import 'package:maskkn/network-services/maps_api.dart';
import 'package:maskkn/screens/main-page/sell_on_chart/onchart_card.dart';

class AllSekkChart extends StatefulWidget {
  const AllSekkChart({super.key});

  @override
  State<AllSekkChart> createState() => _AllSekkChartState();
}

class _AllSekkChartState extends State<AllSekkChart> {
  MapsApi mapsApi = MapsApi();
  List<PropertyOffPlanModel> allProperties = [];
  int page = 0;
  int limit = 5;
  bool isLoadMore = false;
  bool hasMoreData = true; // new variable to track if there is more data
  ScrollController scrollController = ScrollController();

  fetchData() async {
    var offplans = await mapsApi.getOffPlan(context);
    setState(() {
      allProperties.addAll(offplans);
      print("length>> ${allProperties.length}");
      // hasMoreData = properties.length == limit;
    });
  }

  @override
  void initState() {
    fetchData();
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          hasMoreData) {
        setState(() {
          isLoadMore = true;
        });
        page++;
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
    String localeCode = Localizations.localeOf(context).languageCode;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Showing Result',
          style: TextStyle(
              color: Res.blackColor,
              fontSize: Res.SubTitleFontSize,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
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
      body: ListView.builder(
          controller: scrollController,
          itemCount:
              isLoadMore ? allProperties.length + 1 : allProperties.length,
          itemBuilder: (BuildContext context, int index) {
            if (allProperties.length == 0) {
              return Center(
                child: CircularProgressIndicator(
                  color: Res.kPrimaryColor,
                  backgroundColor: Res.grey200,
                ),
              );
            } else if (index == allProperties.length) {
              return _buildLoading();
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SellChartCard(
                  allProperties[index],
                  () {},
                  index,
                  false,
                ),
              );
            }
          }),
    );
  }
}
