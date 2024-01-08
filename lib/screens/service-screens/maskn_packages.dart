import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../appConfig.dart';
import '../../../network-services/packages.dart';
import 'all_packges.dart';


class PhotographyPackage extends StatefulWidget {
  const PhotographyPackage({super.key});

  @override
  State<PhotographyPackage> createState() => _PhotographyPackageState();
}

class _PhotographyPackageState extends State<PhotographyPackage>
    with TickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);
  PackagesApi packagesApi = PackagesApi();

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    String LanguageCode = Localizations.localeOf(context).languageCode;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(localizations.photography, style: TextStyle(color: Res.blackColor),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back,),color: Res.blackColor,
            onPressed: () {
              Navigator.pop(context);}
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Text(
              localizations.choosePackage,
              style: TextStyle(
                  color: Res.dGrayColor, fontSize: Res.SubTitleFontSize),
            ),
            SizedBox(
              height: 10,
            ),
            TabBar(
              indicatorColor: Res.sPrimaryColor,
              controller: tabController,
              onTap: (v) {
                setState(() {});
              },
              labelStyle: TextStyle(color: Res.sPrimaryColor),
              tabs: [
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Center(
                    child: Text(
                      localizations.monthly,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: tabController.index == 0
                              ? Res.kPrimaryColor
                              : Colors.grey),
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Center(
                      child: Text(
                        localizations.annually,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: tabController.index == 1
                                ? Res.kPrimaryColor
                                : Colors.grey),
                      )),
                ),
              ],
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Res.sPrimaryColor,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(
                  controller: tabController,
                  children: [
                    FutureBuilder(
                      future: packagesApi.getAllPackages(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                          case ConnectionState.active:
                            return Container(
                              alignment: Alignment.center,
                              child: Text("Loading"),
                            );
                            // ignore: dead_code
                            break;
                          case ConnectionState.done:
                            if (snapshot.hasError) {
                              // return whatever you'd do for this case, probably an error
                              return Container(
                                alignment: Alignment.center,
                                child: Text("Error: ${snapshot.error}"),
                              );
                            }
                            List data = snapshot.data as List;
                            return  ListView.builder(
                              reverse: false,
                              itemCount: data.length,
                              itemBuilder: (_, int index) =>
                                  FadeInRight(child: PhotoPackgeWidget(packageId:1, title: LanguageCode =='en' ? data[index].nameEn:data[index].nameAr ,ads: '',
                                    subTitle: "${data[index].photography.toString()} ${localizations.packageEinclude}"  ,price: data[index].price.toString(),discont:data[index].discount ,),
                                  ),
                            );
                            // ignore: dead_code
                            break;
                        }
                      },
                    ),

                    /*      children: [
                          FadeInLeft(child: SinglePhotoPackge(title: "photography packages", subTitle: "-20 Photography shot each include: ",price: 200,),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FadeInRight(child: SinglePhotoPackge(title: "Single photography package", subTitle: "One single pack each encluede: ",price: 20,),
                          ),

                        ],*/

                    ListView(
                      children: [
                        FadeInLeft(child: PhotoPackgeWidget(packageId: 1,title: "photography packages", subTitle: "-20 Photography shot",price: '200',discont: '0',ads: '',),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FadeInRight(child: PhotoPackgeWidget(
                          title: "photography packages",
                          subTitle: "-20 Photography shot",
                          ads: '',
                          price: '200',discont: '0',packageId: 1,),),

                      ],
                    ),

                  ]),
            ),



          ],
        ),
      ),
    );
  }
}


