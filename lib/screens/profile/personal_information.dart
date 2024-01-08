import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:maskkn/models/profile.dart';
import 'package:maskkn/network-services/profile.dart';
import 'package:maskkn/screens/authorization_screens/components/customized_text_field.dart';
import 'package:maskkn/screens/main-page/main-page.dart';
import 'package:maskkn/screens/profile/user_profile.dart';
import 'package:maskkn/services/authentication/validation.dart';

import '../../appConfig.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  bool editName = false;
  bool editMobile = false;
  bool editEmail = false;
  Color EditColor = Res.dGrayColor.withOpacity(0.5);
  Color IconColor = Res.kPrimaryColor;
  String countryDial = "+968";
  bool isProcessing = false;
  TextEditingController nameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Profile? profile;
  File? image;
  XFile? _pickedFile;
  final _picker = ImagePicker();
  void getImageGallery() async {
    _pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (_pickedFile != null) {
      image = File(_pickedFile!.path);
      setState(() {});
    }
  }

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
    nameTextController = TextEditingController(text: '${profile?.name ?? ''}');
    emailTextController =
        TextEditingController(text: '${profile?.email ?? ''}');
    phoneController = TextEditingController(text: '${profile?.phone ?? ''}');
    descriptionController =
        TextEditingController(text: '${profile?.description ?? ''}');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Res.blackColor,
          onPressed: () {
            // Navigator.of(context).pop();
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) => MyProfile()),
            // );
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage(
                          selectedIndex: 3,
                        )));
          },
        ),
        title: Text(
          localizations.personalInfo,
          style: TextStyle(color: Res.blackColor),
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: Icon(Icons.done, color: Res.kPrimaryColor))
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 10,
            ),
            Center(
                child: Stack(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Res.whiteColor),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Res.blackColor.withOpacity(0.1),
                            offset: const Offset(0, 10))
                      ],
                      shape: BoxShape.circle,
                      image: image != null
                          ? DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(image!),
                            )
                          : DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  profile?.media?[0].original_url ?? ''),
                            )),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Res.whiteColor.withOpacity(0.85),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                          onPressed: () {
                            getImageGallery();
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Res.kPrimaryColor,
                          ))),
                )
              ],
            )),
            const SizedBox(
              height: 10,
            ),

            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 25,
                      color: Res.kPrimaryColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      localizations.name,
                      style: const TextStyle(fontSize: Res.SubTitleFontSize),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: Res.kPrimaryColor,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 0.0, right: 0),
                    child: CustomizedTextField(
                      controller: nameTextController,
                      validatorCallBack: Validator.validateName,
                      name: localizations.name,
                    )),
              ],
            ),

            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.call_outlined,
                      size: 25,
                      color: Res.kPrimaryColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      localizations.mobileNum,
                      style: const TextStyle(fontSize: Res.SubTitleFontSize),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: Res.kPrimaryColor,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                IntlPhoneField(
                  controller: phoneController,
                  dropdownTextStyle: TextStyle(
                    fontSize: Res.TextFontSize,
                    color: Res.dGrayColor,
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  cursorColor: Res.dGrayColor,
                  cursorHeight: 25,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Res.dGrayColor, letterSpacing: 2),
                  dropdownIcon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Res.dGrayColor,
                  ),
                  showCountryFlag: false,
                  showDropdownIcon: false,
                  dropdownIconPosition: IconPosition.trailing,
                  dropdownDecoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                          width: .5, color: Res.dGrayColor.withOpacity(0.4)),
                    ),
                  ),
                  initialValue: countryDial,
                  onCountryChanged: (country) {
                    setState(() {
                      countryDial = "+" + country.dialCode;
                    });
                  },
                  decoration: InputDecoration(
                    prefixText: "  ",
                    hintText: localizations.yourPhoneNum,
                    // errorText: localizations.errorPhone,
                    iconColor: Res.dGrayColor,
                    contentPadding: const EdgeInsets.only(left: 50, right: 50),
                    focusColor: Res.lGrayColor,
                    hintStyle: TextStyle(
                        color: Res.dGrayColor, fontSize: Res.TextFontSize),
                    focusedBorder: border,
                    focusedErrorBorder: border,
                    enabledBorder: border,
                    errorBorder: border,
                  ),
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.email_outlined,
                      size: 25,
                      color: Res.kPrimaryColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      localizations.emailField,
                      style: const TextStyle(fontSize: Res.SubTitleFontSize),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: Res.kPrimaryColor,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomizedTextField(
                  controller: emailTextController,
                  validatorCallBack: Validator.validateEmail,
                  name: localizations.emailField,
                )
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.note,
                      size: 25,
                      color: Res.kPrimaryColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      localizations.description,
                      style: const TextStyle(fontSize: Res.SubTitleFontSize),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: Res.kPrimaryColor,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomizedTextField(
                  maxLine: 6,
                  controller: descriptionController,
                  validatorCallBack: Validator.validateEmail,
                  name: localizations.description,
                )
              ],
            ),

            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 45),
                  backgroundColor: Res.kPrimaryColor,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  isProcessing ? 'Save in processing...' : 'Save',
                  style: TextStyle(
                    fontSize: 18,
                    color: Res.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  setState(() {
                    isProcessing = true;
                  });
                  var req = await ProfileApi().editProfile(
                      profile?.email != emailTextController.text
                          ? emailTextController.text
                          : '',
                      nameTextController.text,
                      profile?.phone != int.parse(phoneController.text)
                          ? phoneController.text
                          : '',
                      descriptionController.text,
                      image);
                  var jsonData = json.decode(req.body);
                  print(jsonData['description']);
                  if (req.statusCode == 200) {
                    isProcessing = false;
                    Profile profileData = await ProfileApi().getUserInfo();
                    profile = profileData;
                    setState(() {});

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(jsonData['description'])),
                    );
                  } else {
                    isProcessing = false;
                    Profile profileData = await ProfileApi().getUserInfo();
                    profile = profileData;
                    setState(() {});
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(jsonData['description'])),
                    );
                    setState(() {});
                  }
                }
                // },
                ),
            /* Row(
              children: [
                Icon(
                  Icons.lock_open,
                  size: 25,
                  color:Res.kPrimaryColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "change password",
                  style: TextStyle(fontSize: Res.SubTitleFontSize),
                ),
                const Spacer(),

               // const EditableText()
              ],
            ),*/

            //EditableText()
          ]),
        ),
      ),
    );
  }
}

class EditableText extends StatelessWidget {
  EditableText({Key? key, required this.text, required this.readonly})
      : super(key: key);

  String text;
  bool readonly;
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: TextField(
              controller: controller,
              maxLines: 1,
              readOnly: readonly,
              cursorColor: Res.kPrimaryColor,
              style: const TextStyle(fontFamily: "Sf pro"),
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1.5, color: Res.dGrayColor.withOpacity(0.5))),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Res.whiteColor)),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Res.lGrayColor)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Res.lGrayColor)),
                filled: true,
                fillColor: Colors.transparent,
                hintText: text,
                hintStyle:
                    TextStyle(fontFamily: "Sf pro", color: Res.dGrayColor),
              )),
        ),
      ],
    );
  }
}

var border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: BorderSide(width: 0, color: Res.dGrayColor.withOpacity(0.5)),
);
