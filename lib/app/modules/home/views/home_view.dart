import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_flutter/app/data/models/article_models.dart';
import 'package:news_flutter/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
        child: Obx(
          () => controller.test.isEmpty
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : RefreshIndicator(
                  onRefresh: controller.getAllData,
                  child: ListView.builder(
                    itemCount: controller.test[0].articles.length,
                    itemBuilder: (context, index) {
                      var data = controller.test[0].articles[index];
                      return InkWell(
                        onTap: () {
                          Get.toNamed(Routes.DETAILS, arguments: [data]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Stack(children: [
                                    CachedNetworkImage(
                                      imageUrl: data.urlToImage ??
                                          'https://chitradurga.nic.in/wp-content/themes/district-theme-9/images/news.jpg',
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator
                                              .adaptive(),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                        icon: Icon(Icons.favorite),
                                        onPressed: () {
                                          controller.addToFavoriteHive(data);

                                          // var data1 = Hive.box<Articles>(
                                          //         'newsBookmarks')
                                          //     .getAt(0);
                                          // print(data1!.source.name);
                                        },
                                        color: Colors.white,
                                      ),
                                    )
                                  ]),
                                ),
                                Text(
                                  data.title,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          // var result = Hive.box<Articles>('newsBookmarks').get(key);
          var data2 = await Hive.openBox<Articles>('newsBookmarks');
          // print(result!.title);
          print(data2.length);
          print(data2.values);
          for (Articles data5 in data2.values) {
            print(data5.title);
          }
        },
      ),
    );
  }
}
