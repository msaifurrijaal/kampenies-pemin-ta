// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mentor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mentor _$MentorFromJson(Map<String, dynamic> json) => Mentor(
      createdAt: DateTime.parse(json['createdAt'] as String),
      name: json['name'] as String,
      images: json['images'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      id: json['id'] as String,
    );

Map<String, dynamic> _$MentorToJson(Mentor instance) => <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'name': instance.name,
      'images': instance.images,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'id': instance.id,
    };
