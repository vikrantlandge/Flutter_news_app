// news_model.dart
class NewsModel {
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final String content;

  NewsModel({
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'],
      description: json['description'],
      url: json['url'],
      imageUrl: json['image'] ?? '',
      content: json['content'] ?? '',
    );
  }
}
