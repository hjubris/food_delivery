import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_delivery/Models/products-model.dart';
import 'package:http/http.dart' as http;

const serverUrl = 'https://56055fed-95d8-4db3-8637-54244cbef88d.mock.pstmn.io';

class ProductProvider {
  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$serverUrl/products'));

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);

      List<Product> webProductList = [];
      for (int i = 0; i < result.length; i++) {
        Product t = Product.fromJson(result[i]);
        webProductList.add(t);
      }
      return webProductList;
    } else {
      throw Exception('Failed to load products!');
    }
  }
}
