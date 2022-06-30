import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_flutter/app/data/models/article_models.dart';
import 'package:news_flutter/app/modules/home/controllers/home_controller.dart';

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
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: dataArticles.urlToImage ?? noImageUrl,
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
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: controller.carouselIndex.value ==
                                                e.key
                                            ? Colors.orange.withOpacity(0.7)
                                            : Colors.grey.withOpacity(0.4)),
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
