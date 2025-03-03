import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/news_model.dart';


class NewsController extends GetxController {
  var newsList = <NewsModel>[].obs;
  var isLoading = true.obs;

  final String apiKey = '567339dd27528e7e7358d3e6e8ec9b87';

  // to fetch news
  void fetchNews(String category) async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse('https://gnews.io/api/v4/top-headlines?category=$category&lang=en&token=$apiKey'));
      var data = json.decode(response.body);
      if (data['articles'] != null) {
        newsList.value = (data['articles'] as List).map((article) => NewsModel.fromJson(article)).toList();
      }
    } finally {
      isLoading(false);
    }
  }
}
