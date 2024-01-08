class Sector{
   int? id;
   String? sectorEn;
   String? sectorAr;

  Sector({ this.id,  this.sectorEn,  this.sectorAr});

   Sector.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectorEn = json['sector_en'];
    sectorAr = json['sector_ar'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['sector_en'] = sectorEn;
    data['sector_ar'] = sectorAr;
  
    return data;
  }
}


