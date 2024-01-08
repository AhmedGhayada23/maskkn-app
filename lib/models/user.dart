class UserChant {
  int? id;
  String? name;
  String? email;
  int? phone;
  String? emailVerifiedAt;
  String? status;
  String? website;
  String? description;
  int? stateId;
  int? cityId;
  String? googleId;
  String? bank;
  int? apiToken;
  int? isAppraisal;
  int? isAdvertisement;
  int? isPropertyManagement;
  int? agencyId;
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

  UserChant({
    this.id,
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
    this.isAppraisal,
    this.isAdvertisement,
    this.isPropertyManagement,
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
    this.media,
  });

  factory UserChant.fromJson(Map<String, dynamic> json) {
    return UserChant(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      emailVerifiedAt: json['email_verified_at'],
      status: json['status'],
      website: json['website'],
      description: json['description'],
      stateId: json['state_id'],
      cityId: json['city_id'],
      googleId: json['google_id'],
      bank: json['bank'],
      apiToken: json['api_token'],
      isAppraisal: json['is_apprasial'],
      isAdvertisement: json['is_advertisement'],
      isPropertyManagement: json['is_propertyMangment'],
      agencyId: json['agency_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      prStatesId: json['pr_states_id'],
      prCityId: json['pr_city_id'],
      prListing: json['pr_listing'],
      prSectorDetails: json['pr_sector_details'],
      prSaleStatesId: json['pr_sale_states_id'],
      prSaleCityId: json['pr_sale_city_id'],
      prSaleSectorDetails: json['pr_sale_sector_details'],
      avatar: json['avatar'],
      role: json['role'],
      activePackage: json['active_package'],
      billing: json['billing'],
      totalPaid: json['total_paid'],
      media: List<Media>.from(json['media'].map((x) => Media.fromJson(x))),
    );
  }
}

class Media {
  final int id;
  final String modelType;
  final int modelId;
  final String uuid;
  final String collectionName;
  final String name;
  final String fileName;
  final String mimeType;
  final String disk;
  final String conversionsDisk;
  final int size;
  final List<String> manipulations;
  final List<String> customProperties;
  final Map<String, bool> generatedConversions;
  final List<dynamic> responsiveImages;
  final int orderColumn;
  final String createdAt;
  final String updatedAt;
  final String originalUrl;
  final String previewUrl;

  Media({
    required this.id,
    required this.modelType,
    required this.modelId,
    required this.uuid,
    required this.collectionName,
    required this.name,
    required this.fileName,
    required this.mimeType,
    required this.disk,
    required this.conversionsDisk,
    required this.size,
    required this.manipulations,
    required this.customProperties,
    required this.generatedConversions,
    required this.responsiveImages,
    required this.orderColumn,
    required this.createdAt,
    required this.updatedAt,
    required this.originalUrl,
    required this.previewUrl,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      id: json['id'],
      modelType: json['model_type'],
      modelId: json['model_id'],
      uuid: json['uuid'],
      collectionName: json['collection_name'],
      name: json['name'],
      fileName: json['file_name'],
      mimeType: json['mime_type'],
      disk: json['disk'],
      conversionsDisk: json['conversions_disk'],
      size: json['size'],
      manipulations: List<String>.from(json['manipulations'].map((x) => x)),
      customProperties:
          List<String>.from(json['custom_properties'].map((x) => x)),
      generatedConversions:
          Map<String, bool>.from(json['generated_conversions']),
      responsiveImages:
          List<dynamic>.from(json['responsive_images'].map((x) => x)),
      orderColumn: json['order_column'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      originalUrl: json['original_url'],
      previewUrl: json['preview_url'],
    );
  }
}
