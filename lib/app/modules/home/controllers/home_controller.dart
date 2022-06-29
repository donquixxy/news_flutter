import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:news_flutter/app/data/_provider.dart';
import 'package:news_flutter/app/data/hive_provider.dart';
import 'package:news_flutter/app/data/models/article_models.dart';
import 'package:news_flutter/app/data/models/news_models.dart';

class HomeController extends GetxController {
  var test = <NewsModel>[].obs;
  ScrollController scrollController = ScrollController();
  final HiveProvider _provider = HiveProvider();

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
    // print(hiveNewsFavorite.printInfo);
    getAllData();
    super.onInit();
  }

  void addToFavoriteHive(Articles data) {
    _provider.addDataToHive(data);
  }
}
