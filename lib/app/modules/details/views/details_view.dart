import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ListView(
            physics: const BouncingScrollPhysics(),
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
                          primary: Colors.orange.shade600,
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
                        textWidgetBuilder(
                            controller.arguments.title, 20, FontWeight.bold),
                        const SizedBox(
                          height: 15,
                        ),
                        textWidgetBuilder(
                            'Written by : ${controller.arguments.author}', 16),
                        const SizedBox(
                          height: 10,
                        ),
                        textWidgetBuilder(
                            controller.arguments.description ??
                                'No Description',
                            14),
                        const SizedBox(
                          height: 5,
                        ),
                        textWidgetBuilder(controller.arguments.content, 14),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: OutlinedButton(
                            onPressed: () {
                              controller.addToBookmark();
                            },
                            style: OutlinedButton.styleFrom(
                                primary: Colors.orange.withOpacity(1),
                                visualDensity:
                                    VisualDensity.adaptivePlatformDensity,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                elevation: 3,
                                onSurface: Colors.orange,
                                surfaceTintColor: Colors.orange,
                                backgroundColor: Colors.white,
                                side: BorderSide(color: Colors.orange)),
                            child: Text(
                              "Save to Bookmark".toUpperCase(),
                              style:
                                  TextStyle(fontSize: 16, color: Colors.orange),
                            ),
                          ),
                        )
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

  Widget textWidgetBuilder(String text, double fontSize,
      [FontWeight weight = FontWeight.normal]) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: weight,
          fontSize: fontSize,
          fontFamily: GoogleFonts.notoSans().fontFamily),
    );
  }
}
