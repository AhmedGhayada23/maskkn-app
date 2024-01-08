
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum Type{
// rent = "Rent", sell ="sell"
Rent, Sell
}


class Item {
  String? title;
  String? category;
  String? image_url;
  String? location;
  int? room_num;
  int? bathroom_num;
  double? price;
  int?  image_num;
  double? land_space;
  double? building_space;
  bool? favorited;
  String? sellerId;
  String? id;
  Item({
    required this.title,
    required this.category,
    required this.image_url,
    required this.location,
    required this.room_num,
    required this.bathroom_num,
    required this.price,
    required this.image_num,
    required this.land_space,
    required this.building_space,
    this.favorited = false,
    LatLng? Maplocation,
    String? this.sellerId,
    String? this.id,
  });

  static List<Item> bestVilla = [
Item(title: "Chalet seen",
    category: "sell",
    image_url: "assets/img/3d.webp",

    location: "Muscat, Seeb",
    room_num: 1,
    bathroom_num: 2,
    price: 55,
    image_num: 2,
    land_space: 1021,
    building_space: 600,
    Maplocation: LatLng(22.902340, 58.118009),
    sellerId: "bwT5tSZNGVerWFSaJgzkx9tfor32",
    id:"1"

),
    Item(title: "Chalet seen",
      category: "sell",
      image_url: "assets/img/3d.webp",

      location: "Muscat, Seeb",
      room_num: 1,
      bathroom_num: 2,
      price: 55,
      image_num: 2,
      land_space: 1021,
      building_space: 600,
      Maplocation: LatLng(18.446074, 54.756557),
      sellerId: "bwT5tSZNGVerWFSaJgzkx9tfor32",
      id:"2"
    ),
    Item(title: "Chalet seen",
      category: "Rent",
      image_url: "assets/img/3d.webp",
      location: "Muscat, Seeb",
      room_num: 1,
      bathroom_num: 2,
      price: 55,
      image_num: 2,
      land_space: 1021,
      building_space: 600,
      Maplocation: LatLng(18.832102, 52.676169),
      sellerId: "bwT5tSZNGVerWFSaJgzkx9tfor32",
      id:"3"
    ),

  ];


}