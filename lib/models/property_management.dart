class PropertyManagementModel {
  int? id;
  String? name;
  String? email;
  int? phone;
  String? emailVerifiedAt;
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
  String? prStatesId;
  String? prCityId;
  String? prListing;
  String? prSectorDetails;
  String? prSaleStatesId;
  String? prSaleCityId;
  String? prSaleSectorDetails;
  String? avatar;
  String? role;
  dynamic activePackage;
  dynamic billing;
  int? totalPaid;
  List<Media>? media;

  PropertyManagementModel(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.emailVerifiedAt,
      this.status,
      this.website,
      this.description,
      this.stateId,
      this.cityId,
      this.googleId,
      this.bank,
      this.apiToken,
      this.isApprasial,
      this.isAdvertisement,
      this.isPropertyMangment,
      this.agencyId,
      this.createdAt,
      this.updatedAt,
      this.prStatesId,
      this.prCityId,
      this.prListing,
      this.prSectorDetails,
      this.prSaleStatesId,
      this.prSaleCityId,
      this.prSaleSectorDetails,
      this.avatar,
      this.role,
      this.activePackage,
      this.billing,
      this.totalPaid,
      this.media});

  PropertyManagementModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];

    name = json["name"];

    email = json["email"];

    phone = json["phone"];

    emailVerifiedAt = json["email_verified_at"];

    status = json["status"];

    website = json["website"];

    description = json["description"];

    stateId = json["state_id"];

    cityId = json["city_id"];

    googleId = json["google_id"];
    bank = json["bank"];

    apiToken = json["api_token"];

    isApprasial = json["is_apprasial"];

    isAdvertisement = json["is_advertisement"];

    isPropertyMangment = json["is_propertyMangment"];

    agencyId = json["agency_id"];

    createdAt = json["created_at"];

    updatedAt = json["updated_at"];

    prStatesId = json["pr_states_id"];

    prCityId = json["pr_city_id"];

    prListing = json["pr_listing"];

    prSectorDetails = json["pr_sector_details"];

    prSaleStatesId = json["pr_sale_states_id"];

    prSaleCityId = json["pr_sale_city_id"];

    prSaleSectorDetails = json["pr_sale_sector_details"];

    avatar = json["avatar"];

    role = json["role"];

    activePackage = json["active_package"];
    billing = json["billing"];

    totalPaid = json["total_paid"];

    media = json["media"] == null
        ? null
        : (json["media"] as List).map((e) => Media.fromJson(e)).toList();
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
    _data["active_package"] = activePackage;
    _data["billing"] = billing;
    _data["total_paid"] = totalPaid;
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
