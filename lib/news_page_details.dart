// news_detail_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/news_model.dart';


class NewsDetailPage extends StatelessWidget {
  final NewsModel news;
  NewsDetailPage({required this.news});
  // Function to open the URL
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
  void shareContent(String title, String description, String imageUrl) {
    final content = 'Title: ${news.title}\n\nDescription: ${news.description}\n\nImage: ${news.image}';
    Share.share(content);
  }
  // Function to share the news via WhatsApp
  // Future<void> _shareOnWhatsApp(String message) async {
  //   final Uri whatsappUrl = Uri.parse("whatsapp://send?text=$message");
  //   if (await canLaunchUrl(whatsappUrl)) {
  //     await launchUrl(whatsappUrl);
  //   } else {
  //     throw 'Could not open WhatsApp';
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    final String shareMessage = "${news.title}\n\n${news.url}";
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
            Image.network(news.image),
            SizedBox(height: 16),
            Text(news.content),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                _launchURL(news.sourceUrl);
              },
              child: Text("Read More"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
               // _shareOnWhatsApp(shareMessage);
                shareContent(
                  'Sample Title',
                  'This is a sample description for sharing.',
                  'https://example.com/sample-image.jpg',
                );
              },
              child: Text("Share"),
            ),
          ],
        ),
      ),
    );
  }
}
