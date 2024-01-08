class City {
  int? id;
  String? city;
  String? cityAr;
  String? cityEn;
  String? slug;
  int? countryId;
  int? stateId;
  String? area;
  String? status;
  dynamic createdAt;
  String? updatedAt;
  String? small;
  int? propertiesCount;
  List<Media>? media;

  City(
      {this.id,
      this.city,
      this.cityAr,
      this.cityEn,
      this.slug,
      this.countryId,
      this.stateId,
      this.area,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.small,
      this.propertiesCount,
      this.media});

  City.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["city"] is String) {
      city = json["city"];
    }
    if (json["city_ar"] is String) {
      cityAr = json["city_ar"];
    }

    if (json["city_en"] is String) {
      cityEn = json["city_en"];
    }
    if (json["slug"] is String) {
      slug = json["slug"];
    }
    if (json["country_id"] is int) {
      countryId = json["country_id"];
    }
    if (json["state_id"] is int) {
      stateId = json["state_id"];
    }
    if (json["area"] is String) {
      area = json["area"];
    }
    if (json["status"] is String) {
      status = json["status"];
    }
    createdAt = json["created_at"];
    if (json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    if (json["small"] is String) {
      small = json["small"];
    }
    if (json["properties_count"] is int) {
      propertiesCount = json["properties_count"];
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
    _data["city"] = city;
    _data["city_ar"] = cityAr;
    _data["city_en"] = cityEn;
    _data["slug"] = slug;
    _data["country_id"] = countryId;
    _data["state_id"] = stateId;
    _data["area"] = area;
    _data["status"] = status;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["small"] = small;
    _data["properties_count"] = propertiesCount;
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
