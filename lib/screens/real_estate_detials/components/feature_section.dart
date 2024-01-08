import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../appConfig.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FeatureSection extends StatelessWidget {
  const FeatureSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          localizations.feature,
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Res.kPrimaryColor),
        ),
        SizedBox(
          height: 10,
        ),
        FadeInLeft(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FeatureSectionWidget(
                
                  icon: Icon(
                    Icons.local_parking,
                    size: 20,
                    color: Res.dGrayColor,
                  ),
                  title: localizations.parking),
              FeatureSectionWidget(
                icon:
                    Icon(Icons.security_sharp, size: 20, color: Res.dGrayColor),
                title: localizations.security,
              ),
              FeatureSectionWidget(
                icon: Icon(Icons.balcony, size: 20, color: Res.dGrayColor),
                title: localizations.balcony,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        FadeInRight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FeatureSectionWidget(
                icon: Icon(Icons.pool, size: 20, color: Res.dGrayColor),
                title: localizations.pool,
              ),
              FeatureSectionWidget(
                icon:
                    Icon(Icons.ac_unit_sharp, size: 20, color: Res.dGrayColor),
                title: localizations.ac,
              ),
              FeatureSectionWidget(
                icon: Icon(Icons.cameraswitch_sharp,
                    size: 20,
                    color: Res
                        .dGrayColor), //FaIcon(FontAwesomeIcons.cam,size:20,color:Res.dGrayColor),//
                title: localizations.cctv,
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class FeatureSectionWidget extends StatefulWidget {
  Widget icon;
  String title;
  Function()? onTap;
  FeatureSectionWidget(
      {required this.icon, required this.title, this.onTap, Key? key})
      : super(key: key);

  @override
  State<FeatureSectionWidget> createState() => _FeatureSectionWidgetState();
}

class _FeatureSectionWidgetState extends State<FeatureSectionWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isChecked != isChecked;
          widget.onTap;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isChecked
              ? Res.kPrimaryColor.withOpacity(0.5)
              : Colors.transparent,
          border: Border.all(color: Res.grey200!),
          borderRadius: BorderRadius.circular(5),
        ),
        width: MediaQuery.of(context).size.width * 0.25,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: widget.icon,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
                flex: 2,
                child: Text(
                  widget.title,
                  style: TextStyle(
                      color: Res.dGrayColor, fontSize: Res.SubTextFontSize),
                )),
          ],
        ),
      ),
    );
  }
}
