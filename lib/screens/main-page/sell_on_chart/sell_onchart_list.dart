import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:maskkn/models/property_off_plan.dart';
import 'package:maskkn/screens/main-page/allProperties.dart';
import 'package:maskkn/screens/main-page/sell_on_chart/all_sell_chart.dart';
import '../../../appConfig.dart';
import '../../../models/chart_item.dart';
import '../../real_estate_detials/screen_1.dart';
import 'onchart_card.dart';

class SellOnChartList extends StatefulWidget {
  SellOnChartList(this.items, {super.key});
  List<PropertyOffPlanModel> items;
  @override
  State<SellOnChartList> createState() => _SellOnChartListState();
}

class _SellOnChartListState extends State<SellOnChartList> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    if (widget.items.length < 1) {
      return Center(
        child: CircularProgressIndicator(
          color: Res.kPrimaryColor,
          backgroundColor: Res.grey200,
        ),
      );
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                localizations.sellonchart,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Res.SubTitleFontSize),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const AllSekkChart())));
                  },
                  child: Text(
                    localizations.seemore,
                    style: TextStyle(color: Res.kPrimaryColor),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.items.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SellChartCard(
                      widget.items[index],
                      () {
                        //  Navigator.of(context).push(
                        // MaterialPageRoute(
                        //   builder: (context) => ScreenOne(),
                        // ));
                      },
                      index,
                      false,
                    ),
                  )
              //  RealEstateCard(widget.items[index], (){},index,),
              ),
        )
      ],
    );
  }
}
