import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return ListView(
        shrinkWrap: true,
        children: [
          Stack(
            children: [
              Image.network(
                controller.arguments.urlToImage!,
                fit: BoxFit.cover,
                height: constraints.maxHeight * 0.32,
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(14, 10, 14, 12),
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
                      Text(
                        controller.arguments.title,
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Written by : ${controller.arguments.author}",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        controller.arguments.description,
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        controller.arguments.content,
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ))
            ],
          ),
        ],
      );
    }));
  }
}
