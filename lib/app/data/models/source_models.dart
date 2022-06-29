import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'source_models.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Source {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
