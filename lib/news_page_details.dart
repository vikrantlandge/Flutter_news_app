// news_detail_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/news_model.dart';


class NewsDetailPage extends StatelessWidget {
  final NewsModel news;
  NewsDetailPage({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(news.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(news.imageUrl),
            SizedBox(height: 16),
            Text(news.content),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {

              },
              child: Text("Read More"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement sharing functionality
              },
              child: Text("Share"),
            ),
          ],
        ),
      ),
    );
  }
}
