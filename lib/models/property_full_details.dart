class PropertyFullDetails {
  int? id;
  String? titleEn;
  String? titleAr;
  String? url3d;
  String? url360;
  String? descriptionEn;
  String? descriptionAr;
  String? locationLong;
  String? locationLat;
  String? videoUrl;
  String? rentPeriod; //enum enum('rent_period', ['daily', 'monthly', 'annualy']);
  String? listingStatus; //enum enum('listing_status', ['published', 'closed', 'draft']);
  String? expireDate;
  String? small;
  String? medium;
  String? createdTime;
  String? updatedTime;
  String? views;
  String? slug;


  int? countryId;
  int? stateId;
  int? sectorId;
  int? sectorDetailId;
  int? cityId;

  int? area;
  int? parking;
  int? numberBathrooms;
  int? yearBuilt;
  int? numberRooms;
  int? numberBedrooms;
  int? numberBeds;

  int? buildingSize;
  int? landingSize;
  int? square;
  int? autoRenew;
  int? salePrice;

  int? buildingCompleted;
  int? isOffPlan;

  int? rentPrice;
  int? neverExpired;
  int? numberFloors;

  int? isRent;
  int? isSale;
  int? isFeatured;


  UserInfo? user;
  List<Features>? features;
  List<Media>? media;






  PropertyFullDetails(
      {
        this.id,
        this.titleEn,
        this.titleAr,
        this.url3d,
        this.url360,
        this.descriptionEn,
        this.descriptionAr,
        this.locationLong,
        this.locationLat,
        this.videoUrl,

        this.rentPeriod,
        this.listingStatus,
        this.expireDate,
        this.small,
        this.medium,
        this.createdTime,
        this.updatedTime,
        this.views,

        this.slug,
        this.user,
        this.features,
        this.media,



        this.countryId,
        this.stateId,
        this.sectorId,
        this.sectorDetailId,
        this.cityId,



        this.area,
        this.parking,
        this.numberBathrooms,
        this.yearBuilt,
        this.numberBedrooms,
        this.numberBeds,
        this.buildingSize,
        this.landingSize,
        this.square,
        this.autoRenew,
        this.salePrice,

        this.isSale,
        this.isFeatured,
        this.isRent,
        this.rentPrice,
        this.neverExpired,
        this.numberFloors,
        this.isOffPlan,
        this.buildingCompleted,



      });

  PropertyFullDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleEn = json['title_en']?? " ";
    titleAr = json['title_ar']?? " ";
    url3d = json['url_3d'] ?? "nothing";
    url360 = json['url_360']?? "nothing";
    descriptionEn = json['description_en']?? " ";
    descriptionAr = json['description_ar']?? " ";
    locationLong = json['location_long']??  "0" ;
    locationLat = json['location_lat']??  "0";

    countryId = json['country_id'] ?? 0;
    stateId = json['state_id']?? 0;
    sectorId = json['sector_id']?? 0;
    cityId =json['city_id']?? 0;
    videoUrl = json['video_url'] ?? " ";

    area = json['area']??  0;
    parking = json['parking'] ??  0;
    numberBathrooms =  json['number_bathrooms']??  0;
    yearBuilt = json['year_built']?? 0;
    numberRooms = json['number_rooms']?? 0;
    numberBedrooms = json['number_bedrooms']??  0;
    numberBeds =json['number_beds']??  0;
    buildingSize = json['building_size']??  0;
    landingSize = json['landing_size']??  0;
    autoRenew = json['auto_renew']?? 0;
    salePrice = json['sale_price']?? 0;


    isSale = json['is_sale']??  0;
    isFeatured = json['is_featured']??  0;
    isRent = json['is_rent']??  0;
    rentPrice = json['rent_price']??  0;
    neverExpired = json['never_expired']?? 0;
    numberFloors = json['number_floors']??  0;
    isOffPlan = json['is_off_plan']?? 0;
    buildingCompleted = json['building_completed'] ?? 0;

    rentPeriod =json['rent_period'];
    expireDate = json['expire_date'];
    small = json['small'] ?? " ";
    medium = json['medium']?? " ";
    createdTime = json['created_time'];
    updatedTime = json['updated_time'];
    views = json['views']??  "0";
    slug = json['slug']?? " ";
    user = json['user'] != null ? new UserInfo.fromJson(json['user']) : null;

    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add( Features.fromJson(v));
      });
    }
    if (json['media'] != null) {
    media = <Media>[];
    json['media'].forEach((v) {
    media!.add(new Media.fromJson(v));
    });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title_en'] = this.titleEn;
    data['title_ar'] = this.titleAr;
    data['url_3d'] = this.url3d ;
    data['url_360'] = this.url360 ;
    data['description_en'] = this.descriptionEn ;
    data['description_ar'] = this.descriptionAr;
    data['location_long'] = this.locationLong ;
    data['location_lat'] = this.locationLat ;
    data['video_url'] = this.videoUrl;



    data['country_id'] = this.countryId ;
    data['state_id'] = this.stateId ;
    data['sector_id'] = this.sectorId ;
    data['sector_detail_id'] = this.sectorDetailId;
    data['city_id'] = this.cityId ;

    data['area'] = this.area ;
    data['parking'] = this.parking ;
    data['number_bathrooms'] = this.numberBathrooms;
    data['year_built'] = this.yearBuilt;
    data['number_rooms'] = this.numberRooms;
    data['number_bedrooms'] = this.numberBedrooms;
    data['number_beds'] = this.numberBeds;
    data['building_size'] = this.buildingSize;
    data['landing_size'] = this.landingSize;
    data['square'] = this.square;
    data['auto_renew'] = this.autoRenew;
    data['sale_price'] = this.salePrice;


    data['is_rent'] = this.isRent;
    data['is_sale'] = this.isSale;
    data['is_featured'] = this.isFeatured;
    data['rent_price'] = this.rentPrice;
    data['never_expired'] = this.neverExpired;
    data['number_floors'] = this.numberFloors;
    data['is_off_plan'] = this.isOffPlan;
    data['building_completed'] = this.buildingCompleted;

    data['rent_period'] = this.rentPeriod;
    data['listing_status'] = this.listingStatus;
    data['expire_date'] = this.expireDate;

    data['small'] = this.small;
    data['medium'] = this.medium;
    data['created_time'] = this.createdTime;
    data['updated_time'] = this.updatedTime;
    data['views'] = this.views;
    data['slug'] = this.slug;

    if (this.user != null) {
      data['user'] = this.user!;
    }

    if (this.features != null) {
      data['features'] = this.features!.map((v) => v.toJson()).toList();
    }
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}







class UserInfo {
  int? id;
  String? name;
  String? avatar;
  String? role;
  int? totalPaid;


  UserInfo({this.id,
    this.name,
    this.avatar,
    this.role,
    this.totalPaid,});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? ' ';
    avatar = json['avatar']?? ' ';
    role = json['role'] ?? "customer";
    totalPaid = json['total_paid'] ?? 0;
  }

}

class Media {
  int? id;
  String? name;
  String? fileName;
  int? size;
  String? originalUrl;
  String? previewUrl;

  Media(
      {this.id,
        this.name,
        this.fileName,

        this.size,
        this.originalUrl,
        this.previewUrl
      });

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? " ";
    fileName = json['file_name']??" ";
    size = json['size'] ?? 0;
    originalUrl = json['original_url']?? " ";
    previewUrl = json['preview_url']?? " ";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['file_name'] = this.fileName;
    data['size'] = this.size;
    data['original_url'] = this.originalUrl;
    data['preview_url'] = this.previewUrl;
    return data;
  }
}

class Features {
  int? id;

  Features({this.id});

  Features.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}