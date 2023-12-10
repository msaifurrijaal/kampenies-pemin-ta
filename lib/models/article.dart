import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'article.g.dart';

List<Article> artikelFromJson(String str) =>
    List<Article>.from(json.decode(str).map((x) => Article.fromJson(x)));

String artikelToJson(List<Article> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class Article {
  final DateTime createdAt;
  final String name;
  final String images;
  final String title;
  final String profile;
  final String publisher;
  final String id;

  Article({
    required this.createdAt,
    required this.name,
    required this.images,
    required this.title,
    required this.profile,
    required this.publisher,
    required this.id,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
