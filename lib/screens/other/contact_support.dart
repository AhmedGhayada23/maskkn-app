import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maskkn/appConfig.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSupportPage extends StatefulWidget {
  const ContactSupportPage({super.key});

  @override
  State<ContactSupportPage> createState() => _ContactSupportPageState();
}

class _ContactSupportPageState extends State<ContactSupportPage> {
  @override
  Widget build(BuildContext context) {
    String localeCode = Localizations.localeOf(context).languageCode;
    return Scaffold(
      backgroundColor: Res.whiteColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Res.whiteColor,
        centerTitle: true,
        title: Text(
          localeCode == 'ar' ? 'الاتصال والدعم' : 'Contact & Support',
          style: TextStyle(fontSize: Res.TitleFontSize, color: Res.blackColor),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Res.blackColor,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              localeCode == 'ar' ? 'تحدث معنا' : 'Chat with us',
              style: TextStyle(
                  fontSize: Res.TitleFontSize,
                  color: Res.kPrimaryColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                Uri uri = Uri.parse('https://wa.me/+95877360777');
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                } else {
                  throw Exception('Could not launch $uri');
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                decoration: BoxDecoration(
                    color: Res.whiteColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 0.2,
                        spreadRadius: 0.5,
                      ),
                    ]),
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sales tram',
                              style: TextStyle(
                                  fontSize: Res.TitleFontSize,
                                  color: Res.blackColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '+958 77360777',
                              style: TextStyle(
                                  fontSize: Res.TitleFontSize,
                                  color: Res.blackColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icon/chat.svg'),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              localeCode == 'ar' ? 'دردشة' : 'Chat',
                              style: TextStyle(
                                  fontSize: Res.TitleFontSize,
                                  color: Res.kPrimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            // boot
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async {
                Uri uri = Uri.parse('https://wa.me/+95877132777');
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                } else {
                  throw Exception('Could not launch $uri');
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                decoration: BoxDecoration(
                    color: Res.whiteColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 0.2,
                        spreadRadius: 0.5,
                      ),
                    ]),
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ChatBot',
                              style: TextStyle(
                                  fontSize: Res.TitleFontSize,
                                  color: Res.blackColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '+958 77132777',
                              style: TextStyle(
                                  fontSize: Res.TitleFontSize,
                                  color: Res.blackColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icon/chat.svg'),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              localeCode == 'ar' ? 'دردشة' : 'Chat',
                              style: TextStyle(
                                  fontSize: Res.TitleFontSize,
                                  color: Res.kPrimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              localeCode == 'ar'
                  ? "للطلبات الخاصة بالعقارات"
                  : 'For Special property Requests',
              style: TextStyle(
                  fontSize: Res.TitleFontSize,
                  color: Res.kPrimaryColor,
                  fontWeight: FontWeight.bold),
            ),

            SizedBox(
              height: 8,
            ),

            InkWell(
              onTap: () async {
                Uri uri = Uri.parse('https://info@mskn.om');
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                } else {
                  throw Exception('Could not launch $uri');
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                decoration: BoxDecoration(
                    color: Res.whiteColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 0.2,
                        spreadRadius: 0.5,
                      ),
                    ]),
                child: Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.email,
                          color: Res.dGrayColor,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'info@mskn.om - sales@mskn.om',
                          style: TextStyle(
                              fontSize: Res.TitleFontSize,
                              color: Res.blackColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
