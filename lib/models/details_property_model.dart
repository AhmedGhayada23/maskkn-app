class DetailsPropertyModel {
  int? id;
  int? stateId;
  int? cityId;
  dynamic areaIds;
  int? sectorId;
  int? sectorDetailId;
  int? priceLow;
  int? priceHigh;
  dynamic titleEn;
  dynamic titleAr;
  String? descriptionEn;
  int? propertyRequestTypeId;
  dynamic descriptionAr;
  int? bedrooms;
  int? bathrooms;
  int? landSize;
  int? buildingSize;
  String? createdAt;
  String? updatedAt;
  List<Cities>? cities;
  List<dynamic>? areas;
  PropertyRequestType? propertyRequestType;
  State? state;
  Sector? sector;
  SectorDetail? sectorDetail;

  DetailsPropertyModel(
      {this.id,
      this.stateId,
      this.cityId,
      this.areaIds,
      this.sectorId,
      this.sectorDetailId,
      this.priceLow,
      this.priceHigh,
      this.titleEn,
      this.titleAr,
      this.descriptionEn,
      this.propertyRequestTypeId,
      this.descriptionAr,
      this.bedrooms,
      this.bathrooms,
      this.landSize,
      this.buildingSize,
      this.createdAt,
      this.updatedAt,
      this.cities,
      this.areas,
      this.propertyRequestType,
      this.state,
      this.sector,
      this.sectorDetail});

  DetailsPropertyModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["state_id"] is int) {
      stateId = json["state_id"];
    }
    if (json["city_id"] is int) {
      cityId = json["city_id"];
    }
    areaIds = json["area_ids"];
    if (json["sector_id"] is int) {
      sectorId = json["sector_id"];
    }
    if (json["sector_detail_id"] is int) {
      sectorDetailId = json["sector_detail_id"];
    }
    if (json["price_low"] is int) {
      priceLow = json["price_low"];
    }
    if (json["price_high"] is int) {
      priceHigh = json["price_high"];
    }
    titleEn = json["title_en"];
    titleAr = json["title_ar"];
    if (json["description_en"] is String) {
      descriptionEn = json["description_en"];
    }
    if (json["property_request_type_id"] is int) {
      propertyRequestTypeId = json["property_request_type_id"];
    }
    descriptionAr = json["description_ar"];
    if (json["bedrooms"] is int) {
      bedrooms = json["bedrooms"];
    }
    if (json["bathrooms"] is int) {
      bathrooms = json["bathrooms"];
    }
    if (json["land_size"] is int) {
      landSize = json["land_size"];
    }
    if (json["building_size"] is int) {
      buildingSize = json["building_size"];
    }
    if (json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if (json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    if (json["Cities"] is List) {
      cities = json["Cities"] == null
          ? null
          : (json["Cities"] as List).map((e) => Cities.fromJson(e)).toList();
    }
    if (json["Areas"] is List) {
      areas = json["Areas"] ?? [];
    }
    if (json["property_request_type"] is Map) {
      propertyRequestType = json["property_request_type"] == null
          ? null
          : PropertyRequestType.fromJson(json["property_request_type"]);
    }
    if (json["state"] is Map) {
      state = json["state"] == null ? null : State.fromJson(json["state"]);
    }
    if (json["sector"] is Map) {
      sector = json["sector"] == null ? null : Sector.fromJson(json["sector"]);
    }
    if (json["sector_detail"] is Map) {
      sectorDetail = json["sector_detail"] == null
          ? null
          : SectorDetail.fromJson(json["sector_detail"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["state_id"] = stateId;
    _data["city_id"] = cityId;
    _data["area_ids"] = areaIds;
    _data["sector_id"] = sectorId;
    _data["sector_detail_id"] = sectorDetailId;
    _data["price_low"] = priceLow;
    _data["price_high"] = priceHigh;
    _data["title_en"] = titleEn;
    _data["title_ar"] = titleAr;
    _data["description_en"] = descriptionEn;
    _data["property_request_type_id"] = propertyRequestTypeId;
    _data["description_ar"] = descriptionAr;
    _data["bedrooms"] = bedrooms;
    _data["bathrooms"] = bathrooms;
    _data["land_size"] = landSize;
    _data["building_size"] = buildingSize;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    if (cities != null) {
      _data["Cities"] = cities?.map((e) => e.toJson()).toList();
    }
    if (areas != null) {
      _data["Areas"] = areas;
    }
    if (propertyRequestType != null) {
      _data["property_request_type"] = propertyRequestType?.toJson();
    }
    if (state != null) {
      _data["state"] = state?.toJson();
    }
    if (sector != null) {
      _data["sector"] = sector?.toJson();
    }
    if (sectorDetail != null) {
      _data["sector_detail"] = sectorDetail?.toJson();
    }
    return _data;
  }
}

class SectorDetail {
  int? id;
  String? nameEn;
  String? slug;
  String? nameAr;
  int? sectorId;

  SectorDetail({this.id, this.nameEn, this.slug, this.nameAr, this.sectorId});

  SectorDetail.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name_en"] is String) {
      nameEn = json["name_en"];
    }
    if (json["slug"] is String) {
      slug = json["slug"];
    }
    if (json["name_ar"] is String) {
      nameAr = json["name_ar"];
    }
    if (json["sector_id"] is int) {
      sectorId = json["sector_id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name_en"] = nameEn;
    _data["slug"] = slug;
    _data["name_ar"] = nameAr;
    _data["sector_id"] = sectorId;
    return _data;
  }
}

class Sector {
  int? id;
  String? sectorEn;
  String? sectorAr;

  Sector({this.id, this.sectorEn, this.sectorAr});

  Sector.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["sector_en"] is String) {
      sectorEn = json["sector_en"];
    }
    if (json["sector_ar"] is String) {
      sectorAr = json["sector_ar"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["sector_en"] = sectorEn;
    _data["sector_ar"] = sectorAr;
    return _data;
  }
}

class State {
  int? id;
  String? state;
  String? stateAr;

  State({this.id, this.state, this.stateAr});

  State.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["state"] is String) {
      state = json["state"];
    }
    if (json["state_ar"] is String) {
      stateAr = json["state_ar"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["state"] = state;
    _data["state_ar"] = stateAr;
    return _data;
  }
}

class PropertyRequestType {
  int? id;
  String? slug;
  String? titleAr;
  String? titleEn;
  int? price;
  String? descriptionAr;
  String? descriptionEn;
  String? tagLineAr;
  String? tagLineEn;
  String? createdAt;
  String? updatedAt;
  String? small;
  String? medium;
  List<Media>? media;

  PropertyRequestType(
      {this.id,
      this.slug,
      this.titleAr,
      this.titleEn,
      this.price,
      this.descriptionAr,
      this.descriptionEn,
      this.tagLineAr,
      this.tagLineEn,
      this.createdAt,
      this.updatedAt,
      this.small,
      this.medium,
      this.media});

  PropertyRequestType.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["slug"] is String) {
      slug = json["slug"];
    }
    if (json["title_ar"] is String) {
      titleAr = json["title_ar"];
    }
    if (json["title_en"] is String) {
      titleEn = json["title_en"];
    }
    if (json["price"] is int) {
      price = json["price"];
    }
    if (json["description_ar"] is String) {
      descriptionAr = json["description_ar"];
    }
    if (json["description_en"] is String) {
      descriptionEn = json["description_en"];
    }
    if (json["tag_line_ar"] is String) {
      tagLineAr = json["tag_line_ar"];
    }
    if (json["tag_line_en"] is String) {
      tagLineEn = json["tag_line_en"];
    }
    if (json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if (json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    if (json["small"] is String) {
      small = json["small"];
    }
    if (json["medium"] is String) {
      medium = json["medium"];
    }
    if (json["media"] is List) {
      media = json["media"] == null
          ? null
          : (json["media"] as List).map((e) => Media.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["slug"] = slug;
    _data["title_ar"] = titleAr;
    _data["title_en"] = titleEn;
    _data["price"] = price;
    _data["description_ar"] = descriptionAr;
    _data["description_en"] = descriptionEn;
    _data["tag_line_ar"] = tagLineAr;
    _data["tag_line_en"] = tagLineEn;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["small"] = small;
    _data["medium"] = medium;
    if (media != null) {
      _data["media"] = media?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Media {
  int? id;
  String? modelType;
  int? modelId;
  String? uuid;
  String? collectionName;
  String? name;
  String? fileName;
  String? mimeType;
  String? disk;
  String? conversionsDisk;
  int? size;
  List<dynamic>? manipulations;
  List<dynamic>? customProperties;
  GeneratedConversions? generatedConversions;
  List<dynamic>? responsiveImages;
  int? orderColumn;
  String? createdAt;
  String? updatedAt;
  String? originalUrl;
  String? previewUrl;

  Media(
      {this.id,
      this.modelType,
      this.modelId,
      this.uuid,
      this.collectionName,
      this.name,
      this.fileName,
      this.mimeType,
      this.disk,
      this.conversionsDisk,
      this.size,
      this.manipulations,
      this.customProperties,
      this.generatedConversions,
      this.responsiveImages,
      this.orderColumn,
      this.createdAt,
      this.updatedAt,
      this.originalUrl,
      this.previewUrl});

  Media.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["model_type"] is String) {
      modelType = json["model_type"];
    }
    if (json["model_id"] is int) {
      modelId = json["model_id"];
    }
    if (json["uuid"] is String) {
      uuid = json["uuid"];
    }
    if (json["collection_name"] is String) {
      collectionName = json["collection_name"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["file_name"] is String) {
      fileName = json["file_name"];
    }
    if (json["mime_type"] is String) {
      mimeType = json["mime_type"];
    }
    if (json["disk"] is String) {
      disk = json["disk"];
    }
    if (json["conversions_disk"] is String) {
      conversionsDisk = json["conversions_disk"];
    }
    if (json["size"] is int) {
      size = json["size"];
    }
    if (json["manipulations"] is List) {
      manipulations = json["manipulations"] ?? [];
    }
    if (json["custom_properties"] is List) {
      customProperties = json["custom_properties"] ?? [];
    }
    if (json["generated_conversions"] is Map) {
      generatedConversions = json["generated_conversions"] == null
          ? null
          : GeneratedConversions.fromJson(json["generated_conversions"]);
    }
    if (json["responsive_images"] is List) {
      responsiveImages = json["responsive_images"] ?? [];
    }
    if (json["order_column"] is int) {
      orderColumn = json["order_column"];
    }
    if (json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if (json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    if (json["original_url"] is String) {
      originalUrl = json["original_url"];
    }
    if (json["preview_url"] is String) {
      previewUrl = json["preview_url"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["model_type"] = modelType;
    _data["model_id"] = modelId;
    _data["uuid"] = uuid;
    _data["collection_name"] = collectionName;
    _data["name"] = name;
    _data["file_name"] = fileName;
    _data["mime_type"] = mimeType;
    _data["disk"] = disk;
    _data["conversions_disk"] = conversionsDisk;
    _data["size"] = size;
    if (manipulations != null) {
      _data["manipulations"] = manipulations;
    }
    if (customProperties != null) {
      _data["custom_properties"] = customProperties;
    }
    if (generatedConversions != null) {
      _data["generated_conversions"] = generatedConversions?.toJson();
    }
    if (responsiveImages != null) {
      _data["responsive_images"] = responsiveImages;
    }
    _data["order_column"] = orderColumn;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["original_url"] = originalUrl;
    _data["preview_url"] = previewUrl;
    return _data;
  }
}

class GeneratedConversions {
  bool? thumb;
  bool? small;
  bool? medium;
  bool? large;

  GeneratedConversions({this.thumb, this.small, this.medium, this.large});

  GeneratedConversions.fromJson(Map<String, dynamic> json) {
    if (json["thumb"] is bool) {
      thumb = json["thumb"];
    }
    if (json["small"] is bool) {
      small = json["small"];
    }
    if (json["medium"] is bool) {
      medium = json["medium"];
    }
    if (json["large"] is bool) {
      large = json["large"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["thumb"] = thumb;
    _data["small"] = small;
    _data["medium"] = medium;
    _data["large"] = large;
    return _data;
  }
}

class Cities {
  int? id;
  String? city;
  String? cityAr;

  Cities({this.id, this.city, this.cityAr});

  Cities.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["city"] is String) {
      city = json["city"];
    }
    if (json["city_ar"] is String) {
      cityAr = json["city_ar"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["city"] = city;
    _data["city_ar"] = cityAr;
    return _data;
  }
}
