// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      createdAt: DateTime.parse(json['createdAt'] as String),
      name: json['name'] as String,
      images: json['images'] as String,
      title: json['title'] as String,
      profile: json['profile'] as String,
      publisher: json['publisher'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'name': instance.name,
      'images': instance.images,
      'title': instance.title,
      'profile': instance.profile,
      'publisher': instance.publisher,
      'id': instance.id,
    };
