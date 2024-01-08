import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:maskkn/models/profile.dart';
import 'package:maskkn/network-services/authentication.dart';
import 'package:maskkn/network-services/profile.dart';
import 'package:maskkn/providers/language_change.dart';
import 'package:maskkn/screens/authorization_screens/sign_in.dart';
import 'package:maskkn/screens/authorization_screens/storage.dart';
import 'package:maskkn/screens/profile/personal_information.dart';
import 'package:provider/provider.dart';
import '../../appConfig.dart';
import 'my_adds.dart';
import 'my_offers.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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
    AppLocalizations localizations = AppLocalizations.of(context)!;
    String localeCode = Localizations.localeOf(context).languageCode;
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.35,
          decoration: BoxDecoration(
              color: Res.kPrimaryColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5))),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: MediaQuery.of(context).viewPadding.top + 120,
                ),
              ),
              CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(profile?.media?[0].original_url !=
                        null
                    ? profile!.media![0].original_url.toString()
                    : "https://th.bing.com/th/id/R.f78522203f00a679c5015d150f918b4d?rik=uC4pQbfH4RSGQA&riu=http%3a%2f%2fultrarmc.com%2fassets%2fimg%2ftestmonial%2ftestimo-2.jpg&ehk=62eDwL1swCHM2NaUqwZELlYqW%2fg41ddupP%2fA2ztOikU%3d&risl=&pid=ImgRaw&r=0;"),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                profile?.name ?? '',
                style: TextStyle(
                    fontSize: Res.TitleFontSize,
                    fontWeight: FontWeight.bold,
                    color: Res.whiteColor),
              ),
              Text(
                profile?.email ?? '',
                style: TextStyle(color: Res.whiteColor.withOpacity(0.8)),
              ),
              const SizedBox(
                height: 7,
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: tile(context, Icons.person_outline_outlined,
                        localizations.personalInfo, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (cnx) => PersonalInformation()));
                    }),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: tile(
                        context, Icons.campaign_outlined, localizations.myadds,
                        () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (cnx) => MyAds()));
                    }),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: tile(context, Icons.local_offer_outlined,
                        localizations.myoffers, () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (cnx) => MyOffers()));
                    }),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: tile(context, Icons.notifications_none,
                        localizations.notification, () {}),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: tile(context, Icons.support_agent_sharp,
                        localizations.heplSupport, () {}),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: InkWell(
                      onTap: () {
                        if (languageProvider.selectedLanguage == 'en') {
                          languageProvider.setLanguage('ar');
                        } else {
                          languageProvider.setLanguage('en');
                        }
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.language,
                            color: Res.kPrimaryColor,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            localizations.language,
                            style: TextStyle(
                              fontSize: Res.TextFontSize,
                            ),
                          ),
                          Spacer(),
                          Spacer(),
                          Text(
                            localeCode == 'ar' ? 'عربي' : 'En',
                            style: TextStyle(
                              fontSize: Res.TextFontSize,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: InkWell(
                      onTap: () {
                        SecureStorage.removeStorage();
                        AuthAPI().logout();
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (cnx) => LoginScreen()));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: Res.sPrimaryColor,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            localizations.singOut,
                            style: TextStyle(
                                fontSize: Res.TextFontSize,
                                color: Res.sPrimaryColor),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

Widget tile(
    BuildContext context, IconData icon, String title, Function() ontap) {
  return InkWell(
    onTap: ontap,
    splashColor: Res.grey200,
    child: Row(
      children: [
        Icon(
          icon,
          color: Res.kPrimaryColor,
        ),
        const SizedBox(
          width: 7,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: Res.TextFontSize),
        ),
        const Spacer(),
        const Icon(Icons.chevron_right)
      ],
    ),
  );
}
