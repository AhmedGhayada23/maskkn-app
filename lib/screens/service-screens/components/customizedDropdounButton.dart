import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../appConfig.dart';

class DropDownButtonProvider extends StatefulWidget {
  DropDownButtonProvider(
      {Key? key,
      required this.items,
      required this.selectedValue,
      required this.onchanged})
      : super(key: key);
  List<String> items;
  final void Function(String?) onchanged;
  String? selectedValue;
  @override
  State<DropDownButtonProvider> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButtonProvider> {
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
        // margin: EdgeInsets.only(top: 10,bottom: 10),
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
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.black,
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
          value: widget.selectedValue,
          onChanged: widget.onchanged,
          // buttonHeight: 40,
          // buttonWidth: MediaQuery.of(context).size.width * 0.8,
          // itemHeight: 40,
          // dropdownMaxHeight: 200,
          //searchController: textEditingController,

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
