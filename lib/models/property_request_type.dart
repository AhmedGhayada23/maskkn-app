class PropertyRequestType {
  int? id;
  String? slug;
  String? titleAr;
  String? titleEn;
  int? price;
  String? descriptionAr;
  String? descriptionEn;
  String? tagLineAr;
  String? tagLineEn;
  String? small;
  PropertyRequestType(
      {this.id,
        this.slug,
        this.titleAr,
        this.titleEn,
        this.price,
        this.descriptionAr,
        this.descriptionEn,
        this.tagLineAr,
        this.small,
        this.tagLineEn});

  PropertyRequestType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    price = json['price'];
    small = json['small'];
    descriptionAr = json['description_ar'];
    descriptionEn = json['description_en'];
    tagLineAr = json['tag_line_ar'];
    tagLineEn = json['tag_line_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['title_ar'] = this.titleAr;
    data['title_en'] = this.titleEn;
    data['price'] = this.price;
    data['description_ar'] = this.descriptionAr;
    data['description_en'] = this.descriptionEn;
    data['tag_line_ar'] = this.tagLineAr;
    data['tag_line_en'] = this.tagLineEn;
    data['small'] = this.small;
    return data;
  }
}