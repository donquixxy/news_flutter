// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_flutter/app/data/presentation/finance_tab_view.dart';
import 'package:news_flutter/app/data/presentation/sports_tab_view.dart';
import 'package:news_flutter/app/data/presentation/tech_tab.view.dart';
import 'package:news_flutter/app/modules/home/views/appbar_widget.dart';
import 'package:news_flutter/app/modules/home/views/carousel_slider.dart';
import 'package:news_flutter/app/modules/home/views/header_delegate.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 14),
      child: Obx(() => controller.test.isEmpty
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : NestedScrollView(
              physics: const BouncingScrollPhysics(),
              body: TabBarView(
                physics: const ClampingScrollPhysics(),
                controller: controller.tabController,
                children: [
                  TechView(),
                  FinanceView(),
                  SportsView(),
                ],
              ),
              headerSliverBuilder: (context, isScrolled) {
                return [
                  SliverAppBar(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    expandedHeight: Get.height * 0.2,
                    collapsedHeight: Get.height * 0.33,
                    flexibleSpace: const AppBarWidget(),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    floating: true,
                    delegate: HeaderDelegate(
                      TabBar(
                        physics: const BouncingScrollPhysics(),
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
                    ),
                  )
                ];
              },
            )),
    );
  }
}
