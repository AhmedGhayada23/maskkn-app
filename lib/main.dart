import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:maskkn/providers/chat_messages_Provider.dart';
import 'package:maskkn/providers/filter_provider.dart';
import 'package:maskkn/providers/general_provider.dart';
import 'package:maskkn/providers/language_change.dart';
import 'package:maskkn/providers/list_property_provider.dart';
import 'package:maskkn/providers/request_property_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:maskkn/screens/start_screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'appConfig.dart';
import 'app_side_navigation.dart';
import 'functions/precache_functions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String initialLanguage = prefs.getString('language') ?? 'en';
  SideDrawerNavigator sideDrawerNavigator = SideDrawerNavigator();

  ///Set Database path

  //await AppInstallation.init();

  /// Install and configure all necessary things

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => sideDrawerNavigator),
      ChangeNotifierProvider<RequestPropertyProvider>(
          create: (context) => RequestPropertyProvider()),
      ChangeNotifierProvider<ListPropertyProvider>(
          create: (context) => ListPropertyProvider()),
      ChangeNotifierProvider<GeneralProvider>(
          create: (context) => GeneralProvider()),
      ChangeNotifierProvider<FilterProvider>(
          create: (context) => FilterProvider()),
      ChangeNotifierProvider(
          create: (context) => LanguageProvider(initialLanguage)),
      ChangeNotifierProvider(
        create: (context) => ChatMessagesProvider(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //PRECACHING IMAGES SO IMAGES LOAD SUPER FAST
    PreCacheFunctions().preCacheAssetImages(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MSKN',
        color: Res.grey200,
        locale: Locale(languageProvider.selectedLanguage),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no cHomePageountry code
          Locale('ar', ''), // Arabic, no country code
        ],
        theme: ThemeData(
          fontFamily: Res.fontFamily0,
          primarySwatch: Colors.blue,
        ),
        home:
            SplashScreen() //HomePage()///OnboardingScreens()//LoginScreen(),// //,//LoginScreen(),// OTPRegisterScreen(),//LoginScreen(),//MapPage()// GoogleMapCu() //HomePage(),//
        );
  }
}
//
