import 'dart:convert';

import 'package:http/http.dart' as http;

String apiKey = "5eb1f9fc2b3448dab5a5eee1a8061ba0";

Future<Map> featchNews() async {
  String newsUrl = "https://newsapi.org/v2/top-headlines?country=in&apiKey=";

  var client = http.Client();
  var response = await client.get(newsUrl + apiKey);

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  }

  return null;
}

Future<Map> featchCategoryNews(String category) async {
  String categoryNewsUrl =
      "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=";
  var client = http.Client();
  var response = await client.get(categoryNewsUrl + apiKey);
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  }
  print(response.body);
  return null;
}
