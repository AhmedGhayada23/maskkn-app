import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:maskkn/appConfig.dart';

class AdMessage extends StatelessWidget {
  const AdMessage({super.key, this.ad, this.clickListener});
  final ad;
  final clickListener;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clickListener,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)),
            color: Res.whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 1,
                offset: const Offset(0, 0), // changes position of shadow
              )
            ]),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Res.whiteColor,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                
                  fit: BoxFit.fitWidth,
                  imageUrl:
                      "https://www.hepsivilla.com/upload/catalog/2385/1280/1-villa-star-776.webp",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          color: Res.kPrimaryColor,
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Villa for rent",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize:20,
                            fontFamily: "Sf Pro",
                            fontWeight: FontWeight.w600,
                            height: 1.5),
                      ),
                      Text(
                        "100K OMR",
                        style: TextStyle(
                            color: Res.kPrimaryColor,
                            fontSize:15,
                            fontFamily: "Sf Pro",
                            fontWeight: FontWeight.w600,
                            height: 1.5),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,color:Res.lGrayColor ,),
                      Text(
                        "Muscat, Seeb",
                        style: TextStyle(
                            color: Res.dGrayColor,
                            fontSize:14,
                            fontFamily: "Sf Pro",
                            fontWeight: FontWeight.w600,
                            height: 1.5),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
