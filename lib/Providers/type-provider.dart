import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:food_delivery/Models/types-model.dart';

const serverUrl = 'https://56055fed-95d8-4db3-8637-54244cbef88d.mock.pstmn.io'; ///postman del cibo
//const serverUrl = 'https://7b18038e-02f0-4f5d-a55f-8fed1867119d.mock.pstmn.io'; ///postman delle borse

class TypeProvider {
  static Future<List<FoodType>> fetchTypes() async {
    final response = await http.get(Uri.parse('$serverUrl/type'));

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);

      List<FoodType> webTypeList = [];
      for (int i = 0; i < result.length; i++) {
        FoodType t = FoodType.fromJson(result[i]);
        webTypeList.add(t);
      }
      return webTypeList;
    } else {
      throw Exception("Failed to load products!");
    }
  }
}
