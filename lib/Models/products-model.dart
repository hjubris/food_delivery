import 'dart:ui';
import 'package:flutter/material.dart';

class Product {
  int? id;
  String? name;
  double? price;
  String? description;
  String? img;
  Color? color;
  List<String>? ingredients;
  int? typeId;

  Product(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.img,
      this.color,
      this.ingredients,
      this.typeId});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        description: json['description'],
        img: "products/${json['image']}.jpg",
        color: Color(int.parse(json['color'], radix: 16)),
        ingredients: List.of(json['ingredients']).cast<String>(),
        typeId: json['typeId']);
  }
}
