// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsArticleImpl _$$NewsArticleImplFromJson(Map<String, dynamic> json) =>
    _$NewsArticleImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      shortDescription: json['short_description'] as String,
      imageUrl: json['image_url'] as String,
      publishDate: DateTime.parse(json['publish_date'] as String),
      author: json['author'] as String,
      sourceUrl: json['source_url'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$NewsArticleImplToJson(_$NewsArticleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'short_description': instance.shortDescription,
      'image_url': instance.imageUrl,
      'publish_date': instance.publishDate.toIso8601String(),
      'author': instance.author,
      'source_url': instance.sourceUrl,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
