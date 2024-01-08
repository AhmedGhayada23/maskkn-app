

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:maskkn/screens/main-page/search_result.dart';
import '../../../appConfig.dart';
import '../filter_page.dart';

class SearchFeild extends StatefulWidget {
  const SearchFeild({Key? key}) : super(key: key);

  @override
  State<SearchFeild> createState() => _SearchFeildState();
}

class _SearchFeildState extends State<SearchFeild> {

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return TextField(
      style: TextStyle(fontSize: 15),
      onSubmitted: (value) {
        Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(
                      keyword: value,
                    )));
      },
      cursorColor:Res.dGrayColor2,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Res.lGrayColor, width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 0.0,
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Res.lGrayColor, width: 0),
          ),
        filled: true,
        fillColor: Res.lGrayColor,
        hintText: localizations.search,
        prefixIcon: Icon(Icons.search_rounded, color: Res.dGrayColor,),
        suffixIcon: IconButton(icon: Icon(Icons.filter_alt_outlined) ,color: Res.dGrayColor,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FilterPage()));
          },),

      ),
    );
  }
}
