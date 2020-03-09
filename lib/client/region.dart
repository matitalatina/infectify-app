import 'dart:convert';

import 'package:http/http.dart';
import 'package:infectify/model/region.dart';
final backendBaseUrl = 'https://infectify-backend.herokuapp.com/api/';

class RegionClient {
  Future<List<Region>> findAll() async {
    final response = await get("$backendBaseUrl/vi/regions");
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List<Map<String, dynamic>>)
          .map((r) => Region.fromJson(r));
    }
    else {
      throw Exception('Failed to load regions');
    }
  }
}