import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../appConfig.dart';

// ignore: must_be_immutable
class CustomizedTextField extends StatelessWidget {
  final FormFieldValidator<String>? validatorCallBack;
  late TextEditingController controller;
  final String name;
  final IconButton? icon;
  final bool obscureText;
  final int maxLine;
  final List<String>? hint;

  CustomizedTextField(
      {this.icon,
      this.validatorCallBack,
      required this.controller,
      required this.name,
      this.obscureText = false,
      this.maxLine = 1,
      this.hint,
      Key? key})
      : super(key: key);

  var border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(width: 0, color: Res.dGrayColor.withOpacity(0.5)),
  );
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorHeight: 20,
        validator: validatorCallBack,
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.next,
        obscureText: obscureText,
        autofillHints: hint,
        maxLines: maxLine,
        onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
        style: TextStyle(
          fontSize: Res.TextFontSize,
          color: Res.dGrayColor,
        ),
        cursorColor: Res.dGrayColor,
        decoration: InputDecoration(

            ///TODO: find another way if icon is null
            iconColor: Res.dGrayColor,
            prefixIcon: icon != null ? icon : Text(""),
            contentPadding: const EdgeInsets.only(left: 35, right: 35),
            hintText: name,
            hintStyle: TextStyle(
                color: Res.dGrayColor,
                fontSize: 16,
                fontWeight: FontWeight.w500),
            focusedBorder: border,
            // border: border,
            enabledBorder: border,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(width: 1.0, color: Res.sPrimaryColor),
            )));
  }
}
