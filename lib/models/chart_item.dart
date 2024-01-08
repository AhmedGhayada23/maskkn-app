

import 'package:json_annotation/json_annotation.dart';


part 'chart_item.g.dart';

@JsonSerializable()
class ChartItem {
  String? title;
  String? image_url;
  String? location;
  int? completedBuildingpercent;
  int? sales;
  String? price;
  int?  image_num;
  double? land_space;
  bool? favorited;
  int finance;
  String? id;
  double? location_long;
  double? location_lat;

  ChartItem({
    required this.title,
    required this.finance,
    required this.image_url,
    required this.location,
    required this.completedBuildingpercent,
    required this.sales,
    required this.price,
    required this.image_num,
    required this.land_space,
    this.favorited = false,
    required this.location_lat,
    required this.location_long,
    this.id,
  });


  factory ChartItem.fromJson(Map<String, dynamic> json) => _$ChartItemFromJson(json);


  Map<String, dynamic> toJson() => _$ChartItemToJson(this);

}