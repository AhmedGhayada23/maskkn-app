
class Ff {
  bool? success;
  String? description;
  Content? content;

  Ff({this.success, this.description, this.content});

  Ff.fromJson(Map<String, dynamic> json) {
    if(json["success"] is bool) {
      success = json["success"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["content"] is Map) {
      content = json["content"] == null ? null : Content.fromJson(json["content"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["description"] = description;
    if(content != null) {
      _data["content"] = content?.toJson();
    }
    return _data;
  }
}

class Content {
  Data? data;

  Content({this.data});

  Content.fromJson(Map<String, dynamic> json) {
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  int? currentPage;
  List<Data1>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Data({this.currentPage, this.data, this.firstPageUrl, this.from, this.lastPage, this.lastPageUrl, this.links, this.nextPageUrl, this.path, this.perPage, this.prevPageUrl, this.to, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["current_page"] is int) {
      currentPage = json["current_page"];
    }
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => Data1.fromJson(e)).toList();
    }
    if(json["first_page_url"] is String) {
      firstPageUrl = json["first_page_url"];
    }
    if(json["from"] is int) {
      from = json["from"];
    }
    if(json["last_page"] is int) {
      lastPage = json["last_page"];
    }
    if(json["last_page_url"] is String) {
      lastPageUrl = json["last_page_url"];
    }
    if(json["links"] is List) {
      links = json["links"] == null ? null : (json["links"] as List).map((e) => Links.fromJson(e)).toList();
    }
    nextPageUrl = json["next_page_url"];
    if(json["path"] is String) {
      path = json["path"];
    }
    if(json["per_page"] is int) {
      perPage = json["per_page"];
    }
    prevPageUrl = json["prev_page_url"];
    if(json["to"] is int) {
      to = json["to"];
    }
    if(json["total"] is int) {
      total = json["total"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["current_page"] = currentPage;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["first_page_url"] = firstPageUrl;
    _data["from"] = from;
    _data["last_page"] = lastPage;
    _data["last_page_url"] = lastPageUrl;
    if(links != null) {
      _data["links"] = links?.map((e) => e.toJson()).toList();
    }
    _data["next_page_url"] = nextPageUrl;
    _data["path"] = path;
    _data["per_page"] = perPage;
    _data["prev_page_url"] = prevPageUrl;
    _data["to"] = to;
    _data["total"] = total;
    return _data;
  }
}

class Links {
  dynamic url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json["url"];
    if(json["label"] is String) {
      label = json["label"];
    }
    if(json["active"] is bool) {
      active = json["active"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url"] = url;
    _data["label"] = label;
    _data["active"] = active;
    return _data;
  }
}

class Data1 {
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
  String? large;
  String? createdTime;
  String? updatedTime;
  String? views;
  int? lastHourViews;
  int? clicks;
  User? user;
  List<Features>? features;
  List<dynamic>? media;

  Data1({this.id, this.titleEn, this.titleAr, this.url3D, this.url360, this.descriptionEn, this.descriptionAr, this.slug, this.locationLong, this.locationLat, this.countryId, this.stateId, this.sectorId, this.sectorDetailId, this.area, this.parking, this.laundryRoom, this.maidRoom, this.numberBathrooms, this.yearBuilt, this.numberRooms, this.cityId, this.numberBedrooms, this.numberBeds, this.buildingSize, this.videoType, this.videoUrl, this.landingSize, this.square, this.isFeatured, this.autoRenew, this.isSale, this.salePrice, this.isRent, this.rentPrice, this.neverExpired, this.rentPeriod, this.numberFloors, this.listingStatus, this.expireDate, this.userId, this.isOffPlan, this.buildingCompleted, this.createdAt, this.updatedAt, this.financeMonths, this.small, this.medium, this.large, this.createdTime, this.updatedTime, this.views, this.lastHourViews, this.clicks, this.user, this.features, this.media});

  Data1.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["title_en"] is String) {
      titleEn = json["title_en"];
    }
    if(json["title_ar"] is String) {
      titleAr = json["title_ar"];
    }
    if(json["url_3d"] is String) {
      url3D = json["url_3d"];
    }
    url360 = json["url_360"];
    if(json["description_en"] is String) {
      descriptionEn = json["description_en"];
    }
    if(json["description_ar"] is String) {
      descriptionAr = json["description_ar"];
    }
    if(json["slug"] is String) {
      slug = json["slug"];
    }
    if(json["location_long"] is String) {
      locationLong = json["location_long"];
    }
    if(json["location_lat"] is String) {
      locationLat = json["location_lat"];
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
    if(json["area"] is int) {
      area = json["area"];
    }
    if(json["parking"] is int) {
      parking = json["parking"];
    }
    laundryRoom = json["laundry_room"];
    maidRoom = json["maid_room"];
    if(json["number_bathrooms"] is int) {
      numberBathrooms = json["number_bathrooms"];
    }
    if(json["year_built"] is int) {
      yearBuilt = json["year_built"];
    }
    if(json["number_rooms"] is int) {
      numberRooms = json["number_rooms"];
    }
    if(json["city_id"] is int) {
      cityId = json["city_id"];
    }
    if(json["number_bedrooms"] is int) {
      numberBedrooms = json["number_bedrooms"];
    }
    numberBeds = json["number_beds"];
    if(json["building_size"] is int) {
      buildingSize = json["building_size"];
    }
    videoType = json["video_type"];
    videoUrl = json["video_url"];
    if(json["landing_size"] is int) {
      landingSize = json["landing_size"];
    }
    if(json["square"] is int) {
      square = json["square"];
    }
    if(json["is_featured"] is int) {
      isFeatured = json["is_featured"];
    }
    if(json["auto_renew"] is int) {
      autoRenew = json["auto_renew"];
    }
    if(json["is_sale"] is int) {
      isSale = json["is_sale"];
    }
    salePrice = json["sale_price"];
    if(json["is_rent"] is int) {
      isRent = json["is_rent"];
    }
    if(json["rent_price"] is int) {
      rentPrice = json["rent_price"];
    }
    if(json["never_expired"] is int) {
      neverExpired = json["never_expired"];
    }
    if(json["rent_period"] is String) {
      rentPeriod = json["rent_period"];
    }
    numberFloors = json["number_floors"];
    if(json["listing_status"] is String) {
      listingStatus = json["listing_status"];
    }
    if(json["expire_date"] is String) {
      expireDate = json["expire_date"];
    }
    if(json["user_id"] is int) {
      userId = json["user_id"];
    }
    if(json["is_off_plan"] is int) {
      isOffPlan = json["is_off_plan"];
    }
    buildingCompleted = json["building_completed"];
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    if(json["finance_months"] is int) {
      financeMonths = json["finance_months"];
    }
    if(json["small"] is String) {
      small = json["small"];
    }
    if(json["medium"] is String) {
      medium = json["medium"];
    }
    if(json["large"] is String) {
      large = json["large"];
    }
    if(json["created_time"] is String) {
      createdTime = json["created_time"];
    }
    if(json["updated_time"] is String) {
      updatedTime = json["updated_time"];
    }
    if(json["views"] is String) {
      views = json["views"];
    }
    if(json["last_hour_views"] is int) {
      lastHourViews = json["last_hour_views"];
    }
    if(json["clicks"] is int) {
      clicks = json["clicks"];
    }
    if(json["user"] is Map) {
      user = json["user"] == null ? null : User.fromJson(json["user"]);
    }
    if(json["features"] is List) {
      features = json["features"] == null ? null : (json["features"] as List).map((e) => Features.fromJson(e)).toList();
    }
    if(json["media"] is List) {
      media = json["media"] ?? [];
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
    _data["large"] = large;
    _data["created_time"] = createdTime;
    _data["updated_time"] = updatedTime;
    _data["views"] = views;
    _data["last_hour_views"] = lastHourViews;
    _data["clicks"] = clicks;
    if(user != null) {
      _data["user"] = user?.toJson();
    }
    if(features != null) {
      _data["features"] = features?.map((e) => e.toJson()).toList();
    }
    if(media != null) {
      _data["media"] = media;
    }
    return _data;
  }
}

class Features {
  int? id;

  Features({this.id});

  Features.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    return _data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  int? phone;
  dynamic emailVerifiedAt;
  String? status;
  dynamic website;
  String? description;
  int? stateId;
  int? cityId;
  dynamic googleId;
  dynamic bank;
  int? apiToken;
  int? isApprasial;
  int? isAdvertisement;
  int? isPropertyMangment;
  dynamic agencyId;
  String? createdAt;
  String? updatedAt;
  dynamic prStatesId;
  dynamic prCityId;
  dynamic prListing;
  dynamic prSectorDetails;
  dynamic prSaleStatesId;
  dynamic prSaleCityId;
  dynamic prSaleSectorDetails;
  String? avatar;
  String? role;
  ActivePackage? activePackage;
  Billing? billing;
  int? totalPaid;
  List<Media>? media;

  User({this.id, this.name, this.email, this.phone, this.emailVerifiedAt, this.status, this.website, this.description, this.stateId, this.cityId, this.googleId, this.bank, this.apiToken, this.isApprasial, this.isAdvertisement, this.isPropertyMangment, this.agencyId, this.createdAt, this.updatedAt, this.prStatesId, this.prCityId, this.prListing, this.prSectorDetails, this.prSaleStatesId, this.prSaleCityId, this.prSaleSectorDetails, this.avatar, this.role, this.activePackage, this.billing, this.totalPaid, this.media});

  User.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["phone"] is int) {
      phone = json["phone"];
    }
    emailVerifiedAt = json["email_verified_at"];
    if(json["status"] is String) {
      status = json["status"];
    }
    website = json["website"];
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["state_id"] is int) {
      stateId = json["state_id"];
    }
    if(json["city_id"] is int) {
      cityId = json["city_id"];
    }
    googleId = json["google_id"];
    bank = json["bank"];
    if(json["api_token"] is int) {
      apiToken = json["api_token"];
    }
    if(json["is_apprasial"] is int) {
      isApprasial = json["is_apprasial"];
    }
    if(json["is_advertisement"] is int) {
      isAdvertisement = json["is_advertisement"];
    }
    if(json["is_propertyMangment"] is int) {
      isPropertyMangment = json["is_propertyMangment"];
    }
    agencyId = json["agency_id"];
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    prStatesId = json["pr_states_id"];
    prCityId = json["pr_city_id"];
    prListing = json["pr_listing"];
    prSectorDetails = json["pr_sector_details"];
    prSaleStatesId = json["pr_sale_states_id"];
    prSaleCityId = json["pr_sale_city_id"];
    prSaleSectorDetails = json["pr_sale_sector_details"];
    if(json["avatar"] is String) {
      avatar = json["avatar"];
    }
    if(json["role"] is String) {
      role = json["role"];
    }
    if(json["active_package"] is Map) {
      activePackage = json["active_package"] == null ? null : ActivePackage.fromJson(json["active_package"]);
    }
    if(json["billing"] is Map) {
      billing = json["billing"] == null ? null : Billing.fromJson(json["billing"]);
    }
    if(json["total_paid"] is int) {
      totalPaid = json["total_paid"];
    }
    if(json["media"] is List) {
      media = json["media"] == null ? null : (json["media"] as List).map((e) => Media.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["phone"] = phone;
    _data["email_verified_at"] = emailVerifiedAt;
    _data["status"] = status;
    _data["website"] = website;
    _data["description"] = description;
    _data["state_id"] = stateId;
    _data["city_id"] = cityId;
    _data["google_id"] = googleId;
    _data["bank"] = bank;
    _data["api_token"] = apiToken;
    _data["is_apprasial"] = isApprasial;
    _data["is_advertisement"] = isAdvertisement;
    _data["is_propertyMangment"] = isPropertyMangment;
    _data["agency_id"] = agencyId;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["pr_states_id"] = prStatesId;
    _data["pr_city_id"] = prCityId;
    _data["pr_listing"] = prListing;
    _data["pr_sector_details"] = prSectorDetails;
    _data["pr_sale_states_id"] = prSaleStatesId;
    _data["pr_sale_city_id"] = prSaleCityId;
    _data["pr_sale_sector_details"] = prSaleSectorDetails;
    _data["avatar"] = avatar;
    _data["role"] = role;
    if(activePackage != null) {
      _data["active_package"] = activePackage?.toJson();
    }
    if(billing != null) {
      _data["billing"] = billing?.toJson();
    }
    _data["total_paid"] = totalPaid;
    if(media != null) {
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

class Billing {
  int? id;
  int? packageId;
  String? code;
  String? secret;
  int? amount;
  int? days;
  int? paymentDone;
  String? status;
  int? listingConsumed;
  String? active;
  String? paymentMethod;
  dynamic slip;
  int? userId;
  String? createdAt;
  String? updatedAt;
  int? propertyRequestId;
  String? discount;

  Billing({this.id, this.packageId, this.code, this.secret, this.amount, this.days, this.paymentDone, this.status, this.listingConsumed, this.active, this.paymentMethod, this.slip, this.userId, this.createdAt, this.updatedAt, this.propertyRequestId, this.discount});

  Billing.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["package_id"] is int) {
      packageId = json["package_id"];
    }
    if(json["code"] is String) {
      code = json["code"];
    }
    if(json["secret"] is String) {
      secret = json["secret"];
    }
    if(json["amount"] is int) {
      amount = json["amount"];
    }
    if(json["days"] is int) {
      days = json["days"];
    }
    if(json["payment_done"] is int) {
      paymentDone = json["payment_done"];
    }
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["listing_consumed"] is int) {
      listingConsumed = json["listing_consumed"];
    }
    if(json["active"] is String) {
      active = json["active"];
    }
    if(json["payment_method"] is String) {
      paymentMethod = json["payment_method"];
    }
    slip = json["slip"];
    if(json["user_id"] is int) {
      userId = json["user_id"];
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    if(json["property_request_id"] is int) {
      propertyRequestId = json["property_request_id"];
    }
    if(json["discount"] is String) {
      discount = json["discount"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["package_id"] = packageId;
    _data["code"] = code;
    _data["secret"] = secret;
    _data["amount"] = amount;
    _data["days"] = days;
    _data["payment_done"] = paymentDone;
    _data["status"] = status;
    _data["listing_consumed"] = listingConsumed;
    _data["active"] = active;
    _data["payment_method"] = paymentMethod;
    _data["slip"] = slip;
    _data["user_id"] = userId;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["property_request_id"] = propertyRequestId;
    _data["discount"] = discount;
    return _data;
  }
}

class ActivePackage {
  int? id;
  String? nameEn;
  String? nameAr;
  int? numberOfListing;
  int? appraisal;
  int? numberOfDays;
  int? discount;
  dynamic enable360;
  dynamic enable3D;
  int? enableAdvancedEditor;
  String? status;
  int? price;
  dynamic createdAt;
  String? updatedAt;
  int? numberOfAds;
  int? unlimitedNumberOfAds;
  int? numberOfPhotographyShots;
  int? propertyRequires;
  int? propertyManagement;
  int? discountAnnual;
  int? activeOrders;

  ActivePackage({this.id, this.nameEn, this.nameAr, this.numberOfListing, this.appraisal, this.numberOfDays, this.discount, this.enable360, this.enable3D, this.enableAdvancedEditor, this.status, this.price, this.createdAt, this.updatedAt, this.numberOfAds, this.unlimitedNumberOfAds, this.numberOfPhotographyShots, this.propertyRequires, this.propertyManagement, this.discountAnnual, this.activeOrders});

  ActivePackage.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["name_en"] is String) {
      nameEn = json["name_en"];
    }
    if(json["name_ar"] is String) {
      nameAr = json["name_ar"];
    }
    if(json["number_of_listing"] is int) {
      numberOfListing = json["number_of_listing"];
    }
    if(json["appraisal"] is int) {
      appraisal = json["appraisal"];
    }
    if(json["number_of_days"] is int) {
      numberOfDays = json["number_of_days"];
    }
    if(json["discount"] is int) {
      discount = json["discount"];
    }
    enable360 = json["enable_360"];
    enable3D = json["enable_3d"];
    if(json["enable_advancedEditor"] is int) {
      enableAdvancedEditor = json["enable_advancedEditor"];
    }
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["price"] is int) {
      price = json["price"];
    }
    createdAt = json["created_at"];
    if(json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    if(json["number_of_ads"] is int) {
      numberOfAds = json["number_of_ads"];
    }
    if(json["unlimited_number_of_ads"] is int) {
      unlimitedNumberOfAds = json["unlimited_number_of_ads"];
    }
    if(json["number_of_photography_shots"] is int) {
      numberOfPhotographyShots = json["number_of_photography_shots"];
    }
    if(json["property_requires"] is int) {
      propertyRequires = json["property_requires"];
    }
    if(json["property_management"] is int) {
      propertyManagement = json["property_management"];
    }
    if(json["discount_annual"] is int) {
      discountAnnual = json["discount_annual"];
    }
    if(json["active_orders"] is int) {
      activeOrders = json["active_orders"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name_en"] = nameEn;
    _data["name_ar"] = nameAr;
    _data["number_of_listing"] = numberOfListing;
    _data["appraisal"] = appraisal;
    _data["number_of_days"] = numberOfDays;
    _data["discount"] = discount;
    _data["enable_360"] = enable360;
    _data["enable_3d"] = enable3D;
    _data["enable_advancedEditor"] = enableAdvancedEditor;
    _data["status"] = status;
    _data["price"] = price;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["number_of_ads"] = numberOfAds;
    _data["unlimited_number_of_ads"] = unlimitedNumberOfAds;
    _data["number_of_photography_shots"] = numberOfPhotographyShots;
    _data["property_requires"] = propertyRequires;
    _data["property_management"] = propertyManagement;
    _data["discount_annual"] = discountAnnual;
    _data["active_orders"] = activeOrders;
    return _data;
  }
}