import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:maskkn/models/profile.dart';
import 'package:maskkn/network-services/authentication.dart';
import 'package:maskkn/network-services/profile.dart';
import 'package:maskkn/screens/other/contact_support.dart';
import 'package:maskkn/screens/authorization_screens/sign_in.dart';
import 'package:maskkn/screens/authorization_screens/storage.dart';
import 'package:maskkn/screens/photography_requests/photography_requests_page.dart';
import 'package:maskkn/screens/service-screens/appraisal/find_appraisal.dart';
import '../../appConfig.dart';
import '../authorization_screens/terms&conditions.dart';
import '../profile/MyPackages.dart';
import '../profile/my_adds.dart';
import '../profile/my_offers.dart';
import '../service-screens/photography/photo-subscribtion.dart';
import '../service-screens/property_managment/find_agent.dart';
import '../service-screens/request-property/request_type.dart';

class MsknDrawer extends StatefulWidget {
  const MsknDrawer({super.key});

  @override
  State<MsknDrawer> createState() => _MsknDrawerState();
}

class _MsknDrawerState extends State<MsknDrawer> {
  Profile? profile;

  void _fetchProfileData() async {
    try {
      Profile profileData = await ProfileApi().getUserInfo();
      setState(() {
        profile = profileData;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    _fetchProfileData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations _localizations = AppLocalizations.of(context)!;
    String localeCode = Localizations.localeOf(context).languageCode;
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    Widget _drawerItem(
            {required String text,
            required IconData icon,
            required double iconSize,
            required VoidCallback onClicked,
            bool active = false}) =>
        ListTile(
          leading: Icon(icon, size: iconSize, color: Res.whiteColor),
          title: Text(text, style: TextStyle(color: Res.whiteColor)),
          onTap: () => setState(onClicked),
        );
    return SafeArea(
      child: Drawer(
        key: _scaffoldKey,
        width: MediaQuery.of(context).size.width * 0.7,
        backgroundColor: Res.kPrimaryColor,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Center(
                child: FadeInLeft(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(profile
                                ?.media![0].original_url !=
                            null
                        ? profile!.media![0].original_url.toString()
                        : "https://th.bing.com/th/id/R.f78522203f00a679c5015d150f918b4d?rik=uC4pQbfH4RSGQA&riu=http%3a%2f%2fultrarmc.com%2fassets%2fimg%2ftestmonial%2ftestimo-2.jpg&ehk=62eDwL1swCHM2NaUqwZELlYqW%2fg41ddupP%2fA2ztOikU%3d&risl=&pid=ImgRaw&r=0;"),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                  child: Text(
                profile?.name ?? '',
                style: TextStyle(
                    fontSize: Res.TitleFontSize, color: Res.whiteColor),
              )),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView(children: [
              Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Colors.white, // here for close state
                  colorScheme: ColorScheme.light(
                    primary: Colors.white,
                  ), // here for open state in replacement of deprecated accentColor
                  dividerColor:
                      Colors.transparent, // if you want to remove the border
                ),
                child: ExpansionTile(
                  title: Text(
                    _localizations.allCategories,
                    style: TextStyle(
                        color: Res.whiteColor, fontSize: Res.SubTitleFontSize),
                  ),
                  backgroundColor: Colors.white.withOpacity(0.1),
                  leading: Icon(
                    Icons.dashboard,
                    size: 20,
                    color: Res.whiteColor,
                  ),
                  childrenPadding: EdgeInsets.only(left: 40),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _drawerItem(
                        icon: Icons.square,
                        iconSize: 10,
                        text: _localizations.myoffers,
                        onClicked: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyOffers()));
                        }),
                    // _drawerItem(
                    //   text: _localizations.requestproperty,
                    //   onClicked: () {
                    //     Navigator.of(context).push(MaterialPageRoute(
                    //         builder: (context) => RequestType()));
                    //   },
                    //   icon: Icons.square,
                    //   iconSize: 10,
                    // ),
                    // _drawerItem(
                    //   text: _localizations.appraisal,
                    //   icon: Icons.square,
                    //   iconSize: 10,
                    //   onClicked: () {
                    //     Navigator.of(context).push(MaterialPageRoute(
                    //         builder: (context) => FindAppraisal()));
                    //   },
                    // ),
                    // _drawerItem(
                    //   text: _localizations.propertyManagement,
                    //   icon: Icons.square,
                    //   iconSize: 10,
                    //   onClicked: () {
                    //     Navigator.of(context).push(MaterialPageRoute(
                    //         builder: (context) => PropertyManagement()));
                    //   },
                    // ),
                    _drawerItem(
                      text: localeCode == 'ar'
                          ? 'طلبات التصوير'
                          : 'Photography Requests',
                      icon: Icons.square,
                      iconSize: 10,
                      onClicked: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PhotographyRequestsPage()));
                        //_scaffoldKey.currentState!.closeDrawer();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              _drawerItem(
                  iconSize: 20,
                  icon: Icons.campaign_outlined,
                  text: _localizations.myadds,
                  onClicked: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => MyAds()));
                  }),

              _drawerItem(
                text: _localizations.mypakges,
                icon: Icons.shopping_bag_rounded,
                iconSize: 20,
                onClicked: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyPackages()));
                },
              ), //@mskn_app
              _drawerItem(
                  iconSize: 20,
                  icon: Icons.article,
                  text: _localizations.termOfSer,
                  onClicked: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (cnx) => AppTerms()));
                  }),
              _drawerItem(
                  icon: Icons.security,
                  text: _localizations.privacyPolicy,
                  iconSize: 20,
                  onClicked: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (cnx) => AppTerms()));
                  }),
              _drawerItem(
                  icon: Icons.support_agent_rounded,
                  iconSize: 20,
                  text: _localizations.heplSupport,
                  onClicked: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ContactSupportPage()));
                  }),
              _drawerItem(
                  icon: Icons.logout,
                  iconSize: 20,
                  text: _localizations.singOut,
                  onClicked: () {
                    SecureStorage.removeStorage();
                    AuthAPI().logout();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (cnx) => LoginScreen()));
                  }),
            ]),
          )
        ]),
      ),
    );
  }
}
