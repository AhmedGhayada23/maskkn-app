// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_request_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyRequestData _$PropertyRequestDataFromJson(Map<String, dynamic> json) =>
    PropertyRequestData(
      listingType: json['listingType'] as int,
      governorate: json['governorate'] as String,
      wilaya: json['wilaya'] as String,
      village: json['village'] as String,
      sectorType: json['sectorType'] as String,
      propertyType: json['propertyType'] as String,
      price: (json['price'] as num).toDouble(),
      bedrooms: json['bedrooms'] as int,
      bathrooms: json['bathrooms'] as int,
      builtYearfrom: json['builtYearfrom'] as int,
      builtYearTo: json['builtYearTo'] as int,
      landSize: (json['landSize'] as num).toDouble(),
      buildingSize: (json['buildingSize'] as num).toDouble(),
      details: json['details'] as String,
    );

Map<String, dynamic> _$PropertyRequestDataToJson(
        PropertyRequestData instance) =>
    <String, dynamic>{
      'listingType': instance.listingType,
      'governorate': instance.governorate,
      'wilaya': instance.wilaya,
      'village': instance.village,
      'sectorType': instance.sectorType,
      'propertyType': instance.propertyType,
      'price': instance.price,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'builtYearfrom': instance.builtYearfrom,
      'builtYearTo': instance.builtYearTo,
      'landSize': instance.landSize,
      'buildingSize': instance.buildingSize,
      'details': instance.details,
    };
