import 'dart:convert';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maskkn/network-services/my_ads.dart';
import 'package:maskkn/providers/list_property_provider.dart';
import 'package:maskkn/screens/service-screens/add_property/upload_file_widget.dart';
import 'package:provider/provider.dart';
import '../../appConfig.dart';
import '../../services/dataUtils/mediaUtils.dart';
import '../../services/media_picker_functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../main-page/main-page.dart';

class UpdatePropertyStepFour extends StatefulWidget {
  const UpdatePropertyStepFour({super.key});

  @override
  State<UpdatePropertyStepFour> createState() => _UpdatePropertyStepFourState();
}

class _UpdatePropertyStepFourState extends State<UpdatePropertyStepFour> {
  File? image;
  XFile? _pickedFile;
  final _picker = ImagePicker();
  List<File> imagePaths = [];
  void getImageGallery() async {
    _pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (_pickedFile != null) {
      image = File(_pickedFile!.path);
      imagePaths.add(image!);

      setState(() {});
      print(imagePaths);
      // uploadImage();
      // selectedImagePath.value = image!.path.split('/').last.toString();
      // final bytes = File(_pickedFile!.path).readAsBytesSync();
      // log(image!.path.split('/').last.runtimeType.toString());
      // log('uplode  : ${_pickedFile.toString()}');
      // log('uplode Image : ${image.toString()}');

      // checkUplodeImageData();
    }
  }

