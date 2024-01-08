class Governorate {
  int? id;
  String? state;
  String? stateAr;
  String? stateEn;
  String? cityAr;

  Governorate({this.id, this.state, this.stateAr, this.stateEn});

  Governorate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    state = json['state'];
    stateAr = json['state_ar'];
    stateEn = json['state_en'];
    cityAr = json['city_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['id'] = id;
    _data['state'] = state;
    _data['state_ar'] = stateAr;
    _data['state_en'] = stateEn;
    _data['city_ar'] = cityAr;
    return _data;
  }
}
