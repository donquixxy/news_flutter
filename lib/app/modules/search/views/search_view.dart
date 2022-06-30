import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SearchController());
    return ListView(
      padding: const EdgeInsets.all(14),
      physics: const BouncingScrollPhysics(),
      children: [
        TextField(
          onEditingComplete: controller.fetchQueryData,
          controller: controller.textController,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: controller.isLoading.isTrue
                  ? const SizedBox(
                      width: 10,
                      height: 10,
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        controller.fetchQueryData();
                      },
                    ),
              hintText: 'Search news topic  . . .'),
        ),
        const SizedBox(
          height: 20,
        ),
        Obx(
          () => controller.resultSearch.isEmpty
              ? const Center(
                  child: SizedBox(),
                )
              : ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.resultSearch[0].articles.length,
                  itemBuilder: (context, index) {
                    var data = controller.resultSearch[0].articles[index];
                    return Text(data.title);
                  },
                ),
        )
      ],
    );
  }
}
