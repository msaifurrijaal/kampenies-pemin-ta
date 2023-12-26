import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'mentor.g.dart';

List<Mentor> mentorFromJson(String str) =>
    List<Mentor>.from(json.decode(str).map((x) => Mentor.fromJson(x)));

String mentorToJson(List<Mentor> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
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

  factory Mentor.fromJson(Map<String, dynamic> json) => _$MentorFromJson(json);

  Map<String, dynamic> toJson() => _$MentorToJson(this);
}
