class PropertyOffPlanModel {
  int? id;
  String? titleEn;
  String? titleAr;
  String? locationLong;
  String? locationLat;
  String? descriptionEn;
  String? descriptionAr;
  int? isOffPlan;
  int? countryId;
  int? stateId;
  int? sectorId;
  int? sectorDetailId;
  int? cityId;
  int? square;
  dynamic landingSize;
  dynamic buildingSize;
  int? buildingCompleted;
  int? userId;
  int? financeMonths;
  String? slug;
  String? createdAt;
  int? minPrice;
  int? maxPrice;
  String? salePercentage;
  int? typeCount;
  String? small;
  String? medium;
  String? createdTime;
  dynamic updatedTime;
  String? views;
  int? lastHourViews;
  String? clicks;
  List<Media>? media;
  User? user;

  PropertyOffPlanModel({this.id, this.titleEn, this.titleAr, this.locationLong, this.locationLat, this.descriptionEn, this.descriptionAr, this.isOffPlan, this.countryId, this.stateId, this.sectorId, this.sectorDetailId, this.cityId, this.square, this.landingSize, this.buildingSize, this.buildingCompleted, this.userId, this.financeMonths, this.slug, this.createdAt, this.minPrice, this.maxPrice, this.salePercentage, this.typeCount, this.small, this.medium, this.createdTime, this.updatedTime, this.views, this.lastHourViews, this.clicks, this.media, this.user});

  PropertyOffPlanModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["title_en"] is String) {
      titleEn = json["title_en"];
    }
    if(json["title_ar"] is String) {
      titleAr = json["title_ar"];
    }
    if(json["location_long"] is String) {
      locationLong = json["location_long"];
    }
    if(json["location_lat"] is String) {
      locationLat = json["location_lat"];
    }
    if(json["description_en"] is String) {
      descriptionEn = json["description_en"];
    }
    if(json["description_ar"] is String) {
      descriptionAr = json["description_ar"];
    }
    if(json["is_off_plan"] is int) {
      isOffPlan = json["is_off_plan"];
    }
    if(json["country_id"] is int) {
      countryId = json["country_id"];
    }
    if(json["state_id"] is int) {
      stateId = json["state_id"];
    }
    if(json["sector_id"] is int) {
      sectorId = json["sector_id"];
    }
    if(json["sector_detail_id"] is int) {
      sectorDetailId = json["sector_detail_id"];
    }
    if(json["city_id"] is int) {
      cityId = json["city_id"];
    }
    if(json["square"] is int) {
      square = json["square"];
    }
    landingSize = json["landing_size"];
    buildingSize = json["building_size"];
    if(json["building_completed"] is int) {
      buildingCompleted = json["building_completed"];
    }
    if(json["user_id"] is int) {
      userId = json["user_id"];
    }
    if(json["finance_months"] is int) {
      financeMonths = json["finance_months"];
    }
    if(json["slug"] is String) {
      slug = json["slug"];
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["min_price"] is int) {
      minPrice = json["min_price"];
    }
    if(json["max_price"] is int) {
      maxPrice = json["max_price"];
    }
    if(json["sale_percentage"] is String) {
      salePercentage = json["sale_percentage"];
    }
    if(json["type_count"] is int) {
      typeCount = json["type_count"];
    }
    if(json["small"] is String) {
      small = json["small"];
    }
    if(json["medium"] is String) {
      medium = json["medium"];
    }
    if(json["created_time"] is String) {
      createdTime = json["created_time"];
    }
    updatedTime = json["updated_time"];
    if(json["views"] is String) {
      views = json["views"];
    }
    if(json["last_hour_views"] is int) {
      lastHourViews = json["last_hour_views"];
    }
    if(json["clicks"] is String) {
      clicks = json["clicks"];
    }
    if(json["media"] is List) {
      media = json["media"] == null ? null : (json["media"] as List).map((e) => Media.fromJson(e)).toList();
    }
    if(json["user"] is Map) {
      user = json["user"] == null ? null : User.fromJson(json["user"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title_en"] = titleEn;
    _data["title_ar"] = titleAr;
    _data["location_long"] = locationLong;
    _data["location_lat"] = locationLat;
    _data["description_en"] = descriptionEn;
    _data["description_ar"] = descriptionAr;
    _data["is_off_plan"] = isOffPlan;
    _data["country_id"] = countryId;
    _data["state_id"] = stateId;
    _data["sector_id"] = sectorId;
    _data["sector_detail_id"] = sectorDetailId;
    _data["city_id"] = cityId;
    _data["square"] = square;
    _data["landing_size"] = landingSize;
    _data["building_size"] = buildingSize;
    _data["building_completed"] = buildingCompleted;
    _data["user_id"] = userId;
    _data["finance_months"] = financeMonths;
    _data["slug"] = slug;
    _data["created_at"] = createdAt;
    _data["min_price"] = minPrice;
    _data["max_price"] = maxPrice;
    _data["sale_percentage"] = salePercentage;
    _data["type_count"] = typeCount;
    _data["small"] = small;
    _data["medium"] = medium;
    _data["created_time"] = createdTime;
    _data["updated_time"] = updatedTime;
    _data["views"] = views;
    _data["last_hour_views"] = lastHourViews;
    _data["clicks"] = clicks;
    if(media != null) {
      _data["media"] = media?.map((e) => e.toJson()).toList();
    }
    if(user != null) {
      _data["user"] = user?.toJson();
    }
    return _data;
  }
}

class User {
  int? id;
  String? name;
  String? avatar;
  String? role;
  dynamic activePackage;
  dynamic billing;
  int? totalPaid;
  List<Media1>? media;

  User({this.id, this.name, this.avatar, this.role, this.activePackage, this.billing, this.totalPaid, this.media});

  User.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["avatar"] is String) {
      avatar = json["avatar"];
    }
    if(json["role"] is String) {
      role = json["role"];
    }
    activePackage = json["active_package"];
    billing = json["billing"];
    if(json["total_paid"] is int) {
      totalPaid = json["total_paid"];
    }
    if(json["media"] is List) {
      media = json["media"] == null ? null : (json["media"] as List).map((e) => Media1.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["avatar"] = avatar;
    _data["role"] = role;
    _data["active_package"] = activePackage;
    _data["billing"] = billing;
    _data["total_paid"] = totalPaid;
    if(media != null) {
      _data["media"] = media?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Media1 {
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
  GeneratedConversions1? generatedConversions;
  List<dynamic>? responsiveImages;
  int? orderColumn;
  String? createdAt;
  String? updatedAt;
  String? originalUrl;
  String? previewUrl;

  Media1({this.id, this.modelType, this.modelId, this.uuid, this.collectionName, this.name, this.fileName, this.mimeType, this.disk, this.conversionsDisk, this.size, this.manipulations, this.customProperties, this.generatedConversions, this.responsiveImages, this.orderColumn, this.createdAt, this.updatedAt, this.originalUrl, this.previewUrl});

  Media1.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["model_type"] is String) {
      modelType = json["model_type"];
    }
    if(json["model_id"] is int) {
      modelId = json["model_id"];
    }
    if(json["uuid"] is String) {
      uuid = json["uuid"];
    }
    if(json["collection_name"] is String) {
      collectionName = json["collection_name"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["file_name"] is String) {
      fileName = json["file_name"];
    }
    if(json["mime_type"] is String) {
      mimeType = json["mime_type"];
    }
    if(json["disk"] is String) {
      disk = json["disk"];
    }
    if(json["conversions_disk"] is String) {
      conversionsDisk = json["conversions_disk"];
    }
    if(json["size"] is int) {
      size = json["size"];
    }
    if(json["manipulations"] is List) {
      manipulations = json["manipulations"] ?? [];
    }
    if(json["custom_properties"] is List) {
      customProperties = json["custom_properties"] ?? [];
    }
    if(json["generated_conversions"] is Map) {
      generatedConversions = json["generated_conversions"] == null ? null : GeneratedConversions1.fromJson(json["generated_conversions"]);
    }
    if(json["responsive_images"] is List) {
      responsiveImages = json["responsive_images"] ?? [];
    }
    if(json["order_column"] is int) {
      orderColumn = json["order_column"];
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    if(json["original_url"] is String) {
      originalUrl = json["original_url"];
    }
    if(json["preview_url"] is String) {
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
    if(manipulations != null) {
      _data["manipulations"] = manipulations;
    }
    if(customProperties != null) {
      _data["custom_properties"] = customProperties;
    }
    if(generatedConversions != null) {
      _data["generated_conversions"] = generatedConversions?.toJson();
    }
    if(responsiveImages != null) {
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

class GeneratedConversions1 {
  bool? thumb;
  bool? small;
  bool? medium;
  bool? large;

  GeneratedConversions1({this.thumb, this.small, this.medium, this.large});

  GeneratedConversions1.fromJson(Map<String, dynamic> json) {
    if(json["thumb"] is bool) {
      thumb = json["thumb"];
    }
    if(json["small"] is bool) {
      small = json["small"];
    }
    if(json["medium"] is bool) {
      medium = json["medium"];
    }
    if(json["large"] is bool) {
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

  Media({this.id, this.modelType, this.modelId, this.uuid, this.collectionName, this.name, this.fileName, this.mimeType, this.disk, this.conversionsDisk, this.size, this.manipulations, this.customProperties, this.generatedConversions, this.responsiveImages, this.orderColumn, this.createdAt, this.updatedAt, this.originalUrl, this.previewUrl});

  Media.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["model_type"] is String) {
      modelType = json["model_type"];
    }
    if(json["model_id"] is int) {
      modelId = json["model_id"];
    }
    if(json["uuid"] is String) {
      uuid = json["uuid"];
    }
    if(json["collection_name"] is String) {
      collectionName = json["collection_name"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["file_name"] is String) {
      fileName = json["file_name"];
    }
    if(json["mime_type"] is String) {
      mimeType = json["mime_type"];
    }
    if(json["disk"] is String) {
      disk = json["disk"];
    }
    if(json["conversions_disk"] is String) {
      conversionsDisk = json["conversions_disk"];
    }
    if(json["size"] is int) {
      size = json["size"];
    }
    if(json["manipulations"] is List) {
      manipulations = json["manipulations"] ?? [];
    }
    if(json["custom_properties"] is List) {
      customProperties = json["custom_properties"] ?? [];
    }
    if(json["generated_conversions"] is Map) {
      generatedConversions = json["generated_conversions"] == null ? null : GeneratedConversions.fromJson(json["generated_conversions"]);
    }
    if(json["responsive_images"] is List) {
      responsiveImages = json["responsive_images"] ?? [];
    }
    if(json["order_column"] is int) {
      orderColumn = json["order_column"];
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    if(json["original_url"] is String) {
      originalUrl = json["original_url"];
    }
    if(json["preview_url"] is String) {
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
    if(manipulations != null) {
      _data["manipulations"] = manipulations;
    }
    if(customProperties != null) {
      _data["custom_properties"] = customProperties;
    }
    if(generatedConversions != null) {
      _data["generated_conversions"] = generatedConversions?.toJson();
    }
    if(responsiveImages != null) {
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
    if(json["thumb"] is bool) {
      thumb = json["thumb"];
    }
    if(json["small"] is bool) {
      small = json["small"];
    }
    if(json["medium"] is bool) {
      medium = json["medium"];
    }
    if(json["large"] is bool) {
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