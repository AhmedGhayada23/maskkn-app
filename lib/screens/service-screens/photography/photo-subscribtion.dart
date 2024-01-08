import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../appConfig.dart';
import '../../../models/photography_package.dart';
import '../../../network-services/packages.dart';
import '../all_packges.dart';

class PhotographySubscription extends StatefulWidget {
  const PhotographySubscription({super.key});

  @override
  State<PhotographySubscription> createState() =>
      _PhotographySubscriptionState();
}

class _PhotographySubscriptionState extends State<PhotographySubscription> {
  PackagesApi packagesApi = PackagesApi();

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    String LanguageCode = Localizations.localeOf(context).languageCode;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          localizations.photography,
          style: TextStyle(color: Res.blackColor),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            color: Res.blackColor,
            onPressed: () {
              Navigator.pop(context);
            }),
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
              height: 20,
            ),
            SizedBox(
                height: 380,
                //getPhotographyPackages

                child: FutureBuilder(
                  future: packagesApi.getPhotographyPackages(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<PhotographyPackage>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return FadeInRight(
                              child: PhotoPackgeWidget(
                                title: snapshot.data![index].nameEn.toString(),
                                subTitle:
                                    "${snapshot.data![index].photography} Photography shot",
                                ads: '',
                                price: '${snapshot.data![index].price / 1000}',
                                discont:
                                    snapshot.data![index].discount.toString(),
                                packageId: snapshot.data![index].id!,
                              ),
                            );
                          });
                    }

                    if (snapshot.hasError) {
                      print("error is >> ${snapshot.error}");
                      print("error data >> ${snapshot.hasData}");
                      return Center(
                          child: Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 82.0,
                      ));
                    }

                    return Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text("Loading at the moment, please hold the line.")
                      ],
                    ));
                  },
                )

                /*   ListView(


                children: [
                  FadeInLeft(child:
                  PhotoPackgeWidget(
                    packageId: 1,
                    title: "photography packages",
                    subTitle: "-20 Photography shot",
                    price: '200',discont: 0,),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FadeInRight(child:
                  PhotoPackgeWidget(
                    title: "photography packages",
                    subTitle: "-20 Photography shot",
                    price: '200',discont: 0,packageId: 1,),),

                ],
              ),*/
                ),
            FutureBuilder(
              future: packagesApi.getPhotographyPackages(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Text(
                        LanguageCode == 'ar'
                            ? 'صور عقارك باحترافية'
                            : "Capture Professional Photos of Your Property",
                        style: TextStyle(
                            color: Res.dGrayColor,
                            fontSize: Res.SubTitleFontSize),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FadeInRight(
                        child: Image.asset(
                          'assets/img/CaptureProfessional.jpg',
                          height: 300,
                        ),
                      ),
                    ],
                  );
                } else {
                  return SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
