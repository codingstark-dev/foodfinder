import 'dart:convert';

import 'package:foodfinder/Model/FoodFactModel.dart';
import 'package:http/http.dart' as http;


class ApiCall {
  static Future<OpenFoodFact> getOpenFoodFact({
   required String? barcode,
  }) async {
    final response = await http.get(Uri.parse('https://world.openfoodfacts.org/api/v3/product/$barcode.json'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return OpenFoodFact.fromJson(json);
    } else {
      throw Exception('Failed to load OpenFoodFact');
    }
  }
}
