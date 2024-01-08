import 'package:flutter/material.dart';
import 'package:maskkn/appConfig.dart';

class PhotographyRequestsPage extends StatefulWidget {
  const PhotographyRequestsPage({super.key});

  @override
  State<PhotographyRequestsPage> createState() =>
      _PhotographyRequestsPageState();
}

class _PhotographyRequestsPageState extends State<PhotographyRequestsPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    String localeCode = Localizations.localeOf(context).languageCode;
    late TabController tabController = TabController(length: 2, vsync: this);
    int tabIndex = 0;
    return Scaffold(
      backgroundColor: Res.whiteColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Res.whiteColor,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Res.blackColor,
            )),
        centerTitle: true,
        title: Text(
          localeCode == 'ar' ? 'اعلاناتي' : 'My Ads',
          style: TextStyle(
            fontSize: Res.TitleFontSize,
            fontWeight: FontWeight.bold,
            color: Res.blackColor,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: Res.blackColor,
              )),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: Res.kPrimaryColor,
                ),
              ),
              child: TabBar(
                  onTap: (v) {
                    // setState(() {
                    //   tabController.index = v;
                    // });
                  },
                  dividerColor: Colors.amber,
                  //   labelColor: Colors.red,
                  indicatorColor: Res.whiteColor,
                  unselectedLabelColor: Res.kPrimaryColor,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), // Creates border
                      color: Res.kPrimaryColor),
                  controller: tabController,
                  tabs: [
                    Container(
                      height: 35,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Center(
                        child: Text(
                          'Used',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            // color: tabController.index == 0
                            //     ? Res.whiteColor
                            //     : Res.kPrimaryColor
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 35,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Center(
                        child: Text(
                          'Avalibale',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(controller: tabController, children: [
                UsedWidgets(),
                AvailvaleWidgets(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class AvailvaleWidgets extends StatelessWidget {
  const AvailvaleWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                    color: Res.whiteColor,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 0.2,
                        spreadRadius: 0.5,
                      ),
                    ]),
                child: Column(
                  children: [
                    Text(
                      'Your photography balance',
                      style: const TextStyle(
                          fontSize: Res.SubTitleFontSize,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${index + 1 * 2} Shot',
                      style: TextStyle(
                          color: Res.kPrimaryColor,
                          fontSize: Res.SubTitleFontSize,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.collections_outlined),
                                Text(
                                  "Photo",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            //
                            Row(
                              children: [
                                Icon(Icons.collections_outlined),
                                Text(
                                  "Video",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            //
                            SizedBox(
                              width: 40,
                            ),
                            Row(
                              children: [
                                Icon(Icons.collections_outlined),
                                Text(
                                  "3D",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
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
        itemCount: 3);
  }
}

class UsedWidgets extends StatelessWidget {
  const UsedWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: ListView.separated(
          itemBuilder: (context, index) => Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                    color: Res.whiteColor,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 0.2,
                        spreadRadius: 0.5,
                      ),
                    ]),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.campaign_outlined,
                        color: Res.blackColor,
                      ),
                      title: Text(
                        'Muscat, See, Al Khoud 7',
                        style: const TextStyle(
                            fontSize: Res.SubTitleFontSize,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.article_outlined,
                        color: Res.blackColor,
                      ),
                      title: Text(
                        '12 - 03 - 2023',
                        style: const TextStyle(
                            fontSize: Res.SubTitleFontSize,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
          separatorBuilder: (context, index) => SizedBox(
                height: 8,
              ),
          itemCount: 3),
    );
  }
}
