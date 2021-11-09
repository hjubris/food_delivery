import 'package:flutter/material.dart';

class FoodType {
  int? id;
  String? name;
  String? img;

  FoodType({this.id, this.name, this.img});

  factory FoodType.fromJson(Map<String, dynamic> json) {
    return FoodType(
      id: json['id'],
      name: json['name'],
      img: "Icons/${json['icon']}",
    );
  }
}
