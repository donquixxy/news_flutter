import 'package:json_annotation/json_annotation.dart';

part 'source_models.g.dart';

@JsonSerializable()
class Source {
  final String? id;
  final String name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
