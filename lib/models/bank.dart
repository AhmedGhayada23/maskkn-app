class Bank {
  int? id;
  String? nameEn;
  String? nameAr;

  Bank({this.id, this.nameEn, this.nameAr});

  Bank.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["name_en"] is String) {
      nameEn = json["name_en"];
    }
    if(json["name_ar"] is String) {
      nameAr = json["name_ar"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name_en"] = nameEn;
    _data["name_ar"] = nameAr;
    return _data;
  }
}