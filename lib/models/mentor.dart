// To parse this JSON data, do
//
//     final mentor = mentorFromJson(jsonString);

import 'dart:convert';

List<Mentor> mentorFromJson(String str) =>
    List<Mentor>.from(json.decode(str).map((x) => Mentor.fromJson(x)));

String mentorToJson(List<Mentor> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mentor {
  final DateTime createdAt;
  final String name;
  final String images;
  final String title;
  final String description;
  final String category;
  final DateTime updatedAt;
  final String id;

  Mentor({
    required this.createdAt,
    required this.name,
    required this.images,
    required this.title,
    required this.description,
    required this.category,
    required this.updatedAt,
    required this.id,
  });

  factory Mentor.fromJson(Map<String, dynamic> json) => Mentor(
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        images: json["images"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "name": name,
        "images": images,
        "title": title,
        "description": description,
        "category": category,
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
      };
}
