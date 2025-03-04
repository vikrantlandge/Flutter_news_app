class NewsHistory {
  final int? id;
  final String title;
  final String description;
  final String image;
  final String content;

  NewsHistory({
    this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.content,
  });

  // Convert NewsHistory object to map (for inserting into DB)
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'content': content,
    };
  }

  // Convert map to NewsHistory object (for reading from DB)
  factory NewsHistory.fromMap(Map<String, dynamic> map) {
    return NewsHistory(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      image: map['image'],
      content: map['content'],
    );
  }
}
