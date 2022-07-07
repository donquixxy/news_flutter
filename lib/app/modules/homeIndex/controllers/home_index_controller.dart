import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_flutter/app/data/_provider.dart';
import 'package:news_flutter/app/data/models/news_models.dart';

class HomeIndexController extends GetxController {
  var currentIndex = 0.obs;
  NewsProvider newsProvider = NewsProvider();

  var resultSearch = <NewsModel>[].obs;
  var isLoading = false.obs;

  List<BottomNavigationBarItem> listTab = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: Colors.teal,
        ),
        label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.bookmark,
          color: Colors.blueGrey,
        ),
        label: 'Bookmark'),
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
    update();
  }

  Future<NewsModel?> fetchQueryData(String query) async {
    isLoading.value = true;
    if (query.isNotEmpty) {
      var response = await NewsProvider().getDataWithQuery(query);

      if (resultSearch.isEmpty) {
        resultSearch.add(response!);
      } else if (resultSearch.isNotEmpty) {
        resultSearch.clear();
        resultSearch.add(response!);
        resultSearch.refresh();
      }

      isLoading.value = false;
      return response;
    } else {
      return null;
    }
  }
}
