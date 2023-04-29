import 'article.dart';

class JsonModel {
  String? status;
  int? totalResults;
  List<Article> articles;

  JsonModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  /// map 형식의 받아서 JsonModel 클래스를 만들어주는 함수
  /// Map<String, dynamic> json => String : key, dynamic : value
  /// dynamic은 모든 타입 가능
  factory JsonModel.fromJson(Map<String, dynamic> json) {
    // articles key의 데이터들 받기
    // map<Article> 리스트의 타입을 Article로 한다.
    // toList() 리스트 타입으로 만든다.

    return JsonModel(
      status: json["status"],
      totalResults: json["totalResults"],
      articles: json["articles"]
          .map<Article>((element) => Article.fromJson(element))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'JsonModel{status: $status, totalResults: $totalResults, articles: $articles}';
  }
}
