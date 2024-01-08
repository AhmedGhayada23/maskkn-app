class SectorDetails {
  int? id;
  String? nameEn;
  String? nameAr;
  String? slug;

  SectorDetails({this.id, this.nameEn, this.nameAr});

  SectorDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name_en'] = nameEn;
    data['name_ar'] = nameAr;
    data['slug'] = slug;

    return data;
  }
}
