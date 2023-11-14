// To parse this JSON data, do
//
//     final artikel = artikelFromJson(jsonString);

import 'dart:convert';

List<Artikel> artikelFromJson(String str) =>
    List<Artikel>.from(json.decode(str).map((x) => Artikel.fromJson(x)));

String artikelToJson(List<Artikel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Artikel {
  final DateTime createdAt;
  final String name;
  final String images;
  final String title;
  final String profile;
  final String publisher;
  final String id;

  Artikel({
    required this.createdAt,
    required this.name,
    required this.images,
    required this.title,
    required this.profile,
    required this.publisher,
    required this.id,
  });

  factory Artikel.fromJson(Map<String, dynamic> json) => Artikel(
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        images: json["images"],
        title: json["title"],
        profile: json["profile"],
        publisher: json["publisher"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "name": name,
        "images": images,
        "title": title,
        "profile": profile,
        "publisher": publisher,
        "id": id,
      };
}
