class Profile {
  int? id;
  String? password;
  String? name;
  String? email; //unique
  int? phone;
  String? emailVerifiedAt;
  String? status; //['active', 'inactive']
  String? description;
  int? stateId;
  int? cityId;
  String? googleId;
  String? bank;
  int? apiToken;
  int? isApprasial;
  int? isAdvertisement;
  int? isPropertyMangment;
  int? agencyId;
  String? createdAt;
  String? updatedAt;
  String? avatar;
  String? role;
  Billing? billing;
  List<Media>? media;

  Profile({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.emailVerifiedAt,
    this.status,
    this.description,
    this.stateId,
    this.cityId,
    this.googleId,
    this.bank,
    this.apiToken,
    this.isApprasial,
    this.isAdvertisement,
    this.isPropertyMangment,
    this.agencyId,
    this.createdAt,
    this.updatedAt,
    this.avatar,
    this.role,
    this.billing,
    this.media,
  });

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    status = json['status'];
    description = json['description'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    googleId = json['google_id'];
    bank = json['bank'];
    apiToken = json['api_token'];
    isApprasial = json['is_apprasial'];
    isAdvertisement = json['is_advertisement'];
    isPropertyMangment = json['is_propertyMangment'];
    agencyId = json['agency_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    avatar = json['avatar'];
    role = json['role'];
    billing =
        json['billing'] != null ? Billing.fromJson(json['billing']) : null;
    media = json["media"] == null
        ? null
        : (json["media"] as List).map((e) => Media.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['email_verified_at'] = emailVerifiedAt;
    data['status'] = status;
    data['description'] = description;
    data['state_id'] = stateId;
    data['city_id'] = cityId;
    data['google_id'] = googleId;
    data['bank'] = bank;
    data['api_token'] = apiToken;
    data['is_apprasial'] = isApprasial;
    data['is_advertisement'] = isAdvertisement;
    data['is_propertyMangment'] = isPropertyMangment;
    data['agency_id'] = agencyId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['avatar'] = avatar;
    data['role'] = role;
    if (billing != null) {
      data['billing'] = billing!.toJson();
    }
    if (media != null) {
      data["media"] = media?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Billing {
  int? id;
  int? packageId;
  String? code;
  String? secret;
  int? amount;
  int? days;
  int? paymentDone;
  String? status;
  int? listingConsumed;
  String? active; //default => 'pending'
  String? paymentMethod;
  String? slip;
  int? userId;
  String? createdAt;
  String? updatedAt;
  int? propertyRequestId;

  Billing(
      {this.id,
      this.packageId,
      this.code,
      this.secret,
      this.amount,
      this.days,
      this.paymentDone,
      this.status,
      this.listingConsumed,
      this.active,
      this.paymentMethod,
      this.slip,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.propertyRequestId});

  Billing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageId = json['package_id'];
    code = json['code'];
    secret = json['secret'];
    amount = json['amount'];
    days = json['days'];
    paymentDone = json['payment_done'];
    status = json['status'];
    listingConsumed = json['listing_consumed'];
    active = json['active'];
    paymentMethod = json['payment_method'];
    slip = json['slip'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    propertyRequestId = json['property_request_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['package_id'] = packageId;
    data['code'] = code;
    data['secret'] = secret;
    data['amount'] = amount;
    data['days'] = days;
    data['payment_done'] = paymentDone;
    data['status'] = status;
    data['listing_consumed'] = listingConsumed;
    data['active'] = active;
    data['payment_method'] = paymentMethod;
    data['slip'] = slip;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['property_request_id'] = propertyRequestId;
    return data;
  }
}

class Media {
  String? original_url;

  Media({
    this.original_url,
  });

  Media.fromJson(Map<String, dynamic> json) {
    original_url = json["original_url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['original_url'] = original_url;
    return data;
  }
}
