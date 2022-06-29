import 'package:hive/hive.dart';
import 'package:news_flutter/app/data/models/article_models.dart';

class HiveProvider {
  final box = Hive.box<Articles>('newsBookmarks');

  void addDataToHive(Articles data) {
    box.add(data);
  }

  void deleteDataFromHive(int index) {
    box.deleteAt(index);
  }

  List<Articles> fetchAllData() {
    if (box.isEmpty) {
      return [];
    }

    var data = box.values.toList();
    return data;
  }
}
