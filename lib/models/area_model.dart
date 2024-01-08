class AreaModel {
  int? id;
  String? nameEn;
  String? nameAr;
  int? cityId;
  String? createdAt;
  String? updatedAt;
  String? created;

  AreaModel(
      {this.id,
      this.nameEn,
      this.nameAr,
      this.cityId,
      this.createdAt,
      this.updatedAt,
      this.created});

  AreaModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name_en"] is String) {
      nameEn = json["name_en"];
    }
    if (json["name_ar"] is String) {
      nameAr = json["name_ar"];
    }
    if (json["city_id"] is int) {
      cityId = json["city_id"];
    }
    if (json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if (json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    if (json["created"] is String) {
      created = json["created"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name_en"] = nameEn;
    _data["name_ar"] = nameAr;
    _data["city_id"] = cityId;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["created"] = created;
    return _data;
  }
}
