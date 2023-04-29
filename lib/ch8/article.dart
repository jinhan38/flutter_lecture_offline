class Article {
  String? author;
  String? title;
  String? id;
  String? name;
  String? urlToImage;

  Article({
    required this.author,
    required this.title,
    required this.id,
    required this.name,
    required this.urlToImage,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json["author"],
      title: json["title"],
      id: json["source"]["id"],
      name: json["source"]["name"],
      urlToImage: json["urlToImage"]
    );
  }

  @override
  String toString() {
    return 'Article{author: $author, title: $title, id: $id, name: $name, urlToImage: $urlToImage}';
  }
}
