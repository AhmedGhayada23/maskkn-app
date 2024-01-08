
import 'package:json_annotation/json_annotation.dart';


part 'property_request_data.g.dart';


@JsonSerializable()

class PropertyRequestData{
  int listingType;  //zero for sell & one for rent
  String governorate;
  String wilaya;
  String village;
  String sectorType;
  String propertyType;
  double price;
  int bedrooms;
  int bathrooms;
  int builtYearfrom;
  int builtYearTo;
  double landSize;
  double buildingSize;
  String details;

  PropertyRequestData({
    required this.listingType,
    required  this.governorate,
    required this.wilaya,
    required   this.village,
    required   this.sectorType,
    required  this.propertyType,
    required   this.price,
    required  this.bedrooms,
    required  this.bathrooms,
    required this.builtYearfrom,
    required  this.builtYearTo,
    required this.landSize,
    required  this.buildingSize,
    required  this.details});


  factory PropertyRequestData.fromJson(Map<String, dynamic> json) => _$PropertyRequestDataFromJson(json);


  Map<String, dynamic> toJson() => _$PropertyRequestDataToJson(this);
}