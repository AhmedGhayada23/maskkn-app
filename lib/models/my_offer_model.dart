
class MyOfferModel {
  int? id;
  String? type;
  int? stateId;
  int? cityId;
  String? areaIds;
  int? sectorId;
  int? sectorDetailId;
  int? propertyRequestTypeId;
  int? userId;
  bool? confirm;
  int? priceLow;
  int? priceHigh;
  int? bedrooms;
  int? bathrooms;
  String? builtYearFrom;
  String? builtYearTo;
  int? landSize;
  int? buildingSize;
  dynamic titleEn;
  dynamic titleAr;
  String? descriptionEn;
  dynamic descriptionAr;
  int? offers;
  String? createdAt;
  String? updatedAt;
  dynamic roomTypeId;

  MyOfferModel({this.id, this.type, this.stateId, this.cityId, this.areaIds, this.sectorId, this.sectorDetailId, this.propertyRequestTypeId, this.userId, this.confirm, this.priceLow, this.priceHigh, this.bedrooms, this.bathrooms, this.builtYearFrom, this.builtYearTo, this.landSize, this.buildingSize, this.titleEn, this.titleAr, this.descriptionEn, this.descriptionAr, this.offers, this.createdAt, this.updatedAt, this.roomTypeId});

  MyOfferModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["type"] is String) {
      type = json["type"];
    }
    if(json["state_id"] is int) {
      stateId = json["state_id"];
    }
    if(json["city_id"] is int) {
      cityId = json["city_id"];
    }
    if(json["area_ids"] is String) {
      areaIds = json["area_ids"];
    }
    if(json["sector_id"] is int) {
      sectorId = json["sector_id"];
    }
    if(json["sector_detail_id"] is int) {
      sectorDetailId = json["sector_detail_id"];
    }
    if(json["property_request_type_id"] is int) {
      propertyRequestTypeId = json["property_request_type_id"];
    }
    if(json["user_id"] is int) {
      userId = json["user_id"];
    }
    if(json["confirm"] is bool) {
      confirm = json["confirm"];
    }
    if(json["price_low"] is int) {
      priceLow = json["price_low"];
    }
    if(json["price_high"] is int) {
      priceHigh = json["price_high"];
    }
    if(json["bedrooms"] is int) {
      bedrooms = json["bedrooms"];
    }
    if(json["bathrooms"] is int) {
      bathrooms = json["bathrooms"];
    }
    if(json["built_year_from"] is String) {
      builtYearFrom = json["built_year_from"];
    }
    if(json["built_year_to"] is String) {
      builtYearTo = json["built_year_to"];
    }
    if(json["land_size"] is int) {
      landSize = json["land_size"];
    }
    if(json["building_size"] is int) {
      buildingSize = json["building_size"];
    }
    titleEn = json["title_en"];
    titleAr = json["title_ar"];
    if(json["description_en"] is String) {
      descriptionEn = json["description_en"];
    }
    descriptionAr = json["description_ar"];
    if(json["offers"] is int) {
      offers = json["offers"];
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    roomTypeId = json["room_type_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["type"] = type;
    _data["state_id"] = stateId;
    _data["city_id"] = cityId;
    _data["area_ids"] = areaIds;
    _data["sector_id"] = sectorId;
    _data["sector_detail_id"] = sectorDetailId;
    _data["property_request_type_id"] = propertyRequestTypeId;
    _data["user_id"] = userId;
    _data["confirm"] = confirm;
    _data["price_low"] = priceLow;
    _data["price_high"] = priceHigh;
    _data["bedrooms"] = bedrooms;
    _data["bathrooms"] = bathrooms;
    _data["built_year_from"] = builtYearFrom;
    _data["built_year_to"] = builtYearTo;
    _data["land_size"] = landSize;
    _data["building_size"] = buildingSize;
    _data["title_en"] = titleEn;
    _data["title_ar"] = titleAr;
    _data["description_en"] = descriptionEn;
    _data["description_ar"] = descriptionAr;
    _data["offers"] = offers;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["room_type_id"] = roomTypeId;
    return _data;
  }
}