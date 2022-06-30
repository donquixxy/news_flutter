import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_flutter/app/data/_provider.dart';
import 'package:news_flutter/app/data/models/news_models.dart';

class SearchController extends GetxController {
  final textController = TextEditingController();
  var resultSearch = <NewsModel>[].obs;
  var isLoading = false.obs;

  Future<NewsModel?> fetchQueryData() async {
    isLoading.value = true;
    if (textController.text.isNotEmpty) {
      var response = await NewsProvider().getDataWithQuery(textController.text);

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
