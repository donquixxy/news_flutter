import 'package:get/get.dart';
import 'package:news_flutter/app/data/_provider.dart';
import 'package:news_flutter/app/data/models/article_models.dart';
import 'package:news_flutter/app/data/models/news_models.dart';

class HomeController extends GetxController {
  var listOfNews = <Articles>[].obs;
  var test = <NewsModel>[].obs;

  getAllData() {
    NewsProvider().getData(test);
  }

  @override
  void onInit() {
    getAllData();
    super.onInit();
  }
}
