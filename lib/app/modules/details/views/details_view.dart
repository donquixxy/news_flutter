import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ListView(
            shrinkWrap: true,
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: controller.arguments.urlToImage!,
                    fit: BoxFit.cover,
                    height: constraints.maxHeight * 0.32,
                    width: double.infinity,
                  ),
                  SafeArea(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: ElevatedButton(
                        onPressed: () => Get.back(),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black26,
                          shape: const CircleBorder(),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
                    width: double.infinity,
                    height: constraints.maxHeight * 0.68,
                    margin: EdgeInsets.only(top: constraints.maxHeight * 0.3),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textWidgetBuilder(controller.arguments.title, 20),
                        const SizedBox(
                          height: 15,
                        ),
                        textWidgetBuilder(
                            'Written by : ${controller.arguments.author}', 16),
                        const SizedBox(
                          height: 10,
                        ),
                        textWidgetBuilder(controller.arguments.description, 14),
                        const SizedBox(
                          height: 5,
                        ),
                        textWidgetBuilder(controller.arguments.content, 14)
                      ],
                    ),
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget textWidgetBuilder(String text, double fontSize) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize),
    );
  }
}
