import 'package:flutter/cupertino.dart';

import '../appConfig.dart';


class PreCacheFunctions {
  preCacheAssetImages(BuildContext context) {
    precacheImage(AssetImage(Res.logo), context);

  }
}
