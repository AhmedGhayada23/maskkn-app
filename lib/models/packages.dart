class Package {
  int? id;
  dynamic nameEn;
  dynamic nameAr;
  dynamic numberOfListing;
  dynamic appraisal;
  dynamic numberOfDays;
  dynamic discount;
  dynamic enable360;
  dynamic enable3d;
  dynamic enableAdvancedEditor;
  dynamic status;
  dynamic price;
  dynamic numberOfPhotographyShots;
  dynamic cunlimitedNumberOfAds;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic propertyManagement;
  dynamic propertyRequires;
  dynamic discountAnnual;
  int? activeOrders;

  Package(
      {this.id,
      this.nameEn,
      this.nameAr,
      this.numberOfListing,
      this.appraisal,
      this.numberOfDays,
      this.discount,
      this.enable360,
      this.enable3d,
      this.enableAdvancedEditor,
      this.status,
      this.price,
      this.createdAt,
      this.updatedAt,
      this.activeOrders,
      this.numberOfPhotographyShots,
      this.cunlimitedNumberOfAds,
      this.propertyManagement,
      this.propertyRequires,
      this.discountAnnual});

  Package.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    numberOfListing = json['number_of_listing'];
    appraisal = json['appraisal'];
    numberOfDays = json['number_of_days'];
    discount = json['discount'];
    enable360 = json['enable_360'];
    enable3d = json['enable_3d'];
    enableAdvancedEditor = json['enable_advancedEditor'];
    status = json['status'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    activeOrders = json['active_orders'];
    numberOfPhotographyShots = json['number_of_photography_shots'];
    cunlimitedNumberOfAds = json['unlimited_number_of_ads'];
    propertyManagement = json['property_management'];
    propertyRequires = json['property_requires'];
    discountAnnual = json['discount_annual'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['number_of_listing'] = this.numberOfListing;
    data['appraisal'] = this.appraisal;
    data['number_of_days'] = this.numberOfDays;
    data['discount'] = this.discount;
    data['enable_360'] = this.enable360;
    data['enable_3d'] = this.enable3d;
    data['enable_advancedEditor'] = this.enableAdvancedEditor;
    data['status'] = this.status;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['active_orders'] = this.activeOrders;
    data['number_of_photography_shots'] = this.numberOfPhotographyShots;
    data['unlimited_number_of_ads'] = this.cunlimitedNumberOfAds;
    data['property_management'] = this.propertyManagement;
    data['property_requires'] = this.propertyRequires;
    data['discount_annual'] = this.discountAnnual;
    return data;
  }
}
