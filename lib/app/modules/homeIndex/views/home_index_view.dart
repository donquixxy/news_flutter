import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_flutter/app/data/articles_search.dart';
import 'package:news_flutter/app/data/hive_provider.dart';
import 'package:news_flutter/app/modules/bookmark/views/bookmark_view.dart';
import 'package:news_flutter/app/modules/home/views/home_view.dart';

import '../controllers/home_index_controller.dart';

class HomeIndexView extends GetView<HomeIndexController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('HomeIndexView'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: ArticleSearch());
              },
            ),
          ],
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: [
            HomeView(),
            BookmarkView(),
          ],
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
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     var asd = HiveProvider();

        //     // for (Articles data in asd.box.values) {
        //     //   print(data.author);
        //     // }
        //   },
        // ),
      ),
    );
  }
}
