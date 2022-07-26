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
              child: Text('No News Saved yet'),
            )
          : LayoutBuilder(
              builder: (context, constraints) {
                return RefreshIndicator(
                  onRefresh: () async {
                    await controller.fetchAllBookmark();
                  },
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.bookmarkData.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Articles data = controller.bookmarkData[index];
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(14, 8, 14, 2),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.DETAILS, arguments: [data]);
                          },
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    elevation: 6,
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: CachedNetworkImage(
                                              imageUrl: data.urlToImage!,
                                              fit: BoxFit.fitHeight,
                                              height: 120,
                                              width:
                                                  constraints.maxWidth * 0.35),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                      color:
                                                          Colors.grey.shade500))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: IconButton(
                                      onPressed: () {
                                        controller.removeBookmark(index);
                                      },
                                      icon: Icon(
                                        Icons.bookmark_remove,
                                        color: Colors.orange.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
