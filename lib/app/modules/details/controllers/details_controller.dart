import 'package:get/get.dart';
import 'package:news_flutter/app/data/hive_provider.dart';
import 'package:news_flutter/app/data/models/article_models.dart';

class DetailsController extends GetxController {
  Articles arguments = Get.arguments[0];

  addToBookmark() {
    HiveProvider().addDataToHive(arguments);
  }
}
