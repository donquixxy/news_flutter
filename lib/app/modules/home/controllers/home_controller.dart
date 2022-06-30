import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:news_flutter/app/data/_provider.dart';
import 'package:news_flutter/app/data/hive_provider.dart';
import 'package:news_flutter/app/data/models/article_models.dart';
import 'package:news_flutter/app/data/models/news_models.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  List<Tab> tabBarItems = [
    const Tab(
      text: "Tech",
    ),
    const Tab(
      text: "Finance",
    ),
    const Tab(
      text: "Sports",
    ),
  ];
  late TabController tabController;
  var test = <NewsModel>[].obs;
  ScrollController scrollController = ScrollController();
  final HiveProvider _provider = HiveProvider();
  var carouselIndex = 0.obs;
  late CarouselController controllerCarousel;
  var sportsData = <NewsModel>[].obs;
  var financeData = <NewsModel>[].obs;
  var techData = <NewsModel>[].obs;

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
  void onInit() async {
    tabController = TabController(length: tabBarItems.length, vsync: this);
    controllerCarousel = CarouselController();
    await getFinanceData();
    await getSportsData();
    await getTechData();
    await getAllData();
    super.onInit();
  }

  Future getFinanceData() async {
    var result = await NewsProvider().getFinanceData();

    if (financeData.isEmpty) {
      financeData.add(result!);
    } else if (financeData.isNotEmpty) {
      financeData.clear();
      financeData.add(result!);
      financeData.refresh();
    }
  }

  Future getSportsData() async {
    var result = await NewsProvider().getSportsData();

    if (sportsData.isEmpty) {
      sportsData.add(result!);
    } else if (sportsData.isNotEmpty) {
      sportsData.clear();
      sportsData.add(result!);
      sportsData.refresh();
    }
  }

  Future getTechData() async {
    var result = await NewsProvider().getTechData();

    if (techData.isEmpty) {
      techData.add(result!);
    } else if (techData.isNotEmpty) {
      techData.clear();
      techData.add(result!);
      techData.refresh();
    }
  }

  void addToFavoriteHive(Articles data) {
    _provider.addDataToHive(data);
  }
}
