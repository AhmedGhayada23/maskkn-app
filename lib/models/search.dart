class Property {
  int? id;
  String? titleAr;
  String? descriptionAr;
  double? locationLong;
  double? locationLat;
  dynamic area;
  dynamic salePrice;
  String? rentPeriod;
  dynamic numberBathrooms;
  String? numberRooms;
  String? image;
  UserInfo? user;
  List<PropertyImage>? media;

  Property({
    this.id,
    this.titleAr,
    this.descriptionAr,
    this.locationLong,
    this.locationLat,
    this.area,
    this.salePrice,
    this.rentPeriod,
    this.numberBathrooms,
    this.image,
    this.numberRooms,
    this.user,
    this.media,
  });

  Property.fromJson(Map<String, dynamic> json) {
    id =
    json['id'];
    titleAr = 
    json['title_ar'];
    descriptionAr = 
    json['description_ar'];
    locationLong =
    double.parse(json['location_long']);
    locationLat = 
    double.parse(json['location_lat']);
    area = 
    json['area'];
    salePrice = 
    json['sale_price'];
    rentPeriod = 
    json['rent_period'];
    numberBathrooms =
    json['number_bathrooms'];
    image =
    json['small'];
    numberRooms =
    json['number_rooms'];
    user = json['user'] != null ? new UserInfo.fromJson(json['user']) : null;
    media =
    List<PropertyImage>.from(
        (json['media'] as List).map((e) => PropertyImage.fromJson(e)));
  }
}

class PropertyImage {
  int id;
  String name;
  String fileName;
  String originalUrl;

  PropertyImage({
    required this.id,
    required this.name,
    required this.fileName,
    required this.originalUrl,
  });

  factory PropertyImage.fromJson(Map<String, dynamic> json) {
    return PropertyImage(
      id: json['id'],
      name: json['name'],
      fileName: json['file_name'],
      originalUrl: json['original_url'],
    );
  }
}

class UserInfo {
  int? id;
  String? name;
  String? avatar;
  String? role;
  int? totalPaid;

  UserInfo({
    this.id,
    this.name,
    this.avatar,
    this.role,
    this.totalPaid,
  });

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? ' ';
    avatar = json['avatar'] ?? ' ';
    role = json['role'] ?? "customer";
    totalPaid = json['total_paid'] ?? 0;
  }
}
