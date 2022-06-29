import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_flutter/app/data/models/article_models.dart';
import 'package:news_flutter/app/routes/app_pages.dart';

import '../controllers/bookmark_controller.dart';

class BookmarkView extends GetView<BookmarkController> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BookmarkController());
    return Obx(
      () => controller.bookmarkData.isEmpty
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : RefreshIndicator(
              onRefresh: () async {
                controller.fetchAllBookmark();
              },
              child: LayoutBuilder(builder: (context, constraints) {
                return ListView.builder(
                  itemCount: controller.bookmarkData.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Articles data = controller.bookmarkData[index];
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(14, 8, 14, 2),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.DETAILS, arguments: [data]);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 6,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                    imageUrl: data.urlToImage!,
                                    fit: BoxFit.fitHeight,
                                    height: 120,
                                    width: constraints.maxWidth * 0.35),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.title,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text("by ${data.source.name}",
                                        style: TextStyle(
                                            color: Colors.grey.shade500))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
    );
  }
}
