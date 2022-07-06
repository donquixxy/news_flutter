import 'package:get/get.dart';
import 'package:news_flutter/app/data/hive_provider.dart';
import 'package:news_flutter/app/data/models/article_models.dart';
import 'package:hive/hive.dart';

class BookmarkController extends GetxController {
  final HiveProvider _provider = HiveProvider();
  var bookmarkData = <Articles>[].obs;

  List<Articles> fetchAllBookmark() {
    var result = _provider.fetchAllData();
    bookmarkData.value = result;
    bookmarkData.refresh();
    return result;
  }

  void removeBookmark(int index) {
    _provider.deleteDataFromHive(index);
  }

  @override
  void onInit() {
    fetchAllBookmark();
    super.onInit();
  }
}
