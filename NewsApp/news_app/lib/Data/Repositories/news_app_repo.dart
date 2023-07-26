import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/Data/Models/news_app/news_app.dart';

class AllNewsRepo {
  Future<NewsApp?> getAllNew() async {
    try {
      var response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=7edbff97cb24442381d8cb110cc315d3"));

      Map<String, dynamic> deCodedResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        NewsApp data = NewsApp.fromJson(deCodedResponse);

        return data;
      } else {
        return null;
      }
    } catch (error) {
      print("Error : $error");
    }
  }
}
