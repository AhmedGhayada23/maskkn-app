import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../appConfig.dart';

class DropDownButtonWidget extends StatefulWidget {
  DropDownButtonWidget({Key? key, required this.items}) : super(key: key);
  List<String> items;
  @override
  State<DropDownButtonWidget> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButtonWidget> {
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Res.grey200!, width: 0.5));
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return DropdownButtonHideUnderline(
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 1, color: Res.dGrayColor.withOpacity(0.5)),
        ),
        child: DropdownButton2(
          isExpanded: true,
          hint: Text(
            localizations.selectItem,
            style: TextStyle(
              fontSize: Res.SubTextFontSize,
              color: Res.blackColor,
            ),
          ),
          items: widget.items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: Res.TextFontSize,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
          // buttonHeight: 40,
          // buttonWidth: MediaQuery.of(context).size.width * 0.8,
          // itemHeight: 40,
          // dropdownMaxHeight: 200,
          // searchController: textEditingController,
          // searchInnerWidget: Padding(
          //   padding: const EdgeInsets.only(
          //     top: 8,
          //     bottom: 4,
          //     right: 8,
          //     left: 8,
          //   ),
          //   child: TextFormField(
          //     controller: textEditingController,
          //     decoration: InputDecoration(
          //       isDense: true,
          //       contentPadding: const EdgeInsets.symmetric(
          //         horizontal: 10,
          //         vertical: 8,
          //       ),
          //       hintText: localizations.search ,
          //       hintStyle: const TextStyle(fontSize: 12),
          //       enabledBorder: border,
          //       focusedBorder:border,
          //       border: border,
          //       disabledBorder: border,

          //     ),
          //   ),
          // ),
          // searchMatchFn: (item, searchValue) {
          //   return (item.value.toString().toLowerCase().contains(searchValue.toLowerCase()));
          // },
          //This to clear the search value when you close the menu
          onMenuStateChange: (isOpen) {
            if (!isOpen) {
              textEditingController.clear();
            }
          },
        ),
      ),
    );
  }
}
