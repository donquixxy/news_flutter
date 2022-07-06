import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:news_flutter/app/data/models/source_models.dart';
part 'article_models.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Articles {
  @HiveField(0)
  final Source source;
  @HiveField(1)
  final String? author;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final String url;
  @HiveField(5)
  final String? urlToImage;
  @HiveField(6)
  final String publishedAt;
  @HiveField(7)
  final String content;

  Articles(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);
}
