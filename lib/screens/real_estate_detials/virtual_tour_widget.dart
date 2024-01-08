// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import '../../appConfig.dart';



// class VirtualTour extends StatelessWidget {



//   @override
//   Widget build(BuildContext context) {
//     AppLocalizations localizations = AppLocalizations.of(context)!;
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 30),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Text(localizations.virtualTour,
//                 style: TextStyle(
//                     fontSize: 17, color: Res.kPrimaryColor),
//               ),
//               const Spacer(),
//               Image.asset(
//                 Res.threeDimIcPng,
//                 height: 30,
//                 width: 30,
//                 color: Res.kPrimaryColor,
//               )
//             ],
//           ),
//           const SizedBox(
//             height: 10,
//           ),

//           InkWell(
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Image.asset(
//                 Res.interior_1,
//                 height: MediaQuery.of(context).size.height * 0.3,
//                 width: MediaQuery.of(context).size.width,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             onTap: (){
//               Navigator.of(context).push(
//                 MaterialPageRoute(builder: (context)  => VirtualTourPage())
//               );
//             },
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//         ],
//       ),
//     );
//   }
// }


// class VirtualTourPage extends StatefulWidget {

//   VirtualTourPage({Key? key}) : super(key: key);

//   @override
//   State<VirtualTourPage> createState() => _VirtualTourPageState();
// }

// class _VirtualTourPageState extends State<VirtualTourPage> {
//   late final WebViewController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = WebViewController()
//       ..loadRequest(
//         Uri.parse('https://my.matterport.com/show/?m=Br3oFu35NhV'),
//       );
//   }


//   @override
//   Widget build(BuildContext context) {
//     AppLocalizations localizations = AppLocalizations.of(context)!;
//     return Scaffold(
//       appBar: AppBar(),
//       body:
//       WebView(
//         controller: controller,

//       ),
//     );
//   }
// }