  TextEditingController tourController = TextEditingController();
  OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Res.grey200!, width: 0.5));

  String landPlan = "";
  String buildingPlan = "";

  @override
  Widget build(BuildContext context) {
    final ARProvider = Provider.of<ListPropertyProvider>(context);
    AppLocalizations localizations = AppLocalizations.of(context)!;
    AdsApi adsApi = AdsApi();
    //alart widget
    showAlertDialog(BuildContext context) {
      bool value = false;
      // set up the buttons
      Widget cancelButton = TextButton(
        child: Text(localizations.cancel),
        onPressed: () {
          //  value == false;
        },
      );
      Widget continueButton = TextButton(
        child: Text(localizations.continueb),
        onPressed: () {
          // value == true;
        },
      );
      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text(localizations.confirm),
        content: Text(localizations.confirmAddProperty),
        actions: [
          cancelButton,
          continueButton,
        ],
      );
      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );

      //  return value;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          color: Res.blackColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          localizations.addProperty,
          style: TextStyle(
              color: Res.blackColor,
              fontSize: Res.SubTitleFontSize,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${localizations.stepNum} 4 / 4",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              LinearProgressIndicator(
                backgroundColor: Res.grey200,
                value: 4 / 4,
                valueColor:
                    AlwaysStoppedAnimation(Res.kPrimaryColor.withOpacity(0.3)),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                localizations.uploadImg,
                style: const TextStyle(fontSize: Res.SubTitleFontSize),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.20,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Res.grey200!)),
                child: imagePaths.isEmpty && ARProvider.photosUrl.isEmpty
                    ? InkWell(
                        onTap: () async {
                          getImageGallery();
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Center(
                            child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Res.kPrimaryColor.withOpacity(0.2),
                              child: Icon(
                                Icons.photo,
                                color: Res.kPrimaryColor,
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              localizations.uploadFile,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              localizations.upload4,
                              style: TextStyle(
                                  fontSize: Res.SubTextFontSize,
                                  color: Res.dGrayColor.withOpacity(0.6)),
                            )
                          ],
                        )),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Wrap(spacing: 5, runSpacing: 0, children: [
                            for (int i = 0;
                                i < ARProvider.photosUrl.length;
                                i++)
                              PhotoUrlWidget(
                                path: ARProvider.photosUrl[i].toString(),
                                onDelete: () {
                                  ARProvider.photosUrl.removeAt(i);
                                  setState(() {});
                                },
                              ),
                            for (int i = 0; i < imagePaths.length; i++)
                              PhotoWidget(
                                path: imagePaths[i],
                                onDelete: () {
                                  imagePaths.removeAt(i);
                                  setState(() {});
                                },
                              ),
                            for (int i = 0; i < 4 - imagePaths.length; i++)
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Stack(
                                  children: [
                                    Center(
                                      child: SizedBox(
                                        height: 75,
                                        width: 85,
                                        child: DottedBorder(
                                          color: Res.grey200!,
                                          radius: const Radius.circular(5),
                                          borderType: BorderType.RRect,
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            onTap: () async {
                                              getImageGallery();
                                            },
                                            child: Center(
                                              child: CircleAvatar(
                                                radius: 12,
                                                backgroundColor:
                                                    Res.kPrimaryColor,
                                                child: Center(
                                                    child: Icon(
                                                  Icons.add,
                                                  color: Res.kPrimaryColor,
                                                  size: 18,
                                                )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ]),
                        ),
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                localizations.add3DLink,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Res.SubTitleFontSize),
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer<ListPropertyProvider>(
                builder: (context, value, child) {
                  tourController = TextEditingController(text: value.tourLink);
                  return TextFormField(
                    controller: tourController,
                    maxLines: 1,
                    cursorColor: Res.dGrayColor,
                    decoration: InputDecoration(
                        hintText: localizations.enterTourLink,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        enabledBorder: border,
                        border: border,
                        focusedBorder: border),
                    keyboardType: TextInputType.url,
                  );
                },
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              // PlanWidget(title: localizations.landPlan),
              // const SizedBox(
              //   height: 10,
              // ),
              // PlanWidget(title: localizations.buildingPlan),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Res.kPrimaryColor,
                      elevation: 1,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        localizations.nextSt,
                        style: const TextStyle(
                          fontSize: Res.SubTitleFontSize,
                        ),
                      ),
                    ),
                    onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text(
                              localizations.confirm,
                              style: TextStyle(color: Res.kPrimaryColor),
                            ),
                            content: Text(localizations.confirmAddProperty),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  //    ARProvider.changephotos(imagePaths);
                                  print(ARProvider.photos);
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: Text(
                                  localizations.cancel,
                                  style: TextStyle(color: Res.kPrimaryColor),
                                ),
                              ),
                              TextButton(
                                  child: Text(
                                    localizations.continueb,
                                    style: TextStyle(color: Res.kPrimaryColor),
                                  ),
                                  onPressed: () async {
                                    ARProvider.changebuildingPlan(buildingPlan);
                                    ARProvider.changelandPlan(landPlan);
                                    ARProvider.changetourLink(
                                        tourController.text);
                                    ARProvider.changephotos(imagePaths);
                                    /*                  print(ARProvider.propertyTitle);
                        print(ARProvider.wilaya);
                        print(ARProvider.price);*/
                                    await adsApi.updateAds(
                                      id: ARProvider.id,
                                      title: ARProvider.propertyTitle,
                                      description: ARProvider.description,
                                      sectorId: ARProvider.propertyType,
                                      sectorDetailId: ARProvider.sectorType,
                                      stateId: ARProvider.governorate,
                                      cityId: ARProvider.wilaya,
                                      isSale: ARProvider.sellAndRent,
                                      salePrice: ARProvider.price,
                                      numberRooms:
                                          ARProvider.bedrooms.toString(),
                                      numberBathrooms:
                                          ARProvider.bathrooms.toString(),
                                      maidRoom: ARProvider.maidRoom,
                                      laundryRoom: ARProvider.laundryRoom,
                                      yearBuilt:
                                          ARProvider.builtYear.toString(),
                                      square: ARProvider.areaSize.toString(),
                                      buildingSize:
                                          ARProvider.buildingSize.toString(),
                                      context: context,
                                      ur3d: ARProvider.tourLink,
                                      featureIds: ARProvider.features,
                                      imagePaths: ARProvider.photos,
                                    );
                                    // var jsonData = json.decode(req.body);
                                    // print(req.body.toString());
                                    // print(req.request.toString());
                                    // print(req.statusCode.toString());

                                    // if (req.statusCode == 200) {
                                    //   Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //       builder: (context) => AdSuccess(),
                                    //     ),
                                    //   );
                                    // } else {

                                    //   ScaffoldMessenger.of(context)
                                    //       .showSnackBar(
                                    //     SnackBar(
                                    //         content: Text(
                                    //             req.statusCode.toString())),
                                    //   );
                                    // }
                                  }),
                            ],
                          ),
                        )
                    /*      */

                    ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PhotoWidget extends StatelessWidget {
  File path;
  Function()? onDelete;
  PhotoWidget({required this.path, this.onDelete, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 75,
              width: 85,
              child: DottedBorder(
                color: Res.grey200!,
                radius: const Radius.circular(5),
                borderType: BorderType.RRect,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.file(
                    path,
                    height: 75,
                    width: 85,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: GestureDetector(
                onTap: onDelete,
                child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red.withOpacity(0.3),
                    child: const Icon(
                      Icons.clear,
                      color: Colors.black,
                      size: 15,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PhotoUrlWidget extends StatelessWidget {
  String path;
  Function()? onDelete;
  PhotoUrlWidget({required this.path, this.onDelete, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 75,
              width: 85,
              child: DottedBorder(
                color: Res.grey200!,
                radius: const Radius.circular(5),
                borderType: BorderType.RRect,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    path,
                    height: 75,
                    width: 85,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: GestureDetector(
                onTap: onDelete,
                child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red.withOpacity(0.3),
                    child: const Icon(
                      Icons.clear,
                      color: Colors.black,
                      size: 15,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
