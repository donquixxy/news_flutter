import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:news_flutter/app/data/_provider.dart';
import 'package:news_flutter/app/data/models/article_models.dart';
import 'package:news_flutter/app/data/models/news_models.dart';

class HomeController extends GetxController {
  var listOfNews = <Articles>[].obs;
  var test = <NewsModel>[].obs;
  int hiveIndex = 0;
  late Box<Articles> hiveNewsFavorite;

  Future getAllData() async {
    var result = await NewsProvider().getData();

    if (test.isEmpty) {
      test.add(result!);
      test.refresh();
    } else if (test.isNotEmpty) {
      test.clear();
      test.add(result!);
    }
  }

  @override
  void onInit() {
    hiveNewsFavorite = Hive.box<Articles>('newsBookmarks');
    print(hiveNewsFavorite.printInfo);
    getAllData();
    super.onInit();
  }

  void addToFavoriteHive(Articles data) {
    hiveNewsFavorite.add(data).then((value) => print("succes"));
  }
}
