import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:news_flutter/app/data/presentation/finance_tab_view.dart';
import 'package:news_flutter/app/data/presentation/sports_tab_view.dart';
import 'package:news_flutter/app/data/presentation/tech_tab.view.dart';
import 'package:news_flutter/app/modules/home/views/carousel_slider.dart';
import 'package:news_flutter/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 14),
      child: Obx(
        () => controller.test.isEmpty
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : RefreshIndicator(
                onRefresh: controller.getAllData,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const Text(
                      "Flutter News",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    CarouselSliderWidget(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Latest News",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TabBar(
                      physics: NeverScrollableScrollPhysics(),
                      indicatorColor: Colors.orange.withOpacity(0.8),
                      controller: controller.tabController,
                      tabs: controller.tabBarItems
                          .map(
                            (e) => Text(
                              e.text!,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18),
                            ),
                          )
                          .toList(),
                    ),
                    Container(
                      height: Get.mediaQuery.size.height * 0.5,
                      child: TabBarView(
                        physics: BouncingScrollPhysics(),
                        controller: controller.tabController,
                        children: [TechView(), FinanceView(), SportsView()],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
