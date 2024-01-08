// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChartItem _$ChartItemFromJson(Map<String, dynamic> json) => ChartItem(
      title: json['title'] as String?,
      finance: json['finance'] as int,
      image_url: json['image_url'] as String?,
      location: json['location'] as String?,
      completedBuildingpercent: json['completedBuildingpercent'] as int?,
      sales: json['sales'] as int?,
      price: json['price'] as String?,
      image_num: json['image_num'] as int?,
      land_space: (json['land_space'] as num?)?.toDouble(),
      favorited: json['favorited'] as bool? ?? false,
      location_lat: (json['location_lat'] as num?)?.toDouble(),
      location_long: (json['location_long'] as num?)?.toDouble(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ChartItemToJson(ChartItem instance) => <String, dynamic>{
      'title': instance.title,
      'image_url': instance.image_url,
      'location': instance.location,
      'completedBuildingpercent': instance.completedBuildingpercent,
      'sales': instance.sales,
      'price': instance.price,
      'image_num': instance.image_num,
      'land_space': instance.land_space,
      'favorited': instance.favorited,
      'finance': instance.finance,
      'id': instance.id,
      'location_long': instance.location_long,
      'location_lat': instance.location_lat,
    };
