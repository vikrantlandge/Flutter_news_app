 import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/news_history_model.dart';
import '../model/news_model.dart';
import 'database_helper.dart';


class NewsController extends GetxController {
  var newsList = <NewsModel>[].obs;
  var isLoading = true.obs;
  var newsHistory = <NewsHistory>[].obs;
  final cat='general'.obs;

  // Fetch news history
  void fetchHistory() async {
    final history = await DatabaseHelper.instance.getHistory();
    newsHistory.value = history;
  }

  // Add clicked news to watched history
  void addToHistory(NewsModel news) async {
    var newsHistory = NewsHistory(
      title: news.title,
      description: news.description,
      image: news.image,
      content: news.content,
    );

    // Insert into database
    await DatabaseHelper.instance.insert(newsHistory);

    // Fetch and update history list
    fetchHistory();
  }

  // Clear all history
  void clearHistory() async {
    await DatabaseHelper.instance.deleteAll();
    fetchHistory(); // Update the history list
  }
  final String apiKey = '567339dd27528e7e7358d3e6e8ec9b87';
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchNews('general');
    fetchHistory();
  }

  // to fetch news
  void fetchNews(String category) async {
    cat.value=category;
    try {
      isLoading(true);
      var response = await http.get(Uri.parse('https://gnews.io/api/v4/top-headlines?category=$cat&lang=en&token=$apiKey'));
      var data = json.decode(response.body);
      if (data['articles'] != null) {
        newsList.value = (data['articles'] as List).map((article) => NewsModel.fromJson(article)).toList();
      }
    } finally {
      isLoading(false);
    }
  }
}
