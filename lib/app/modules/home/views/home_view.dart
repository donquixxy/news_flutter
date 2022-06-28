import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
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
          child: Obx(() => controller.test.isEmpty
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
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl: data.urlToImage ??
                                        'https://chitradurga.nic.in/wp-content/themes/district-theme-9/images/news.jpg',
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator
                                            .adaptive(),
                                  ),
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
                )),
        ));
  }
}
