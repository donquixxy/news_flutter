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
                  physics: BouncingScrollPhysics(),
                  body: TabBarView(
                    physics: ClampingScrollPhysics(),
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
                        collapsedHeight: Get.height * 0.4,
                        flexibleSpace: AppBarWidget(),
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
                )
          // : RefreshIndicator(
          //     onRefresh: controller.getAllData,
          //     child: CustomScrollView(
          //       physics: ClampingScrollPhysics(),
          //       primary: true,
          //       shrinkWrap: true,
          //       slivers: [
          //         SliverToBoxAdapter(
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             mainAxisAlignment: MainAxisAlignment.start,
          //             children: [
          //               ///-----\\
          //               const Text(
          //                 "Flutter News",
          //                 style: TextStyle(
          //                     fontSize: 20, fontWeight: FontWeight.w600),
          //               ),
          //               CarouselSliderWidget(),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //               const Text(
          //                 "Latest News",
          //                 style: TextStyle(
          //                     fontSize: 24, fontWeight: FontWeight.w700),
          //               ),
          //             ],
          //           ),
          //         ),
          //         SliverAppBar(

          //           elevation: 0,
          //           backgroundColor: Colors.transparent,
          //           bottom: PreferredSize(
          //             preferredSize: Size.fromHeight(0),
          //             child: TabBar(
          //               physics: const NeverScrollableScrollPhysics(),
          //               indicatorColor: Colors.orange.withOpacity(0.8),
          //               controller: controller.tabController,
          //               tabs: controller.tabBarItems
          //                   .map(
          //                     (e) => Text(
          //                       e.text!,
          //                       style: const TextStyle(
          //                           color: Colors.grey,
          //                           fontWeight: FontWeight.w800,
          //                           fontSize: 18),
          //                     ),
          //                   )
          //                   .toList(),
          //             ),
          //           ),
          //         ),
          //         SliverToBoxAdapter(
          //           child: Container(
          //             height: Get.mediaQuery.size.height * 1,
          //             child: TabBarView(
          //               controller: controller.tabController,
          //               physics: BouncingScrollPhysics(),
          //               children: [TechView(), FinanceView(), SportsView()],
          //             ),
          //           ),
          //         )

          //         ///-----\\
          //         // const Text(
          //         //   "Flutter News",
          //         //   style:
          //         //       TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          //         // ),
          //         // CarouselSliderWidget(),
          //         // const SizedBox(
          //         //   height: 10,
          //         // ),
          //         // const Text(
          //         //   "Latest News",
          //         //   style:
          //         //       TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          //         // ),
          //         // const SizedBox(
          //         //   height: 15,
          //         // ),
          //         // TabBar(
          //         //   physics: const NeverScrollableScrollPhysics(),
          //         //   indicatorColor: Colors.orange.withOpacity(0.8),
          //         //   controller: controller.tabController,
          //         //   tabs: controller.tabBarItems
          //         //       .map(
          //         //         (e) => Text(
          //         //           e.text!,
          //         //           style: const TextStyle(
          //         //               color: Colors.grey,
          //         //               fontWeight: FontWeight.w800,
          //         //               fontSize: 18),
          //         //         ),
          //         //       )
          //         //       .toList(),
          //         // ),
          //         // SizedBox(
          //         //   height: Get.mediaQuery.size.height * 0.5,
          //         //   child: TabBarView(
          //         //     physics: const BouncingScrollPhysics(),
          //         //     controller: controller.tabController,
          //         //     children: [TechView(), FinanceView(), SportsView()],
          //         //   ),
          //         // )
          //       ],
          //     ),
          //   ),
          ),
    );
  }
}
