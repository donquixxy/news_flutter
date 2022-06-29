import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
          : ListView.builder(
              itemCount: controller.bookmarkData.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(controller.bookmarkData[index].title);
              },
            ),
    );
  }
}
