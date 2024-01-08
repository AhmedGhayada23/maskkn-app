class MyAdsModel {
  int? id;
  String? titleEn;
  String? titleAr;
  String? url3D;
  dynamic url360;
  String? descriptionEn;
  String? descriptionAr;
  String? slug;
  String? locationLong;
  String? locationLat;
  int? countryId;
  int? stateId;
  int? sectorId;
  int? sectorDetailId;
  int? area;
  int? parking;
  dynamic laundryRoom;
  dynamic maidRoom;
  int? numberBathrooms;
  int? yearBuilt;
  int? numberRooms;
  int? cityId;
  int? numberBedrooms;
  dynamic numberBeds;
  int? buildingSize;
  dynamic videoType;
  dynamic videoUrl;
  int? landingSize;
  int? square;
  int? isFeatured;
  int? autoRenew;
  int? isSale;
  dynamic salePrice;
  int? isRent;
  int? rentPrice;
  int? neverExpired;
  String? rentPeriod;
  dynamic numberFloors;
  String? listingStatus;
  String? expireDate;
  int? userId;
  int? isOffPlan;
  dynamic buildingCompleted;
  String? createdAt;
  String? updatedAt;
  int? financeMonths;
  String? small;
  String? medium;
  String? createdTime;
  String? updatedTime;
  int? views;
  int? lastHourViews;
  int? clicks;
  User? user;
  List<Features>? features;
  List<Media1>? media;

  MyAdsModel(
      {this.id,
      this.titleEn,
      this.titleAr,
      this.url3D,
      this.url360,
      this.descriptionEn,
      this.descriptionAr,
      this.slug,
      this.locationLong,
      this.locationLat,
      this.countryId,
      this.stateId,
      this.sectorId,
      this.sectorDetailId,
      this.area,
      this.parking,
      this.laundryRoom,
      this.maidRoom,
      this.numberBathrooms,
      this.yearBuilt,
      this.numberRooms,
      this.cityId,
      this.numberBedrooms,
      this.numberBeds,
      this.buildingSize,
      this.videoType,
      this.videoUrl,
      this.landingSize,
      this.square,
      this.isFeatured,
      this.autoRenew,
      this.isSale,
      this.salePrice,
      this.isRent,
      this.rentPrice,
      this.neverExpired,
      this.rentPeriod,
      this.numberFloors,
      this.listingStatus,
      this.expireDate,
      this.userId,
      this.isOffPlan,
      this.buildingCompleted,
      this.createdAt,
      this.updatedAt,
      this.financeMonths,
      this.small,
      this.medium,
      this.createdTime,
      this.updatedTime,
      this.views,
      this.lastHourViews,
      this.clicks,
      this.user,
      this.features,
      this.media});

  MyAdsModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["title_en"] is String) {
      titleEn = json["title_en"];
    }
    if (json["title_ar"] is String) {
      titleAr = json["title_ar"];
    }
    if (json["url_3d"] is String) {
      url3D = json["url_3d"];
    }
    url360 = json["url_360"];
    if (json["description_en"] is String) {
      descriptionEn = json["description_en"];
    }
    if (json["description_ar"] is String) {
      descriptionAr = json["description_ar"];
    }
    if (json["slug"] is String) {
      slug = json["slug"];
    }
    if (json["location_long"] is String) {
      locationLong = json["location_long"];
    }
    if (json["location_lat"] is String) {
      locationLat = json["location_lat"];
    }
    if (json["country_id"] is int) {
      countryId = json["country_id"];
    }
    if (json["state_id"] is int) {
      stateId = json["state_id"];
    }
    if (json["sector_id"] is int) {
      sectorId = json["sector_id"];
    }
    if (json["sector_detail_id"] is int) {
      sectorDetailId = json["sector_detail_id"];
    }
    if (json["area"] is int) {
      area = json["area"];
    }
    if (json["parking"] is int) {
      parking = json["parking"];
    }
    laundryRoom = json["laundry_room"];
    maidRoom = json["maid_room"];
    if (json["number_bathrooms"] is int) {
      numberBathrooms = json["number_bathrooms"];
    }
    if (json["year_built"] is int) {
      yearBuilt = json["year_built"];
    }
    if (json["number_rooms"] is int) {
      numberRooms = json["number_rooms"];
    }
    if (json["city_id"] is int) {
      cityId = json["city_id"];
    }
    if (json["number_bedrooms"] is int) {
      numberBedrooms = json["number_bedrooms"];
    }
    numberBeds = json["number_beds"];
    if (json["building_size"] is int) {
      buildingSize = json["building_size"];
    }
    videoType = json["video_type"];
    videoUrl = json["video_url"];
    if (json["landing_size"] is int) {
      landingSize = json["landing_size"];
    }
    if (json["square"] is int) {
      square = json["square"];
    }
    if (json["is_featured"] is int) {
      isFeatured = json["is_featured"];
    }
    if (json["auto_renew"] is int) {
      autoRenew = json["auto_renew"];
    }
    if (json["is_sale"] is int) {
      isSale = json["is_sale"];
    }
    salePrice = json["sale_price"];
    if (json["is_rent"] is int) {
      isRent = json["is_rent"];
    }
    if (json["rent_price"] is int) {
      rentPrice = json["rent_price"];
    }
    if (json["never_expired"] is int) {
      neverExpired = json["never_expired"];
    }
    if (json["rent_period"] is String) {
      rentPeriod = json["rent_period"];
    }
    numberFloors = json["number_floors"];
    if (json["listing_status"] is String) {
      listingStatus = json["listing_status"];
    }
    if (json["expire_date"] is String) {
      expireDate = json["expire_date"];
    }
    if (json["user_id"] is int) {
      userId = json["user_id"];
    }
    if (json["is_off_plan"] is int) {
      isOffPlan = json["is_off_plan"];
    }
    buildingCompleted = json["building_completed"];
    if (json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if (json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    if (json["finance_months"] is int) {
      financeMonths = json["finance_months"];
    }
    if (json["small"] is String) {
      small = json["small"];
    }
    if (json["medium"] is String) {
      medium = json["medium"];
    }
    if (json["created_time"] is String) {
      createdTime = json["created_time"];
    }
    if (json["updated_time"] is String) {
      updatedTime = json["updated_time"];
    }
    if (json["views"] is int) {
      views = json["views"];
    }
    if (json["last_hour_views"] is int) {
      lastHourViews = json["last_hour_views"];
    }
    if (json["clicks"] is int) {
      clicks = json["clicks"];
    }
    if (json["user"] is Map) {
      user = json["user"] == null ? null : User.fromJson(json["user"]);
    }
    if (json["features"] is List) {
      features = json["features"] == null
          ? null
          : (json["features"] as List)
              .map((e) => Features.fromJson(e))
              .toList();
    }
    if (json["media"] is List) {
      media = json["media"] == null
          ? null
          : (json["media"] as List).map((e) => Media1.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title_en"] = titleEn;
    _data["title_ar"] = titleAr;
    _data["url_3d"] = url3D;
    _data["url_360"] = url360;
    _data["description_en"] = descriptionEn;
    _data["description_ar"] = descriptionAr;
    _data["slug"] = slug;
    _data["location_long"] = locationLong;
    _data["location_lat"] = locationLat;
    _data["country_id"] = countryId;
    _data["state_id"] = stateId;
    _data["sector_id"] = sectorId;
    _data["sector_detail_id"] = sectorDetailId;
    _data["area"] = area;
    _data["parking"] = parking;
    _data["laundry_room"] = laundryRoom;
    _data["maid_room"] = maidRoom;
    _data["number_bathrooms"] = numberBathrooms;
    _data["year_built"] = yearBuilt;
    _data["number_rooms"] = numberRooms;
    _data["city_id"] = cityId;
    _data["number_bedrooms"] = numberBedrooms;
    _data["number_beds"] = numberBeds;
    _data["building_size"] = buildingSize;
    _data["video_type"] = videoType;
    _data["video_url"] = videoUrl;
    _data["landing_size"] = landingSize;
    _data["square"] = square;
    _data["is_featured"] = isFeatured;
    _data["auto_renew"] = autoRenew;
    _data["is_sale"] = isSale;
    _data["sale_price"] = salePrice;
    _data["is_rent"] = isRent;
    _data["rent_price"] = rentPrice;
    _data["never_expired"] = neverExpired;
    _data["rent_period"] = rentPeriod;
    _data["number_floors"] = numberFloors;
    _data["listing_status"] = listingStatus;
    _data["expire_date"] = expireDate;
    _data["user_id"] = userId;
    _data["is_off_plan"] = isOffPlan;
    _data["building_completed"] = buildingCompleted;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["finance_months"] = financeMonths;
    _data["small"] = small;
    _data["medium"] = medium;
    _data["created_time"] = createdTime;
    _data["updated_time"] = updatedTime;
    _data["views"] = views;
    _data["last_hour_views"] = lastHourViews;
    _data["clicks"] = clicks;
    if (user != null) {
      _data["user"] = user?.toJson();
    }
    if (features != null) {
      _data["features"] = features?.map((e) => e.toJson()).toList();
    }
    if (media != null) {
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
  List<dynamic>? responsiveImages;
  int? orderColumn;
  String? createdAt;
  String? updatedAt;
  String? originalUrl;
  String? previewUrl;

  Media1(
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
      this.responsiveImages,
      this.orderColumn,
      this.createdAt,
      this.updatedAt,
      this.originalUrl,
      this.previewUrl});

  Media1.fromJson(Map<String, dynamic> json) {
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

class User {
  int? id;
  String? name;
  String? avatar;
  String? role;
  dynamic activePackage;
  dynamic billing;
  int? totalPaid;
  List<dynamic>? media;

  User(
      {this.id,
      this.name,
      this.avatar,
      this.role,
      this.activePackage,
      this.billing,
      this.totalPaid,
      this.media});

  User.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["avatar"] is String) {
      avatar = json["avatar"];
    }
    if (json["role"] is String) {
      role = json["role"];
    }
    activePackage = json["active_package"];
    billing = json["billing"];
    if (json["total_paid"] is int) {
      totalPaid = json["total_paid"];
    }
    if (json["media"] is List) {
      media = json["media"] ?? [];
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
    if (media != null) {
      _data["media"] = media;
    }
    return _data;
  }
}

class Features {
  int? id;

  Features({this.id});

  Features.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    return _data;
  }
}
