import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maskkn/screens/service-screens/add_property/add_property.dart';
import 'package:provider/provider.dart';
import '../../appConfig.dart';
import '../../network-services/property_request.dart';

import '../../network-services/required_data_api.dart';
import '../../network-services/wilays_governorate.dart';
import '../../providers/general_provider.dart';
import '../../providers/request_property_provider.dart';
import '../chat-screen/chat-main.dart';
import '../favorite-list/favorite-list.dart';
import '../map_screens/map.dart';
import '../profile/user_profile.dart';
import '../shared_components/mskn_drawer.dart';
import 'components/body.dart';
import '../../AppIcons/icons.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  int selectedIndex;
  HomePage({this.selectedIndex = 0, Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // int _selectedIndex = widget.selectedIndex;
  RequairedData requairedData = RequairedData();
  StatApi stateApi = StatApi();
  static final List<Widget> _widgetOptions = <Widget>[
    MainBody(),
    ChatScreen(),
    FavoriteList(),
    MyProfile(),
  ];

  //get the data from the api in the main page for other pages
  // this is to speed extracting the data
  // so when user move to that pages the data is already exist

  void getGovernoratesWillay() async {
    final GProvider = Provider.of<GeneralProvider>(context, listen: false);
    GProvider.changegovernorate(await stateApi.getAllStates('en'));
    GProvider.changewillays(await stateApi.getAllCites('en'));
  }

  void getPropertyRequestOffers() async {
    PropertyRequest propertyApi = PropertyRequest();
    final PRProvider =
        Provider.of<RequestPropertyProvider>(context, listen: false);
    PRProvider.changePROffers(await propertyApi.getPropertyRequestOffers());
  }

  void getSectorTypes() async {
    final GProvider = Provider.of<GeneralProvider>(context, listen: false);
    GProvider.changesectorTypes(await requairedData.getSectorDetails());
  }

  void getRoomTypes() async {
    final GProvider = Provider.of<GeneralProvider>(context, listen: false);
    GProvider.changeroomTypes(await requairedData.getRoomTypes());
  }

  void getFeatures() async {
    final GProvider = Provider.of<GeneralProvider>(context, listen: false);
    GProvider.changefeatures(await requairedData.getFeatures());
  }

  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      getGovernoratesWillay();
      getPropertyRequestOffers();
      getSectorTypes();
      getRoomTypes();
      getFeatures();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    AppLocalizations localizations = AppLocalizations.of(context)!;
    String localeCode = Localizations.localeOf(context).languageCode;

    return WillPopScope(
      onWillPop: () async {
        return (await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                    localeCode == 'ar' ? 'هل أنت متأكد ؟' : 'Are you sure ?'),
                content: Text(localeCode == 'ar'
                    ? 'هل تود الخروج من مسكن ؟'
                    : 'Would you like to get out of the mskkn?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(localeCode == 'ar' ? 'لا' : 'No'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text(localeCode == 'ar' ? 'نعم' : 'Yes'),
                  ),
                ],
              ),
            )) ??
            false;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        key: scaffoldKey,
        appBar: () {
          if (widget.selectedIndex == 0) {
            return AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.menu),
                iconSize: 30,
                color: Res.whiteColor,
                padding: const EdgeInsets.all(8),
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.add),
                  color: Res.whiteColor,
                  padding: const EdgeInsets.all(8),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddProperty(),
                        ));
                  },
                ),
              ],
            );
          } else if (widget.selectedIndex == 1) {
            return AppBar(
                backgroundColor: Colors.transparent,
                centerTitle: true,
                // leading: Icon(Ico),
                title: Text(
                  'Showing Result',
                  style: TextStyle(
                      color: Res.blackColor,
                      fontSize: Res.SubTitleFontSize,
                      fontWeight: FontWeight.w500),
                ),
                elevation: 0,
                actions: [
                  Icon(Icons.notifications_none_rounded, color: Colors.black),
                  const SizedBox(
                    width: 20,
                  ),
                ]);
          } else if (widget.selectedIndex == 2) {
            return AppBar(
                backgroundColor: Colors.transparent,
                centerTitle: true,
                // leading: Icon(Ico),
                title: Text(
                  'Showing Result',
                  style: TextStyle(
                      color: Res.blackColor,
                      fontSize: Res.SubTitleFontSize,
                      fontWeight: FontWeight.w500),
                ),
                elevation: 0,
                actions: [
                  Icon(Icons.notifications_none_rounded, color: Colors.black),
                  const SizedBox(
                    width: 20,
                  ),
                ]);
          } else {
            return AppBar(
                elevation: 0,
                centerTitle: true,
                backgroundColor: Colors.transparent,
                title: Text(
                  localizations.myprofile,
                  style: TextStyle(color: Colors.white),
                ));
          }
        }(),
        body: _widgetOptions.elementAt(widget.selectedIndex), // MainBody(),
        drawer: MsknDrawer(),
        //  bottomNavigationBar: BottomNavBar2(),
        floatingActionButton: widget.selectedIndex == 0
            ? FloatingActionButton(
                foregroundColor: Res.whiteColor,
                backgroundColor: Res.kPrimaryColor,
                child: SvgPicture.asset('assets/icon/map.svg'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GoogleMapCu(),
                      ));
                })
            : Container(),

        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.chat_bubble_outline),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: "",
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.person_outline),
            ),
          ],
          currentIndex: widget.selectedIndex,
          unselectedItemColor: Res.dGrayColor,
          selectedItemColor: Res.kPrimaryColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
