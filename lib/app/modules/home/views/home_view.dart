import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.test.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  controller.getAllData();
                },
                child: ListView.builder(
                  itemCount: controller.test[0].articles.length,
                  itemBuilder: (context, index) {
                    var data = controller.test[0].articles[index];
                    return InkWell(
                      onTap: () {
                        print(controller.test[0].articles.length);
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Image.network(data.urlToImage),
                            Text(
                              data.title,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            )
                          ],
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
