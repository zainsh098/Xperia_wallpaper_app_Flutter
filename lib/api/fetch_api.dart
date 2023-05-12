import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../model/photos.dart';


class DataService {
  static Future<List<Photos>> fetchData(int page) async {
    try {
      String apiKey = '563492ad6f917000010000014e171b66ad0446fb8573e7d3ea7394b5'!;
      String url = "https://api.pexels.com/v1/curated?page=$page";

      print(url);
      var res =
          await http.get(Uri.parse(url), headers: {"Authorization": apiKey});

      Map<String, dynamic> data = jsonDecode(res.body);
      List<dynamic> list = data["photos"];
      print(list);
      List<Photos> photos = list.map((e) => Photos.fromJson(e)).toList();

      return photos;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<List<Photos>> fetchQuery(int page, String query) async {
    try {
      String apiKey = '563492ad6f917000010000014e171b66ad0446fb8573e7d3ea7394b5'!;
      String url = "https://api.pexels.com/v1/search?query=$query&page=$page";

      var res =
          await http.get(Uri.parse(url), headers: {"Authorization": apiKey});

      Map<String, dynamic> data = jsonDecode(res.body);
      List<dynamic> list = data["photos"];
      List<Photos> photos = list.map((e) => Photos.fromJson(e)).toList();

      return photos;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
