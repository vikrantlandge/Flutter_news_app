class NewsModel {
  final String title;
  final String description;
  final String url;
  final String image;
  final String content;
  final String publishedAt;
  final String sourceName;
  final String sourceUrl;

  NewsModel({
    required this.title,
    required this.description,
    required this.url,
    required this.image,
    required this.content,
    required this.publishedAt,
    required this.sourceName,
    required this.sourceUrl,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'],
      description: json['description'],
      url: json['url'],
      image: json['image'] ?? '',
      content: json['content'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      sourceName: json['source']['name'] ?? '',
      sourceUrl: json['source']['url'] ?? '',
    );
  }
}