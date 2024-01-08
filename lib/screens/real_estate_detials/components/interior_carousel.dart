import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maskkn/models/details_off_plan_model.dart';
import 'package:maskkn/screens/photo_view/photoView.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../appConfig.dart';

class InteriorCarouselOffPlan extends StatelessWidget {
  List<Media> assets;
  InteriorCarouselOffPlan({required this.assets});
  PageController controller = PageController(viewportFraction: 0.9);
  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size;
    return FadeInRight(
      child: Container(
        height: mSize.height * 0.29,
        width: mSize.width,
        child: Column(
          children: [
            Container(
              height: mSize.height * 0.25,
              child: PageView.builder(
                  controller: controller,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => PhotoView(
                                    image: assets[index].originalUrl!,
                                  )));
                        },
                        child: Container(
                          height: mSize.height * 0.25,
                          padding: EdgeInsets.only(right: 8),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Hero(
                                  tag: 'image',
                                  child: FadeInImage(
                                    image: assets.length == 0
                                        ? NetworkImage(
                                            "https://mskkn.com/public/website-assets/images/logo.png")
                                        : NetworkImage(
                                            assets[index].originalUrl!,
                                          ),
                                    placeholder: assets.length == 0
                                        ? NetworkImage(
                                            "https://mskkn.com/public/website-assets/images/logo.png")
                                        : NetworkImage(
                                            assets[index].originalUrl!,
                                          ),
                                    fit: BoxFit.cover,
                                    height: mSize.height * 0.25,
                                    width: mSize.width * 0.95,
                                  ),
                                ),
                              ),
                              /* Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Image.asset(
                                Res.threeDimIcPng,
                                color: Res.whiteColor,
                                height: 30,
                                width: 30,
                              ),
                            ),
                          )*/
                            ],
                          ),
                        ),
                      ),
                  itemCount: assets.length),
            ),
            SizedBox(
              height: 5,
            ),
            SmoothPageIndicator(
              controller: controller, // PageController
              count: assets.length,
              effect: WormEffect(
                  dotHeight: 7,
                  spacing: 5,
                  dotWidth: 7,
                  activeDotColor: Res.kPrimaryColor,
                  dotColor: Res.kPrimaryColor.withOpacity(0.2)),
            )
          ],
        ),
      ),
    );
  }
}


