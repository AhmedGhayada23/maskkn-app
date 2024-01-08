import 'dart:io';

import 'package:image_picker/image_picker.dart';

class MediaProvider{
  static final ImagePicker _picker = ImagePicker();
  static Future<XFile?> getImageFromGallery() async{
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery,maxWidth: 720,maxHeight: 1280);
    return image;
  }
  static Future<XFile?> getImageFromCamera() async{
    final XFile? image = await _picker.pickImage(source: ImageSource.camera,maxWidth: 720, maxHeight: 1280);
    return image;
  } 
  static Future<XFile?> getVideoFromGallery() async{
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    return video;
  }
  static Future<XFile?> getVideoFromCamera() async{
    final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
    return video;
  }

}