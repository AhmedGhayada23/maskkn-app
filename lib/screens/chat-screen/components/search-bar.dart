import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../appConfig.dart';

class SearchChatBar extends StatelessWidget {
  const SearchChatBar(
      {Key? key, required this.controller, this.filtterOnTap, this.onSubmitted})
      : super(key: key);
  final TextEditingController? controller;
  final Function()? filtterOnTap;
  final Function()? onSubmitted;

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
      child: Container(
        decoration: BoxDecoration(
          color: Res.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          style: TextStyle(fontSize: 15, fontFamily: "Sf Pro"),
          cursorColor: Res.dGrayColor2,
          onSubmitted: (value) => onSubmitted,
          decoration: InputDecoration(
            // suffixIcon: IconButton(
            //     onPressed: filtterOnTap,
            //     icon: Icon(
            //       Icons.filter_list_sharp,
            //       color: Res.blackColor,
            //     )),
            contentPadding: EdgeInsets.zero,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Res.whiteColor, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              gapPadding: 0.0,
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Res.whiteColor, width: 2),
            ),
            filled: true,
            fillColor: Res.whiteColor,
            hintText: localizations.search,
            prefixIcon: Icon(
              Icons.search_rounded,
              color: Res.dGrayColor,
            ),
          ),
        ),
      ),
    );
  }
}
