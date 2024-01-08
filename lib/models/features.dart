class FeaturesAll{
  int? id;
  String? nameEn;
  String? nameAr;
  String? icon;
  String? createdAt;
  String? updatedAt;

  FeaturesAll({this.id, this.nameEn, this.nameAr, this.icon, this.createdAt, this.updatedAt});

  FeaturesAll.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["name_en"] is String) {
      nameEn = json["name_en"];
    }
    if(json["name_ar"] is String) {
      nameAr = json["name_ar"];
    }
    if(json["icon"] is String) {
      icon = json["icon"];
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name_en"] = nameEn;
    _data["name_ar"] = nameAr;
    _data["icon"] = icon;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}