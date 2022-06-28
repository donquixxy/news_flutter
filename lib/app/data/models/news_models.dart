import 'package:json_annotation/json_annotation.dart';

import 'package:news_flutter/app/data/models/article_models.dart';

part 'news_models.g.dart';

@JsonSerializable()
class NewsModel {
  List<Articles> articles;

  NewsModel({
    required this.articles,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}
