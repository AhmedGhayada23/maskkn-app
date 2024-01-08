

class SectorType {
  int? id;
  String? nameEn;
  String? slug;
  String? nameAr;
  int? sectorId;

  SectorType({this.id, this.nameEn, this.slug, this.nameAr, this.sectorId});

  SectorType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    slug = json['slug'];
    nameAr = json['name_ar'];
    sectorId = json['sector_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['slug'] = this.slug;
    data['name_ar'] = this.nameAr;
    data['sector_id'] = this.sectorId;
    return data;
  }
}


class RoomType {
  int? id;
  String? roomType;

  RoomType({this.id, this.roomType});

  RoomType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomType = json['room_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['room_type'] = this.roomType;
    return data;
  }
}

class Feature {
  int? id;
  String? nameEn;
  String? nameAr;
  String? icon;

  Feature({this.id, this.nameEn, this.nameAr, this.icon});

  Feature.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['icon'] = this.icon;
    return data;
  }
}