import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_flutter/app/data/hive_provider.dart';
import 'package:news_flutter/app/modules/bookmark/views/bookmark_view.dart';
import 'package:news_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:news_flutter/app/modules/home/views/home_view.dart';

import '../controllers/home_index_controller.dart';

class HomeIndexView extends GetView<HomeIndexController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('HomeIndexView'),
          centerTitle: true,
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: [HomeView(), BookmarkView()],
        ),
        bottomNavigationBar: Visibility(
          child: BottomNavigationBar(
            selectedItemColor: Colors.teal.shade800,
            showUnselectedLabels: false,
            elevation: 10,
            type: BottomNavigationBarType.shifting,
            items: controller.listTab,
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeIndex,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            var asd = HiveProvider();

            print(asd.box.length);
          },
        ),
      ),
    );
  }
}
