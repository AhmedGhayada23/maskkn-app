import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maskkn/appConfig.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoView extends StatefulWidget {
  String image;
  PhotoView({required this.image, super.key});

  @override
  State<PhotoView> createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Res.blackColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Res.blackColor,
        actions: [],
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: PhotoViewGallery(
              pageOptions: [
                PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(widget.image),
                  //  heroAttributes: const HeroAttributes(tag: "tag1"),
                ),
              ],
              loadingBuilder: (context, progress) => Center(
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  child: CircularProgressIndicator(),
                ),
              ),

              // builder: (context, index) => PhotoViewGalleryPageOptions.customChild(
              //   child: CachedNetworkImage(
              //     imageUrl: '${Constants.httpImage}${Get.find<HomeController>().galleryData[index].image}',
              //     placeholder: (context, url) => Container(
              //       color: Colors.grey,
              //     ),
              //     errorWidget: (context, url, error) => Container(
              //       color: Colors.red.shade400,
              //     ),
              //   ),
              //   minScale: PhotoViewComputedScale.covered,

              // ),
              // pageController : PageController(initialPage: controller.index),
              // enableRotation: true,
            ),
          ),
        ],
      ),
    );
  }
}
