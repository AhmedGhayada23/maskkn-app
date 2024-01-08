class PhotographyPackage {
  int? id;
  String? nameEn;
  String? nameAr;
  int? photography;
  int? videography;
  int? virtualTour;
  int? mappingVideo;
  int? isActive;
  dynamic price;
  int? discount;

  PhotographyPackage(
      {this.id,
      this.nameEn,
      this.nameAr,
      this.photography,
      this.videography,
      this.virtualTour,
      this.mappingVideo,
      this.isActive,
      this.price,
      this.discount});

  PhotographyPackage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    photography = json['photography'];
    videography = json['videography'];
    virtualTour = json['virtual_tour'];
    mappingVideo = json['mapping_video'];
    isActive = json['is_active'];
    price = json['price'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['photography'] = this.photography;
    data['videography'] = this.videography;
    data['virtual_tour'] = this.virtualTour;
    data['mapping_video'] = this.mappingVideo;
    data['is_active'] = this.isActive;
    data['price'] = this.price;
    data['discount'] = this.discount;
    return data;
  }
}
