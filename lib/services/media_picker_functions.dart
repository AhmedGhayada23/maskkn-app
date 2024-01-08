// import 'package:flutter/widgets.dart';
// import 'package:wechat_assets_picker/wechat_assets_picker.dart';

// import '../appConfig.dart';

// class MediaPicker {
//   static Future<List<String>> imagePicker(
//     BuildContext context, {
//     int maxCount = 10,
//     RequestType requestType = RequestType.image,
//   }) async {
//     final List<AssetEntity>? result = await AssetPicker.pickAssets(
//       context,
//       pickerConfig: AssetPickerConfig(
//           requestType: requestType,
//           gridCount: 3,
//           pageSize: 300000,
//           maxAssets: maxCount,
//           filterOptions: FilterOptionGroup(
//               videoOption: FilterOption(
//                   durationConstraint:
//                       DurationConstraint(max: Duration(seconds: 60)))),
//           themeColor: Res.kPrimaryColor),
//     );
//     if (result != null) {
//       List<String> i = [];
//       for (int v = 0; v < result.length; v++) {
//         var f = await result[v].file;
//         if (f != null) {
//           i.add(f.path);
//         }
//       }
//       return i;
//     }
//     return [];
//   }

//   static Future<List<AssetEntity>> mediaPicker(
//     BuildContext context, {
//     int maxCount = 10,
//     RequestType requestType = RequestType.common,
//   }) async {
//     final List<AssetEntity>? result = await AssetPicker.pickAssets(
//       context,
//       pickerConfig: AssetPickerConfig(
//           requestType: requestType,
//           gridCount: 3,
//           pageSize: 300000,
//           maxAssets: maxCount,
//           filterOptions: FilterOptionGroup(
//               videoOption: FilterOption(
//                   durationConstraint:
//                       DurationConstraint(max: Duration(seconds: 60)))),
//           themeColor:Res.kPrimaryColor),
//     );
//     if (result != null) {
//       return result;
//     }
//     return [];
//   }
// }
