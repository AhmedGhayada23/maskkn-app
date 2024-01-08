import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:maskkn/appConfig.dart';
import 'package:maskkn/models/bank.dart';
import 'package:maskkn/models/city.dart';
import 'package:maskkn/models/governorate.dart';
import 'package:maskkn/models/property_request_type.dart';
import 'package:maskkn/models/sector.dart';
import 'package:maskkn/models/sector_details.dart';
import 'package:maskkn/network-services/property_request.dart';
import 'package:maskkn/network-services/sector_req.dart';
import 'package:maskkn/screens/main-page/filter_page.dart';
import 'package:maskkn/screens/service-screens/appraisal/find_appraisal.dart';
import 'package:maskkn/screens/service-screens/components/customizedDropdounButton.dart';
import 'package:maskkn/screens/service-screens/property_managment/find_agent.dart';

class FilterAppraisal extends StatefulWidget {
  const FilterAppraisal({super.key});

  @override
  State<FilterAppraisal> createState() => _FilterAppraisalState();
}

class _FilterAppraisalState extends State<FilterAppraisal> {
  SectorReqest sectorReqest = SectorReqest();
  List<Governorate> governorateData = [];

  List<Bank> bankData = [];

  fetchData() async {
    var governorateDetail = await sectorReqest.getGovernorate(null);
    var banks = await sectorReqest.getBank();

    setState(() {
      governorateData.addAll(governorateDetail);
      bankData.addAll(banks);
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  ///DATA GETTER
  String? selectedGovernorate;
  String? selectedGovernorateId;
  String? selectedWilaya;
  String? selectedWilayaId;
  String? selectedBank;
  String? selectedBankId;
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    String localeCode = Localizations.localeOf(context).languageCode;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_sharp,
          ),
          color: Res.blackColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        // leading: Icon(Ico),
        title: Text(
          localizations.filters,
          style: TextStyle(
              color: Res.blackColor,
              fontSize: Res.SubTitleFontSize,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // This switch is to be activated for the variants of the side drawer quran index.

            SizedBox(
              height: 10,
            ),
            Text(localizations.governorate, style: SubTitleStyle),
            SizedBox(
              height: 10,
            ),
            DropDownButtonProvider(
                items:
                    governorateData.map((e) => e.stateAr.toString()).toList(),
                selectedValue: selectedGovernorate,
                onchanged: (value) {
                  setState(() {
                    var governorateDatavalue = governorateData.firstWhere(
                      (element) => element.stateAr == value,
                    );

                    selectedGovernorateId = governorateDatavalue.id.toString();
                    selectedGovernorate = value as String;
                    print("type2 ==> ${selectedGovernorateId}");
                    print("type ==> ${value}");
                  });
                }),
            SizedBox(
              height: 10,
            ),

            Text(localizations.bank, style: SubTitleStyle),
            SizedBox(
              height: 10,
            ),
            DropDownButtonProvider(
                items: bankData.map((e) => e.nameAr.toString()).toList(),
                selectedValue: selectedBank,
                onchanged: (value) {
                  setState(() {
                    var bankDatavalue = bankData.firstWhere(
                      (element) => element.nameAr == value,
                    );

                    selectedBankId = bankDatavalue.id.toString();
                    selectedBank = value as String;
                    print("type2 ==> ${selectedGovernorateId}");
                    print("type ==> ${value}");
                  });
                }),
            SizedBox(
              height: 10,
            ),

            Container(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Res.kPrimaryColor),
                      shape: MaterialStateProperty.resolveWith((states) =>
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      localizations.showProperties,
                      style: const TextStyle(
                        fontSize: Res.SubTitleFontSize,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FindAppraisal(
                        bankId: selectedBankId,
                        stateId: selectedGovernorateId,
                      ),
                    ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
