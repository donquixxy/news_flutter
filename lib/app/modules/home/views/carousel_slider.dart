import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:news_flutter/app/routes/app_pages.dart';

class CarouselSliderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String noImageUrl =
        'http://pioneer-technical.com/wp-content/uploads/2016/12/news-placeholder.png';
    var controller = Get.find<HomeController>();
    return CarouselSlider(
      carouselController: controller.controllerCarousel,
      items: controller.test[0].articles
          .getRange(0, 6)
          .map(
            (dataArticles) => Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.DETAILS,
                              arguments: [dataArticles]);
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(8),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      dataArticles.urlToImage ?? noImageUrl,
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                  height: Get.mediaQuery.size.height * 0.3,
                                  placeholder: (context, url) =>
                                      Image.network(noImageUrl),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        left: 20,
                        right: 10,
                        child: Text(
                          dataArticles.title,
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                            shadows: [
                              Shadow(offset: Offset(1, 0), color: Colors.black),
                              Shadow(offset: Offset(2, 1), color: Colors.black),
                              Shadow(
                                  offset: Offset(2.2, 2), color: Colors.black)
                            ],
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: controller.test[0].articles
                        .asMap()
                        .entries
                        .map((e) => Obx(
                              () => GestureDetector(
                                onTap: () {
                                  var result =
                                      controller.carouselIndex.value = e.key;
                                  controller.controllerCarousel
                                      .animateToPage(result);
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 2, 4, 0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      controller.carouselIndex.value == e.key
                                          ? Icons.fiber_manual_record
                                          : Icons.fiber_manual_record_outlined,
                                      color: Colors.orange,
                                      size: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ))
                        .take(6)
                        .toList())
              ],
            ),
          )
          .toList()
          .reversed
          .toList(),
      options: CarouselOptions(
          onPageChanged: (index, reason) =>
              controller.carouselIndex.value = index,
          viewportFraction: 1,
          autoPlay: true,
          disableCenter: true),
    );
  }
}
