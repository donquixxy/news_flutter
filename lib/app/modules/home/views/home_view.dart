import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:news_flutter/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 14),
      child: Obx(
        () => controller.test.isEmpty
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : RefreshIndicator(
                onRefresh: controller.getAllData,
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  physics: const BouncingScrollPhysics(),
                  controller: controller.scrollController,
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
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                      icon: const Icon(Icons.favorite),
                                      onPressed: () {
                                        controller.addToFavoriteHive(data);
                                      },
                                      color: Colors.white,
                                    ),
                                  )
                                ]),
                              ),
                              Text(
                                data.title,
                                maxLines: 2,
                                overflow: TextOverflow.clip,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
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
    );
  }
}
