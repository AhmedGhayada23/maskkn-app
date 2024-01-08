import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../appConfig.dart';
import '../../../models/item.dart';
import 'details_icons.dart';
import '../../../AppIcons/icons.dart';

class ItemCard extends StatefulWidget {
  ItemCard(this.item, this.onTap, this.index, {Key? key}) : super(key: key);

  Item item;
  int index;
  Function()? onTap;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all( color:Res.lGrayColor
        ),
        boxShadow: [
          BoxShadow(
              blurRadius: 10, spreadRadius: 0.8, color: Colors.grey[200]!)
        ],
      ),
      child: InkWell(

        borderRadius: BorderRadius.circular(10),
        onTap: widget.onTap,
         child: Padding(
           padding: const EdgeInsets.all(8),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 width: double.infinity,
                 height: 160,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(8),
                   color: Colors.grey.shade200,
                   image: DecorationImage(
                     image: AssetImage(widget.item.image_url!),
                     fit: BoxFit.cover,
                     ),
                   ),
                 child: Stack(
                   children: [
                     Align(
                       alignment: Alignment.topLeft,
                       child: Padding(
                         padding:
                         const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                         child: Container(
                           padding:
                           const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                           decoration: const BoxDecoration(color: Colors.red),
                           child: const Text(
                             'Sell',
                             style: TextStyle(color: Colors.white),
                           ),
                         ),
                       ),
                     ),
                     Align(
                       alignment: Alignment.topRight,
                       child: Padding(
                         padding:
                         const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                         child: Container(
                           padding:
                           const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                           decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               boxShadow:[
                                 BoxShadow(
                                   color: Res.kPrimaryColor
                                       .withOpacity(0.5),
                                 blurRadius: 5
                               ),]
                             ),
                           child:IconButton(
                             icon:  Icon(
                               widget.item.favorited == false?
                               Icons.favorite_border: Icons.favorite,
                               color: Colors.white,
                               size: 25,
                             ),
                             onPressed: (){
                               if (widget.item.favorited == false){
                                 setState(() {
                                   widget.item.favorited = true;
                                 });
                               }else{
                                 setState(() {
                                   widget.item.favorited = false;
                                 });
                               }
                             },
                           )
                         ),
                       ),
                     ),
                     Align(
                       alignment: Alignment.bottomRight,
                       child: Padding(
                         padding:
                         const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                         child: Container(

                           padding:
                           const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(5),
                             color: Res.kPrimaryColor,),
                           child: const Text.rich(TextSpan(
                               text: '55',
                               style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   fontSize: 16,
                                   color: Colors.white),
                               children: [
                                 TextSpan(
                                     text: ' OMR',
                                     style: TextStyle(
                                         fontWeight: FontWeight.bold,
                                         fontSize: Res.SubTextFontSize,
                                         color: Colors.white),
                                     children: [])
                               ])),
                         ),
                       ),
                     ),
                  /*   Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         SizedBox(
                           width: 22,
                           height: 22,
                           child: ElevatedButton(onPressed: (){},
                               child: Icon(Icons.favorite_border,color: Res.whiteColor,size: 18,),
                               style: ElevatedButton.styleFrom(
                                 foregroundColor: Res.whiteColor, backgroundColor: Res.kPrimaryColor.withOpacity(0.6), elevation: 0,
                                 shape: CircleBorder(),
                                 padding: EdgeInsets.all(3), // <-- Splash color
                               ),
                           ),
                         ),
                         Container(
                           margin: const EdgeInsets.all(16),
                           padding:  const EdgeInsets.all(3),
                           decoration: BoxDecoration(
                             border: Border.all(color: Res.sPrimaryColor),
                             color: Res.sPrimaryColor
                           ),
                           child: Text(widget.item.category!, style: const TextStyle(
                               color: Colors.white,
                           fontSize:  Res.SubTextFontSize,)
                             ,),
                         )
                       ],
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [

                         Container(
                           margin: const EdgeInsets.all(16),
                           padding:  const EdgeInsets.all(3),
                           decoration: BoxDecoration(
                               border: Border.all(color: Res.kPrimaryColor),
                               color: Res.kPrimaryColor
                           ),
                           child: Text(widget.item.price.toString() + " "+ localizations.oMR, style: const TextStyle(
                               color: Colors.white,
                               fontSize:  Res.SubTextFontSize,)
                             ,),
                         ),
                        */
                     /* Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           mainAxisSize: MainAxisSize.min,
                           children: [
                             Text(widget.item.image_num.toString(),style: TextStyle(
                               fontSize: Res.SubTextFontSize,
                               color: Res.whiteColor
                             ),),
                             IconButton(onPressed: (){},
                               icon: Icon(Icons.image_outlined, size: 20,),
                               color: Res.whiteColor,
                             ),
                             IconButton(onPressed: (){},
                               icon: Icon(CustomizedIcons.mskn_app_icon_3d_01, size: 30,),
                               color: Res.whiteColor,
                             ),

                           ],
                         ),*//*
                       ],
                     ),*/
                     Align(
                       alignment: Alignment.bottomLeft,
                       child: Padding(
                         child: Row(
                           mainAxisSize: MainAxisSize.min,
                           children: [
                           Icon(Icons.photo_library_outlined, color: Res.whiteColor,
                           size: 20,),
                             const SizedBox(
                               width: 4,
                             ),
                             const Text(
                               '7',
                               style: TextStyle(color: Colors.white),
                             )
                           ],
                         ),
                         padding:
                         const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                       ),
                     ),
                   ],
                 )
                 ),
               const SizedBox(
                 height: 10,
               ),
               Text(widget.item.category!,style: TextStyle(
                 color: Res.kPrimaryColor,

               ),),
               Row(
                 children: [
                   Icon(Icons.location_on_outlined,color: Res.dGrayColor,),
                   Text(widget.item.location!)
                 ],
               ),
               Row(
                   children: [
                     DetialedIcon(size: 35,

                       icon: CustomizedIcons.mskn_app_icon_bed,
                       number: widget.item.bathroom_num.toString(),
                       unit: "",
                     ),
                     Expanded(
                       flex: 1,
                       child: DetialedIcon(
                         size: 35,
                         icon: CustomizedIcons.mskn_app_icon_bathroom,
                         number: widget.item.room_num.toString(),
                         unit: "",
                       ),
                     ),
                     DetialedIcon(
                       size: 35,
                       icon: CustomizedIcons.mskn_app_icon_land_size,
                       number: widget.item.building_space.toString(),
                       unit: "Sqm",
                     ),
                     DetialedIcon(
                       size: 35,
                       icon: CustomizedIcons.mskn_app_icon_building_size,
                       number: widget.item.land_space.toString(),
                       unit: "Sqm",
                     ),
                   ],
               )
             ],
           ),
         ),
      ),
    );
  }
}
