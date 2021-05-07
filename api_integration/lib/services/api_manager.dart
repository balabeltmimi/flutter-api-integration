import 'dart:convert';

import 'package:api_integration/constants/strings.dart';
import 'package:api_integration/models/newsInfo.dart';
import 'package:http/http.dart' as http;

class APIManager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel;
    try {
      var response = await client.get(Uri.parse(Strings.newsUrl));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }
    return newsModel;
  }
}
